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

`images/favicon-master.png` is the 512-pixel master for the face on a slate circle.
The original hand-drawn artwork remains in `favicon.pdn`. The ICO, PNG, Apple touch
icon, and legacy Windows tile images all use the same updated artwork.

The master was edited using the built-in ImageGen tool, then downscaled and
converted with ImageMagick. The edit prompt was:

> Use case: precise-object-edit. Edit target: the supplied 64x64 transparent PNG,
> which is the user's own rough hand-drawn favicon face. Create a square favicon
> master. Change only its backdrop: add a perfectly round, flat dark slate gray
> circle (#343a40) behind the existing white and silver-gray face. Preserve the
> face's distinctive uneven hand-drawn/pixel marks, expression, proportions, and
> asymmetry; do not replace it with a different face, a polished emoji, an avatar,
> a skull, or a stock smiley. Center the original face and scale it uniformly only
> as needed so its entire drawing fits within the circle with about 10 percent
> inner breathing room. The circle should fill about 94 percent of the square.
> Keep everything outside the circle genuinely transparent. Crisp simple favicon
> treatment with no gradients, shadows, border, lettering, or additional shapes.
> The face must stay recognizable as the exact supplied drawing. Output one
> square PNG master.

To export the browser assets again after updating the master:

```powershell
magick images/favicon-master.png -resize 64x64 -strip favicon.png
magick images/favicon-master.png -define icon:auto-resize=64,48,32,24,16 favicon.ico
magick images/favicon-master.png -resize 192x192 -strip icon.png
magick images/favicon-master.png -resize 180x180 -strip apple-touch-icon.png
magick images/favicon-master.png -resize 558x558 -strip tile.png
magick images/favicon-master.png -resize 256x256 -gravity center -background none -extent 558x270 -strip tile-wide.png
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

