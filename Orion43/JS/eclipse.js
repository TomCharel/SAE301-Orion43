document.addEventListener("DOMContentLoaded", () => {

    const eclipseDiv = document.getElementById("eclipse");

    if (!eclipseDiv) {
        console.error("ID eclipse introuvable");
        return;
    }

    // Prochaine éclipse solaire (29 mars 2025)
    const eclipseDate = new Date(Date.UTC(2025, 2, 29, 10, 0, 0));

    function updateEclipse() {
        const now = new Date();
        const diff = eclipseDate - now;

        if (diff <= 0) {
            eclipseDiv.innerHTML = "🌞 L’éclipse solaire a commencé ou est terminée.";
            return;
        }

        const days = Math.floor(diff / (1000 * 60 * 60 * 24));
        const hours = Math.floor((diff / (1000 * 60 * 60)) % 24);
        const minutes = Math.floor((diff / (1000 * 60)) % 60);
        const seconds = Math.floor((diff / 1000) % 60);

        eclipseDiv.innerHTML = `
            ⏳ ${days} jours ${hours}h ${minutes}m ${seconds}s
        `;
    }

    updateEclipse();
    setInterval(updateEclipse, 1000);
});
