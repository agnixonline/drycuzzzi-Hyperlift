# Drycuzzi Landing Page — Static HTML/CSS

A fully self-contained HTML/CSS/JS landing page converted from the original Next.js project.
No build step required — just open `index.html` or serve it with Docker.

---

## File Structure

```
drycuzzi/
├── index.html          ← The entire site (HTML + CSS + JS, single file)
├── Dockerfile          ← Docker image using nginx:alpine
├── nginx.conf          ← nginx config (gzip, caching, security headers)
├── docker-compose.yml  ← One-command local / server deployment
├── README.md           ← This file
└── public/
    ├── images/         ← All site images & GIFs
    └── videos/         ← Hero video (if used)
```

---

## Option 1 — Open Directly in a Browser

No server needed for basic viewing:

```bash
open index.html
# or double-click index.html in Finder / File Explorer
```

> Note: Some browsers block local GIF/image loading via `file://`. If images don't show,
> use one of the server options below.

---

## Option 2 — Docker (Recommended for Starlight™ Hyperlift)

### Prerequisites
- Docker installed on the Hyperlift unit or host machine.

### Build & Run

```bash
# 1. Build the image
docker build -t drycuzzi .

# 2. Run the container
docker run -d --name drycuzzi-site -p 80:80 --restart unless-stopped drycuzzi

# Site is now live at http://localhost
```

### With Docker Compose (easier)

```bash
docker compose up -d
# or for older Docker:
docker-compose up -d
```

Stop / remove:
```bash
docker compose down
```

### Rebuild after updating files

```bash
docker compose up -d --build
```

---

## Option 3 — Any Static Web Server

**Python (quick dev server):**
```bash
python3 -m http.server 8080
# → http://localhost:8080
```

**Node.js (npx serve):**
```bash
npx serve .
# → http://localhost:3000
```

**PHP:**
```bash
php -S localhost:8080
```

---

## Linking to Your Starlight™ Hyperlift

The Hyperlift typically runs a local web kiosk or browser in kiosk mode.
Point it to the container's address:

| Scenario | URL |
|---|---|
| Running on the Hyperlift itself | `http://localhost` |
| Running on a local server | `http://<server-ip>` |
| Docker on alternate port | `http://localhost:8080` |

If your Hyperlift uses a custom domain or DNS entry, set `server_name` in `nginx.conf`
to match (e.g. `server_name drycuzzi.local;`).

---

## Customisation

All styles and layout are in `index.html` under the `<style>` tag.
Key CSS variables at the top of the style block:

```css
:root {
  --bg:    #0a0a0f;   /* page background */
  --cyan:  #00d4ff;   /* primary accent */
  --gold:  #c9a962;   /* secondary accent */
}
```

Images live in `public/images/` — replace any file with the same name to update it.

---

## Dependencies (loaded from CDN)

| Library | Purpose | CDN |
|---|---|---|
| Lucide Icons | SVG icon set | unpkg.com |
| Google Fonts | Syne + DM Sans | fonts.googleapis.com |
| YouTube Embed | Demo video | youtube.com |

The site works offline except for the YouTube embed and fonts (fonts fall back to system sans-serif).
To fully offline-enable, download the fonts and replace the `<link>` tags.
