// Simple JavaScript functionality for the frontend

function showAlert() {
    alert('Welcome! This is a demo frontend built with Tailwind CSS.');
}

// Add smooth scrolling for anchor links
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Add active state to navigation links
    const navLinks = document.querySelectorAll('nav a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            navLinks.forEach(l => l.classList.remove('text-blue-600'));
            this.classList.add('text-blue-600');
        });
    });

    console.log('Frontend with Tailwind CSS loaded successfully!');
});

// Example of dynamic content loading
function loadContent(section) {
    console.log(`Loading content for: ${section}`);
    // Add your content loading logic here
}

// Export functions for use in other modules (if using ES modules)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        showAlert,
        loadContent
    };
}
