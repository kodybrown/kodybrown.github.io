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
or build step. Older Sass, CSS, and JavaScript assets are retained but are not
loaded by these pages. Edit the HTML and `css/personal.css` directly.

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
The legacy `publish.bat` stages all files and pushes, so it is not a scoped
verification or commit command.

