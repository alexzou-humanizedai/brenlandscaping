# BREN Landscaping LLC — brenlandscaping.com

Redesigned marketing site for BREN Landscaping, an owner-operated residential
landscaping company in Connecticut. Single-page, mobile-first, static —
no build step required. Open `index.html` or deploy the folder as-is to any
static host (Netlify, Vercel, GitHub Pages, cPanel, etc.).

## Structure

```
index.html        The whole site (hero, services, portfolio, why BREN, testimonials, FAQ, contact)
blog/             "Advice" content hub for the monthly SEO/AEO plan (see below)
css/styles.css    All styling — palette and type scale live in :root variables at the top
js/main.js        Mobile nav, sticky header, scroll-reveal, quote form handler
images/           SVG placeholder artwork (see below)
robots.txt        Crawl rules + sitemap pointer
sitemap.xml       All indexable URLs — add each new blog post here
```

## Before launch — swap the placeholders

1. **Project photos** — the committed `images/*.svg` files are styled
   placeholders. A set of photorealistic replacements was generated with
   Higgsfield (2K, editorial style); run `bash tools/fetch-images.sh` from
   the repo root **on your own machine** to download them into `images/` and
   switch every reference over automatically (the remote build environment
   could not reach Higgsfield's CDN; links may expire, so run it soon — the
   images also live in the Higgsfield account library).
   ⚠️ These are AI-generated scenes, not BREN's actual work. They're a big
   visual upgrade over the SVGs for launch, but the portfolio section
   presents them as completed projects — replace them with photos of real
   jobs as soon as possible, both for honesty and because genuine local
   photos perform better in search. `dennis.svg` is still a placeholder —
   use a real photo of Dennis, never a generated one.
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
- `robots.txt` + `sitemap.xml`. After launch: submit the sitemap
  in Google Search Console and create/claim a **Google Business Profile** for
  BREN Landscaping — for a local service business that matters more than any
  on-page factor.

## Monthly content plan (SEO + AEO)

The `blog/` directory ("Advice" in the nav) is the publishing space for a
monthly SEO/AEO retainer. Two starter posts and a template are included:

- `blog/index.html` — the hub page listing all articles
- `blog/paver-patio-cost-fairfield-county-ct.html` — cost/"how much" post
- `blog/best-time-to-plant-trees-shrubs-connecticut.html` — seasonal/how-to post
- `blog/_template.html` — copy this for each new post; every TODO marks a
  required field and the header comment documents the full publishing
  checklist (slug, index card, Blog JSON-LD entry, sitemap entry)

Each post is structured for answer engines as much as search engines:

- **Quick Answer box** in the first screenful — the block featured snippets
  and AI assistants (ChatGPT, Perplexity, Google AI Overviews) quote
- **Question-style H1/H2s** matching how people actually phrase searches
- **BlogPosting + BreadcrumbList + FAQPage JSON-LD** on every post, with
  Dennis as a named author for E-E-A-T
- **Local grounding** — town names, CT climate/zone facts, real price ranges

Post ideas for upcoming months (one per month, cost/"how much" topics tend
to earn the most local traffic): landscape lighting cost, fall cleanup
checklist, stone wall repair vs. rebuild, lawn renovation timing,
firepit vs. fireplace, drainage fixes for wet yards, deer-resistant
plantings for Fairfield County.

⚠️ The two starter posts contain 2026 price ranges and practices written to
be plausible for the market — **have Dennis confirm every number before
launch** so the content reflects his actual pricing and methods.

## Design notes

- **Palette:** deep forest green (`#0e1c14`–`#2c4a35`) with warm cream
  (`#f7f2e6`) and an amber accent (`#c9863f`) for CTAs.
- **Type:** Playfair Display (serif, headlines) + Inter (sans, body), loaded
  from Google Fonts with Georgia/system fallbacks.
- **One CTA per section**, with the phone number — (203) 895-3458 — surfaced
  in the nav, hero, portfolio, contact, and footer.
