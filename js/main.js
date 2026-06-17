// Magical Hands Day Spa — site behavior
// Extracted from the single-file redesign mockup for maintainability.

// ── Sticky Nav ──────────────────────
    const nav = document.getElementById('mainNav');
    window.addEventListener('scroll', () => {
      nav.classList.toggle('scrolled', window.scrollY > 20);
    });

    // ── Mobile Menu ─────────────────────
    const hamburger = document.getElementById('hamburger');
    const mobileMenu = document.getElementById('mobileMenu');

    hamburger.addEventListener('click', () => {
      const isOpen = mobileMenu.classList.toggle('open');
      hamburger.setAttribute('aria-expanded', isOpen);
    });

    function closeMobileMenu() {
      mobileMenu.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
    }

    // ── Service Filter ───────────────────
    function filterServices(category) {
      const cards = document.querySelectorAll('.service-card');
      const tabs  = document.querySelectorAll('.filter-tab');

      tabs.forEach(t => {
        const isActive = t.textContent.trim().toLowerCase() === category || (category === 'all' && t.textContent.trim() === 'All');
        t.classList.toggle('active', isActive);
        t.setAttribute('aria-selected', isActive);
      });

      cards.forEach(card => {
        const match = category === 'all' || card.dataset.category === category;
        card.style.display = match ? 'flex' : 'none';
      });
    }

    // ── Animated Counters ────────────────
    function animateCounter(el) {
      const target = parseInt(el.dataset.target);
      const suffix = target === 100 ? '%' : '+';
      const duration = 1600;
      const start = performance.now();

      function step(now) {
        const progress = Math.min((now - start) / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
        el.textContent = Math.floor(eased * target) + suffix;
        if (progress < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
    }

    // Trigger counters when About section is visible
    const counterEls = document.querySelectorAll('[data-target]');
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });

    counterEls.forEach(el => observer.observe(el));

    // ── Newsletter ───────────────────────
    function handleNewsletter(e) {
      e.preventDefault();
      const btn = e.target.querySelector('button');
      btn.textContent = '✓ Subscribed!';
      btn.disabled = true;
    }
