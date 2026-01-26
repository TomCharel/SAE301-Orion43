// Coordonnées Paris (modifiable)
const lat = 48.8566;
const lon = 2.3522;

// Création carte
const map = L.map("night-map").setView([lat, lon], 6);

// Carte sombre (mode nuit)
L.tileLayer("https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png", {
    attribution: "© OpenStreetMap & CartoDB"
}).addTo(map);

// Appel API Open-Meteo
fetch(`https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`)
    .then(res => res.json())
    .then(data => {
        const temp = data.current_weather.temperature;
        const wind = data.current_weather.windspeed;

        L.marker([lat, lon])
            .addTo(map)
            .bindPopup(`
                🌡️ Température : ${temp}°C<br>
                💨 Vent : ${wind} km/h<br>
                🌙 Météo nocturne
            `)
            .openPopup();
    })
    .catch(() => {
        alert("Erreur météo nocturne");
    });
