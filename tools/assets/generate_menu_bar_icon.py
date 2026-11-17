#!/usr/bin/env python3
"""Generate a template menu-bar SVG for Glim (white strokes on transparent).

Usage:
  python3 tools/assets/generate_menu_bar_icon.py
  # writes Glim/Assets.xcassets/MenuBarIcon.imageset/MenuBarIcon.svg
"""
from pathlib import Path

SVG = """<svg width="181" height="174" viewBox="0 0 181 174" fill="none" xmlns="http://www.w3.org/2000/svg">
  <!-- Glim mark: soft smile + twin peaks — template (white) for dark menu bar -->
  <path d="M50 118C67 139 117 139 134 118" stroke="white" stroke-width="12" stroke-linecap="round"/>
  <path d="M97 47L81 95H97" stroke="white" stroke-width="12" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M53 47V69" stroke="white" stroke-width="12" stroke-linecap="round"/>
  <path d="M132 47V69" stroke="white" stroke-width="12" stroke-linecap="round"/>
  <circle cx="90.5" cy="87" r="62" stroke="white" stroke-width="6" opacity="0.35"/>
</svg>
"""

out = Path(__file__).resolve().parents[2] / "Glim/Assets.xcassets/MenuBarIcon.imageset/MenuBarIcon.svg"
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(SVG)
print(f"wrote {out}")
