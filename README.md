# Magical Hands Day Spa — Website Rebuild

Static rebuild of the design mockup, restructured for GitHub Pages + Hostinger
(DNS only). HTML/CSS/JS split into separate files; content corrected against
the live site where the mockup had placeholder or fabricated data.

## What changed from the original mockup file

These are factual corrections, not style changes — the visual design is untouched.

| Item | Mockup had | Now has | Why |
|---|---|---|---|
| Phone | `+1 (876) [your number]` | `+1 (876) 995-6815` | Verified via Facebook page & Tripadvisor |
| Email | `info@magicalhandsdayspa.com` | `magicalhandsdayspa@gmail.com` | Verified as the actively-used address |
| Address | "Negril, Jamaica" | "Board Walk Shopping Village, Shop 24, Norman Manley Blvd" | Verified via Facebook page |
| Hot Stone Reflexology duration | 60 min | 30 min | Live booking system lists this as 30 min |
| "Aroma Fusion Body Scrub" $125/75min | One invented item | Split into "Body Scrub" $110/60min and "Body Wrap" $120/60min | Matched neither real item; these two are what's actually in the live booking system |
| Booking step 3 / payment badges | "Pay Securely Online" via Stripe/PayPal | "Confirm Your Booking" / pay on arrival | You confirmed the real booking plugin doesn't process payments |
| Booking widget | Iframe pointed at a SimplyBook.me account that doesn't exist | Placeholder with a call-to-book CTA | The mockup assumed a tool that was never set up |

## Still needs confirming with your aunt before launch

- **"Sports Massage" ($100, 60min)** — no exact match in the live booking system. Price and duration match "Hot Stone Massage" there exactly, so this may be the same service under a different name, or a real separate offering. Flagged with an HTML comment above that service card in `index.html`.
- **"Hair Braiding"** — doesn't appear in the live booking system at all. May be real but phone/walk-in only, or aspirational. Flagged the same way.
- **Business hours** ("Mon–Sat: 9 AM–6 PM") — carried over from the mockup unverified. Confirm before launch.
- **Which booking tool replaces the current plugin.** Check wp-admin → Plugins for the name of what's active now, then see the TODO comment in the `<section class="booking">` block in `index.html` for what to do with that information.

## Image migration (do this before cancelling Hostinger hosting)

Every image in this site currently hotlinks to the live WordPress media library
(`magicalhandsdayspa.com/wp-content/uploads/...`). That works fine while
Hostinger hosting is still active, and breaks the moment it isn't.

`images/MANIFEST.txt` lists all 12 URLs in use. Before the old hosting is
cancelled: download each one, drop it in this `images/` folder, then update
the matching `src=` in `index.html` to the local path (e.g.
`images/Omar.jpg` instead of the full WordPress URL).

## Local preview

No build step — open `index.html` directly in a browser, or serve it locally:

```
cd magical-hands-website
python3 -m http.server 8000
```

Then visit `http://localhost:8000`.

## Deploying to GitHub Pages

```
cd magical-hands-website
git init
git add .
git commit -m "Initial static rebuild"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo-name>.git
git push -u origin main
```

Then in the repo on GitHub: **Settings → Pages → Source → Deploy from branch
→ main → / (root)**. The `CNAME` file already in this repo tells GitHub Pages
which custom domain to serve.

## Hostinger DNS records (point the domain at GitHub Pages)

In Hostinger hPanel → Domains → DNS / Name Servers → DNS Zone Editor, set:

| Type | Name | Value |
|---|---|---|
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |
| CNAME | www | `<your-username>.github.io` |

Propagation can take a few minutes to a few hours. GitHub issues a free HTTPS
certificate automatically once DNS resolves correctly — check the repo's
Pages settings for "Enforce HTTPS" once it's available.

## Order of operations (recap)

1. Confirm the open items above with your aunt.
2. Decide and set up the real booking tool; update the placeholder block in `index.html`.
3. Download and migrate the 12 images per `images/MANIFEST.txt`.
4. Push this repo to GitHub, enable Pages.
5. Update Hostinger DNS per the table above.
6. Confirm the live site loads correctly on both the apex domain and `www`, over HTTPS.
7. Check hPanel → Emails for any active mailbox on the domain before downgrading or cancelling the Hostinger hosting plan.
