// Gestion du formulaire de réservation
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('reservationForm');
    const evenementSelect = document.getElementById('evenementSelect');
    const evenementDetails = document.getElementById('evenementDetails');
    const formMessage = document.getElementById('formMessage');
    
    // Charger les événements disponibles
    fetch('../PHP/API/evenements.php')
        .then(response => response.json())
        .then(data => {
            if (data.success && data.evenements.length > 0) {
                evenementSelect.innerHTML = '<option value="">Choisir un événement</option>';
                data.evenements.forEach(event => {
                    const date = new Date(event.date_event);
                    const dateFormatted = date.toLocaleDateString('fr-FR', {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                    });
                    
                    const option = document.createElement('option');
                    option.value = event.evenement_id;
                    option.textContent = `${event.titre} - ${dateFormatted} (${event.places_disponibles} places disponibles)`;
                    option.dataset.description = event.description;
                    option.dataset.places = event.places_disponibles;
                    evenementSelect.appendChild(option);
                });
            } else {
                evenementSelect.innerHTML = '<option value="">Aucun événement disponible pour le moment</option>';
            }
        })
        .catch(error => {
            console.error('Erreur:', error);
            evenementSelect.innerHTML = '<option value="">Erreur de chargement</option>';
        });
    
    // Afficher les détails de l'événement sélectionné
    evenementSelect.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        if (selectedOption.value && selectedOption.dataset.description) {
            evenementDetails.innerHTML = `
                <p><strong>Description :</strong> ${selectedOption.dataset.description}</p>
                <p><strong>Places disponibles :</strong> ${selectedOption.dataset.places}</p>
            `;
            evenementDetails.style.display = 'block';
        } else {
            evenementDetails.style.display = 'none';
        }
    });
    
    // Gérer la soumission du formulaire
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(form);
        const submitButton = form.querySelector('button[type="submit"]');
        
        // Désactiver le bouton pendant l'envoi
        submitButton.disabled = true;
        submitButton.textContent = 'Envoi en cours...';
        
        fetch('../PHP/reservation.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            formMessage.style.display = 'block';
            formMessage.className = 'form-message ' + (data.success ? 'success' : 'error');
            formMessage.textContent = data.message;
            
            if (data.success) {
                form.reset();
                evenementDetails.style.display = 'none';
                // Recharger les événements pour mettre à jour les places disponibles
                setTimeout(() => {
                    location.reload();
                }, 2000);
            }
            
            // Réactiver le bouton
            submitButton.disabled = false;
            submitButton.textContent = 'Réserver';
        })
        .catch(error => {
            console.error('Erreur:', error);
            formMessage.style.display = 'block';
            formMessage.className = 'form-message error';
            formMessage.textContent = 'Une erreur est survenue. Veuillez réessayer.';
            
            submitButton.disabled = false;
            submitButton.textContent = 'Réserver';
        });
    });
});
