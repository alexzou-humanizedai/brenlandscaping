# BREN Landscaping LLC — brenlandscaping.com

Redesigned marketing site for BREN Landscaping, an owner-operated residential
landscaping company in Connecticut. Single-page, mobile-first, static —
no build step required. Open `index.html` or deploy the folder as-is to any
static host (Netlify, Vercel, GitHub Pages, cPanel, etc.).

## Structure

```
index.html        The whole site (hero, services, portfolio, why BREN, testimonials, contact)
css/styles.css    All styling — palette and type scale live in :root variables at the top
js/main.js        Mobile nav, sticky header, scroll-reveal, quote form handler
images/           SVG placeholder artwork (see below)
```

## Before launch — swap the placeholders

1. **Project photos** — every file in `images/` (except `favicon.svg`) is a
   styled SVG placeholder. Replace them with real project photos using the
   same filenames (JPGs are fine — update the `src` extensions in
   `index.html`). `hero.svg` is the full-bleed hero background;
   `gallery-1…8` fill the portfolio grid and service cards;
   `dennis.svg` is the owner portrait in the "Why BREN" section.
2. **Testimonials** — the three quotes in the Testimonials section are
   placeholder copy written to match the brand voice. Replace with real
   client reviews (names/towns included only with permission).
3. **Email address** — the site uses `dennis@brenlandscaping.com` in the
   contact section and form handler (`js/main.js`). Confirm or update.
4. **Quote form backend** — the form currently opens the visitor's email app
   pre-filled (works with zero setup). For a hosted form, point the form's
   `action` at Formspree/Netlify Forms/etc. and delete the submit handler in
   `js/main.js`.
5. **Service area & hours** — the site names Fairfield, Southport, Westport,
   Easton, Weston, Trumbull, Stratford, Monroe, Shelton, and Milford, with
   hours Mon–Sat 7am–6pm. Confirm the town list and hours with Dennis.
6. **Portfolio captions** — gallery captions carry example town names for
   local SEO. Match each caption to where the real project was actually built.
7. **Canonical domain** — SEO tags, `robots.txt`, and `sitemap.xml` assume
   `https://brenlandscaping.com/` (non-www). If the site resolves at
   `www.brenlandscaping.com`, update the canonical/OG URLs and sitemap, and
   301-redirect the other host.
8. **og:image** — currently points at the SVG hero. Once real photos are in,
   swap it for a 1200×630 JPG for clean social sharing previews.

## Local SEO

Targeted at "landscaping Fairfield CT" and surrounding-town searches:

- Location-led `<title>`, meta description, and Open Graph/Twitter tags.
- `HomeAndConstructionBusiness` JSON-LD with phone, hours, geo, service
  offers, and `areaServed` covering ten Fairfield County towns.
- `FAQPage` JSON-LD mirrored by a visible FAQ section on the page.
- Town names woven into hero, portfolio captions, image alt text, contact
  service area, and footer.
- `robots.txt` + single-URL `sitemap.xml`. After launch: submit the sitemap
  in Google Search Console and create/claim a **Google Business Profile** for
  BREN Landscaping — for a local service business that matters more than any
  on-page factor.

## Design notes

- **Palette:** deep forest green (`#0e1c14`–`#2c4a35`) with warm cream
  (`#f7f2e6`) and an amber accent (`#c9863f`) for CTAs.
- **Type:** Playfair Display (serif, headlines) + Inter (sans, body), loaded
  from Google Fonts with Georgia/system fallbacks.
- **One CTA per section**, with the phone number — (203) 895-3458 — surfaced
  in the nav, hero, portfolio, contact, and footer.
