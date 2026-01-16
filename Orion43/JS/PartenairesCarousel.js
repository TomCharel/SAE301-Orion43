// Liste des images partenaires disponibles
const partenaireImages = [
    '../Image/ImageSite/logo/03_logo_dark_blue_082.bmp',
    '../Image/ImageSite/logo/150702_144927_083.jpg',
    '../Image/ImageSite/logo/2018-LOGO-DEPT43--300x59_058.jpg',
    '../Image/ImageSite/logo/2018-logo-REGION-300x149_057.png',
    '../Image/ImageSite/logo/20220516_142007_044.jpg',
    '../Image/ImageSite/logo/afa-nom-264x300_063.png',
    '../Image/ImageSite/logo/boutonslivres_078.jpg',
    '../Image/ImageSite/logo/btn-accueil_055.png',
    '../Image/ImageSite/logo/CALHL-V-sign_dessous-couleur-pour-écran-300x230_062.png',
    '../Image/ImageSite/logo/comcom-2018-300x89_059.png',
    '../Image/ImageSite/logo/drapeau-européen-feader-300x233_060.jpg',
    '../Image/ImageSite/logo/ed-logo-300x200_084.jpg',
    '../Image/ImageSite/logo/header-logo_077.png',
    '../Image/ImageSite/logo/LEADER-298x300_061.jpg',
    '../Image/ImageSite/logo/logo-1-300x134_081.png',
    '../Image/ImageSite/logo/logo-astusciences_065.png',
    '../Image/ImageSite/logo/logo-cite-230_076.png',
    '../Image/ImageSite/logo/logo-e1481710053335_001.png',
    '../Image/ImageSite/logo/Logo-quadri-nega-300x90_064.png',
    '../Image/ImageSite/logo/logo-static-300x113_088.png',
    '../Image/ImageSite/logo/logo-ville-2011_056.png',
    '../Image/ImageSite/logo/logoCMJN3003cmBordd-287x300_066.jpg',
    '../Image/ImageSite/logo/logo_cnes_carre3_080.png',
    '../Image/ImageSite/logo/logo_noir_2-300x33_086.png',
    '../Image/ImageSite/logo/oacc1_600-300x300_085.jpg',
    '../Image/ImageSite/logo/plan_045.png',
    '../Image/ImageSite/logo/projet-def-autocollant-2-300x213_067.png',
    '../Image/ImageSite/logo/siteon0_079.png',
    '../Image/ImageSite/logo/wpe5b5d13f_087.png'
];

// Fonction pour initialiser le carrousel
function initCarousel() {
    const carousel = document.querySelector('.partenaires-carousel');
    if (!carousel) return;

    // Créer le conteneur du carrousel
    const carouselTrack = document.createElement('div');
    carouselTrack.className = 'carousel-track';

    // Ajouter les images en double pour la boucle infinie
    const imagesToAdd = [...partenaireImages, ...partenaireImages];

    imagesToAdd.forEach((imgPath) => {
        const slide = document.createElement('div');
        slide.className = 'carousel-slide';
        
        const img = document.createElement('img');
        img.src = imgPath;
        img.alt = 'Partenaire';
        
        slide.appendChild(img);
        carouselTrack.appendChild(slide);
    });

    carousel.appendChild(carouselTrack);

    // Animer le carrousel
    let scrollAmount = 0;
    const slideWidth = 250; // Largeur de chaque slide en pixels
    const speed = 2; // Vitesse de défilement

    function animate() {
        scrollAmount += speed;
        
        // Réinitialiser la position quand on a défilé la moitié
        if (scrollAmount >= slideWidth * partenaireImages.length) {
            scrollAmount = 0;
        }

        carouselTrack.style.transform = `translateX(-${scrollAmount}px)`;
        requestAnimationFrame(animate);
    }

    // Démarrer l'animation
    animate();

    // Ajouter une pause au survol
    carousel.addEventListener('mouseenter', () => {
        carouselTrack.style.animationPlayState = 'paused';
    });

    carousel.addEventListener('mouseleave', () => {
        carouselTrack.style.animationPlayState = 'running';
    });
}

// Initialiser au chargement du DOM
document.addEventListener('DOMContentLoaded', initCarousel);
