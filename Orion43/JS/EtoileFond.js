/**
 * Starfield Animation - Three.js
 * 
 * Crée un arrière-plan animé avec un ciel étoilé 3D
 * 
 * Usage:
 * 1. Ajouter un canvas dans le HTML : <canvas id="space"></canvas>
 * 2. Importer et initialiser le script :
 *    <script type="module">
 *      import { initStarfield } from './starfield.js';
 *      initStarfield('space'); // ID du canvas
 *    </script>
 * 
 * Options CSS:
 * - Le canvas doit être positionné en fixed pour l'arrière-plan
 * - Ajouter pointer-events: none pour ne pas bloquer les interactions
 * - z-index bas pour rester en arrière-plan
 */

import * as THREE from "https://unpkg.com/three@0.160.0/build/three.module.js";

  // ---------- CONFIG ----------
  const STAR_COUNT = 7000;
  const FIELD_SIZE = 1300;
  const FLOAT_SPEED = 0.3;
  const TWINKLE_SPEED = 3.5;

  const canvas = document.getElementById("space");

  const renderer = new THREE.WebGLRenderer({
    canvas,
    antialias: true,
    alpha: true,
  });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 3000);
  camera.position.z = 100;
  camera.lookAt(0, 0, 0); // Centrer la caméra sur l'origine

  // ---------- Texture ronde pour les étoiles ----------
  function makeStarTexture(size = 64) {
    const c = document.createElement("canvas");
    c.width = c.height = size;
    const ctx = c.getContext("2d");

    const g = ctx.createRadialGradient(size/2, size/2, 0, size/2, size/2, size/2);
    g.addColorStop(0.0, "rgba(255,255,255,1)");
    g.addColorStop(0.3, "rgba(255,255,255,0.8)");
    g.addColorStop(1.0, "rgba(255,255,255,0)");

    ctx.fillStyle = g;
    ctx.fillRect(0, 0, size, size);

    const tex = new THREE.CanvasTexture(c);
    tex.needsUpdate = true;
    return tex;
  }

  const starTexture = makeStarTexture(64);

  // ---------- Créer les étoiles ----------
  const positions = new Float32Array(STAR_COUNT * 3);
  const opacities = new Float32Array(STAR_COUNT);

  function rand(min, max) { 
    return min + Math.random() * (max - min); 
  }

  for (let i = 0; i < STAR_COUNT; i++) {
    positions[i * 3 + 0] = rand(-FIELD_SIZE, FIELD_SIZE);
    positions[i * 3 + 1] = rand(-FIELD_SIZE, FIELD_SIZE);
    positions[i * 3 + 2] = rand(-FIELD_SIZE, FIELD_SIZE);
    opacities[i] = Math.random();
  }

  const geometry = new THREE.BufferGeometry();
  geometry.setAttribute("position", new THREE.BufferAttribute(positions, 3));
  geometry.setAttribute("opacity", new THREE.BufferAttribute(opacities, 1));
  
  // Centrer la géométrie
  geometry.center();

  // ---------- Générer couleurs aléatoires ----------
  function generateRandomColor() {
    const colorType = Math.random();
    let r, g, b;
    
    if (colorType < 0.3) {
      // Blanc / Jaune chaud
      r = 1;
      g = 0.85 + Math.random() * 0.15;
      b = 0.6 + Math.random() * 0.2;
    } else if (colorType < 0.6) {
      // Bleu froid
      r = 0.7 + Math.random() * 0.2;
      g = 0.85 + Math.random() * 0.15;
      b = 1;
    } else if (colorType < 0.85) {
      // Rouge / Orange
      r = 1;
      g = 0.5 + Math.random() * 0.4;
      b = 0.3 + Math.random() * 0.3;
    } else {
      // Blanc pur
      r = 1;
      g = 1;
      b = 1;
    }
    
    return { r, g, b };
  }

  // Créer les couleurs avec randomisation
  const colors = new Float32Array(STAR_COUNT * 3);
  for (let i = 0; i < STAR_COUNT; i++) {
    const color = generateRandomColor();
    colors[i * 3 + 0] = color.r;
    colors[i * 3 + 1] = color.g;
    colors[i * 3 + 2] = color.b;
  }
  geometry.setAttribute("color", new THREE.BufferAttribute(colors, 3));

  const material = new THREE.PointsMaterial({
    map: starTexture,
    color: 0xffffff,
    size: 2,
    sizeAttenuation: true,
    transparent: true,
    opacity: 1,
    depthWrite: false,
    blending: THREE.AdditiveBlending,
    vertexColors: true,
  });

  const stars = new THREE.Points(geometry, material);
  scene.add(stars);

  // ---------- Resize ----------
  function resize() {
    const w = window.innerWidth;
    const h = window.innerHeight;
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  }
  window.addEventListener("resize", resize);
  resize();

  // ---------- Scroll parallax avec lissage ----------
  let scrollY = 0;
  let smoothScrollY = 0;  // Scroll lissé
  
  let lastScrollY = 0;

  window.addEventListener("scroll", () => {
    const newScrollY = window.scrollY;
    lastScrollY = newScrollY;
    scrollY = newScrollY;
  }, { passive: true });

  // ---------- Animation ----------
  let totalTime = 0;

  function tick() {
    requestAnimationFrame(tick);
    totalTime += 0.016;

    const opacityAttr = geometry.getAttribute("opacity");
    const opacityArr = opacityAttr.array;

    // Lissage progressif du scroll (décélération progressive)
    smoothScrollY = THREE.MathUtils.lerp(smoothScrollY, scrollY, 0.1);

    // Flottement lent
    const floatX = Math.sin(totalTime * FLOAT_SPEED * 0.5) * 15;
    const floatY = Math.cos(totalTime * FLOAT_SPEED * 0.3) * 15;
    
    // Parallax du scroll très léger (lissé)
    const parallaxZ = smoothScrollY * 0.1; // Axe Z léger
    const parallaxY = smoothScrollY * 0.05; // Axe Y léger

    stars.position.x = floatX;
    stars.position.y = floatY + parallaxY;
    stars.position.z = parallaxZ;

    // Scintillement des étoiles
    for (let i = 0; i < STAR_COUNT; i++) {
      // Chaque étoile a son propre scintillement
      const twinkle = Math.sin(totalTime * TWINKLE_SPEED + i * 0.1) * 0.5 + 0.5;
      opacityArr[i] = 0.2 + twinkle * 0.8; // Entre 0.2 et 1 - scintillement augmenté
    }
    opacityAttr.needsUpdate = true;

    renderer.render(scene, camera);
  }

  tick();
