# Changelog

## 2026-10-16

- Added a matching local SVG email icon linking to `kody@kodybrown.com`. Ordered
  both headers as Email, Stack Overflow, GitHub, LinkedIn, and X, with the lower
  contact links following the same order.
- Updated the local preview command to use `gostatic.exe` and checked its flags
  against the installed tool's help output.
- Verified the email destination, matching five-link headers, local icon loading,
  accessible names, 44-pixel targets, mobile wrapping, and whitespace checks.

## 2026-10-15

- Added local SVG links for X, GitHub, Stack Overflow, and LinkedIn to the top
  right of both page headers, retaining the labeled contact links below. Checked
  icon loading, accessible names, keyboard focus, 44-pixel link targets, and
  narrow-screen wrapping without horizontal overflow.
- Simplified the personal site to Home and Résumé, retaining the bordered page
  tabs and adding a durable personal introduction, links to Wasatch Wizard and
  WeekendTech, and X, LinkedIn, GitHub, and Stack Overflow profiles.
- Embedded the existing résumé PDF directly in the Résumé page, initially fitted
  to the viewer width, with a download link and an expandable HTML text version
  matching the PDF. Forwarded both previous résumé URLs to the new page.
- Removed JavaScript, Bootstrap, jQuery, and external font dependencies from the
  active pages. Added a small standalone stylesheet, responsive layouts, print
  styles, keyboard focus indicators, and a skip link.
- Verified desktop and narrow mobile rendering, navigation with JavaScript
  disabled, both former résumé URLs, local file and fragment links, résumé text
  parity with the PDF, and Git whitespace checks.
- Verified the in-page PDF viewer in Brave, expansion and keyboard collapse of
  the text alternative, and print styles that expose the text even when its
  disclosure is closed.
