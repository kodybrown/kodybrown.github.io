# kodybrown.com

A small, static personal website, hosted on GitHub Pages at
[www.kodybrown.com](https://www.kodybrown.com/).

## Editing

- `index.html` is the personal introduction and links to my other sites.
- `resume.html` is the readable HTML résumé; update it together with
  `KodyBrown-Resume.pdf` when changing résumé content.
- `css/personal.css` is the hand-authored stylesheet used by both pages.
- `resume_cover.html` and `resume_print.html` forward existing bookmarks to
  `resume.html`; Home and Résumé are the only content pages in the navigation.

The active pages have no JavaScript, framework, external fonts, package install,
or build step. Older Sass, CSS, and JavaScript assets are retained but are not
loaded by these pages. Edit the HTML and `css/personal.css` directly.

## Preview

From PowerShell:

```powershell
cd C:\Users\kodyb\Projects\KodyBrown.com\www.kodybrown.com
python -m http.server 8081 --bind 127.0.0.1
```

Open <http://localhost:8081/>. If a preview server is already running on 8081,
use that server instead of starting another one.

## Verification

```powershell
git diff --check
```

Also check both pages at desktop and narrow mobile widths, follow the Home and
Résumé tabs, verify the PDF link and old résumé URLs, and use Tab to check the
skip link and visible focus. All content and navigation should work with
JavaScript disabled.

## Publishing

The integration branch is `master`. Publish the repository root through the
existing GitHub Pages configuration; there is no generated output to deploy.
The legacy `publish.bat` stages all files and pushes, so it is not a scoped
verification or commit command.

