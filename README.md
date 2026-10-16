# kodybrown.com

A small, static personal website, hosted on GitHub Pages at
[www.kodybrown.com](https://www.kodybrown.com/).

## Editing

- `index.html` is the personal introduction and links to my other sites.
- `resume.html` embeds `KodyBrown-Resume.pdf` in the page using the browser's
  native PDF viewer. It also includes an expandable HTML text version; update
  both versions together when changing résumé content.
- `css/personal.css` is the hand-authored stylesheet used by both pages.
- Both page headers include the same contact and profile links; update them
  together.
  Local SVG icons and their upstream license are in `images/social/`.
- `resume_cover.html` and `resume_print.html` forward existing bookmarks to
  `resume.html`; Home and Résumé are the only content pages in the navigation.

The active pages have no JavaScript, framework, external fonts, package install,
or build step. Edit the HTML and `css/personal.css` directly. The retired Sass,
Bootstrap, JavaScript, and build configuration files have been removed; their
committed versions remain available in Git history.

## Favicon artwork

The browser favicon uses the hand-edited `favicon16.png`, `favicon24.png`,
`favicon32.png`, and `favicon64.png`. Each PNG supplies its own size inside
`favicon.ico` without resizing. Both pages also link directly to `favicon64.png`.

To rebuild the ICO from those four drawings:

```powershell
magick favicon16.png favicon24.png favicon32.png favicon64.png favicon.ico
```

All other icon images derive from `favicon64.png`. `favicon.png` is an identical
copy; the larger icons use nearest-neighbor scaling to preserve the drawing's
pixel edges and colors. `images/favicon-master.png` is a 512-pixel export for the
manifest, not an independent source drawing. Edit the hand-drawn PNGs first.

To rebuild the remaining images with ImageMagick:

```powershell
Copy-Item -LiteralPath favicon64.png -Destination favicon.png
magick favicon64.png -filter point -resize 192x192 -strip icon.png
magick favicon64.png -filter point -resize 180x180 -strip apple-touch-icon.png
magick favicon64.png -filter point -resize 512x512 -strip images/favicon-master.png
magick favicon64.png -filter point -resize 558x558 -strip tile.png
magick favicon64.png -filter point -resize 256x256 -gravity center -background none -extent 558x270 -strip tile-wide.png
```

## Preview

From PowerShell:

```powershell
cd C:\Users\kodyb\Projects\KodyBrown.com\www.kodybrown.com
gostatic.exe -path . -port 8081
```

Open <http://localhost:8081/>. If a preview server is already running on 8081,
use that server instead of starting another one.

## Verification

```powershell
git diff --check
```

Also check both pages at desktop and narrow mobile widths, follow the Home and
Résumé tabs, verify the embedded PDF and its download link, open the text
version, check the old résumé URLs, and use Tab to check the skip link and
visible focus. The text version and navigation work without site JavaScript;
embedded PDF support depends on the browser's native viewer. The download and
text version remain available when embedding is unsupported.

## Publishing

The integration branch is `master`. Publish the repository root through the
existing GitHub Pages configuration; there is no generated output to deploy.

`publish.bat` stages all changes in this checkout, including untracked files and
deletions, commits when needed, and pushes `master` to `origin/master`. Review
`git status --short` first. This is the manual publishing workflow, not a scoped
agent commit command.

```powershell
.\publish.bat "Describe the website update"
```

The message is optional; both quoted messages and unquoted multi-word messages
work. The script runs from its own directory, requires `master`, and stops on
in-progress Git operations or errors.
It can push an existing local commit when there are no new file changes. A push
rejection leaves the local commit intact; it does not pull, merge, or force-push.

