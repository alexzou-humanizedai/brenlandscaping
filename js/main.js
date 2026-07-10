/* BREN Landscaping — site behavior */

(function () {
  "use strict";

  var header = document.querySelector(".site-header");
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.getElementById("site-nav");

  // Solid header once the user scrolls past the top of the hero
  function onScroll() {
    header.classList.toggle("scrolled", window.scrollY > 40);
  }
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  // Mobile menu
  function closeNav() {
    document.body.classList.remove("nav-open");
    toggle.setAttribute("aria-expanded", "false");
    toggle.setAttribute("aria-label", "Open menu");
  }

  toggle.addEventListener("click", function () {
    var open = document.body.classList.toggle("nav-open");
    toggle.setAttribute("aria-expanded", String(open));
    toggle.setAttribute("aria-label", open ? "Close menu" : "Open menu");
  });

  nav.addEventListener("click", function (e) {
    if (e.target.closest("a")) closeNav();
  });

  document.addEventListener("keydown", function (e) {
    if (e.key === "Escape") closeNav();
  });

  // Scroll-in reveal
  if ("IntersectionObserver" in window) {
    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add("in");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12 }
    );
    document.querySelectorAll(".reveal").forEach(function (el) {
      observer.observe(el);
    });
  } else {
    document.querySelectorAll(".reveal").forEach(function (el) {
      el.classList.add("in");
    });
  }

  // Quote form — opens a pre-filled email until a form backend is connected.
  // To use a hosted backend instead (Formspree, Netlify Forms, etc.), set the
  // form's `action` and remove this handler; see README.md.
  var form = document.getElementById("quote-form");
  var status = document.getElementById("form-status");

  if (form) form.addEventListener("submit", function (e) {
    e.preventDefault();

    if (!form.reportValidity()) return;

    var data = new FormData(form);
    var body =
      "Name: " + data.get("name") + "\n" +
      "Phone: " + data.get("phone") + "\n" +
      "Email: " + (data.get("email") || "—") + "\n" +
      "Interested in: " + data.get("service") + "\n\n" +
      (data.get("message") || "");

    var subject = "Free quote request from " + data.get("name");
    window.location.href =
      "mailto:dennis@brenlandscaping.com?subject=" +
      encodeURIComponent(subject) +
      "&body=" +
      encodeURIComponent(body);

    status.textContent = "Opening your email app — or just call (203) 895-3458.";
    status.classList.add("visible");
  });

  // Footer year
  var year = document.getElementById("year");
  if (year) year.textContent = String(new Date().getFullYear());
})();
