// Optional JavaScript for subtle animations and enhancements
// The site works perfectly without this file!

document.addEventListener('DOMContentLoaded', function() {
    
    // Add a subtle fade-in animation for content
    const contentElements = document.querySelectorAll('.content-card, .hero');
    contentElements.forEach(element => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(10px)';
        element.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
        
        // Trigger animation after a brief delay
        setTimeout(() => {
            element.style.opacity = '1';
            element.style.transform = 'translateY(0)';
        }, 100);
    });

    // Simple hover effects for interactive elements
    const hoverElements = document.querySelectorAll('.project-item, .info-item, .resource-item');
    hoverElements.forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
            this.style.transition = 'transform 0.2s ease';
        });
        
        item.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
});
