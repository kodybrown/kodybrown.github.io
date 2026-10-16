# Changelog

## 2026-10-16

- Moved Dude Stickers directly after Bricksoft, preserving its link and blurb.
  Verified the new order, browser rendering, and Git whitespace checks.
- Added Keep In Touch, Dude Stickers, and Plain-Text Suite to the home page's
  project links, with short descriptions checked against their local source.
  Corrected both footers to "Online since 1994" using the owner's history.
  Verified links, section order, browser rendering, and whitespace checks.
- Made the professional introduction more general and added matching linked
  company headings and blurbs below the résumé links: Bricksoft first, then
  Vutility with the HotDrop, VoltDrop, and IoT work. Verified ordering, matching
  heading styles, link destinations, browser rendering, and whitespace checks.
- Added Bricksoft as the current company at the start of "Professional
  background," linking to bricksoft.com and describing its custom sensors,
  smart gateways, and enterprise sensor data platform. Verified placement,
  the link destination, browser rendering, and Git whitespace checks.
- Moved "Things I make and share" after "Professional background" as the final
  home page section. Verified the section order and Git whitespace checks.
- Removed the home page's duplicate "Find me" section and its unused CSS,
  retaining the existing header contact icons. Verified unchanged header
  markup, browser rendering, and Git whitespace checks.
- Recorded the three sites' roles and future generator choices in the README:
  Eleventy for a personal blog and Wasatch Wizard's Blogger replacement, and
  Astro for WeekendTech. Documented Markdown/GitHub publishing and migration
  considerations; checked the existing Blogger destination and Markdown diff.
- Regenerated every remaining favicon, manifest, Apple touch, and Windows tile
  PNG from the hand-edited `favicon64.png`, preserving pixel edges with
  nearest-neighbor scaling. Updated the rebuild instructions and verified
  image pixels, sizes, transparency, and all declared icon references.
- Rebuilt `favicon.ico` from the supplied, hand-edited 16-, 24-, 32-, and
  64-pixel PNGs, verifying exact RGBA pixel matches for all four embedded sizes.
  Pointed both pages' PNG favicon links at the corrected `favicon64.png`.
- Added a matching local SVG email icon linking to `kody@kodybrown.com`. Ordered
  both headers as Email, Stack Overflow, GitHub, LinkedIn, and X, with the lower
  contact links following the same order.
- Updated the local preview command to use `gostatic.exe` and checked its flags
  against the installed tool's help output.
- Verified the email destination, matching five-link headers, local icon loading,
  accessible names, 44-pixel targets, mobile wrapping, and whitespace checks.

## 2026-10-15

- Removed 70 unused legacy assets and build files, retaining the active
  stylesheet, editable source artwork, current PDF, and old résumé redirects.
- Unified browser, Apple, and Windows icons around the hand-drawn face on a
  slate circle. Added a shared PNG master and documented its edit and exports.
- Hardened `publish.bat` with checkout and branch checks, reliable quoted and
  unquoted commit messages, nonzero error exits, and explicit pushes without
  automatic pulls. Verified 12 publishing scenarios using disposable local
  repositories, including rejected pushes and commit failures.
- Included the updated hobbies and faith wording on the home page. Checked
  local references, favicon formats, browser rendering, and Git whitespace.
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
