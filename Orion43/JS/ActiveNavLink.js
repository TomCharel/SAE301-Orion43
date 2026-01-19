/**
 * Script pour mettre en évidence le lien de navigation actif
 * Ajoute une classe 'active' au lien correspondant à la page actuelle
 */

document.addEventListener('DOMContentLoaded', function() {
    // Récupérer l'URL actuelle et extraire le nom du fichier
    const currentLocation = location.pathname;
    const currentFileName = currentLocation.split('/').pop() || 'Index.html';
    
    // Récupérer tous les liens de navigation
    const navLinks = document.querySelectorAll('.nav-link');
    
    // Parcourir chaque lien de navigation
    navLinks.forEach(link => {
        // Obtenir le href du lien
        const linkHref = link.getAttribute('href');
        
        // Extraire le nom de fichier du href
        const linkFileName = linkHref.split('/').pop();
        
        // Comparer les noms de fichiers (insensible à la casse)
        if (linkFileName.toLowerCase() === currentFileName.toLowerCase()) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
});
