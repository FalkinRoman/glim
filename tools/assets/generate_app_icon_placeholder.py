#!/usr/bin/env python3
"""Write a simple dark PNG placeholder for Glim app icon (1024²).

Requires Pillow. On macOS packaging you should replace with `glimicon.icon`
from Xcode Icon Composer.

  python3 -m pip install pillow
  python3 tools/assets/generate_app_icon_placeholder.py
"""
from pathlib import Path

try:
    from PIL import Image, ImageDraw
except ImportError:
    raise SystemExit("pip install pillow")

size = 1024
img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
draw = ImageDraw.Draw(img)
# rounded dark plate
margin = 96
draw.rounded_rectangle(
    [margin, margin, size - margin, size - margin],
    radius=220,
    fill=(28, 28, 30, 255),
)
# accent ring (Face-ID adjacent green success cue + Glim blue)
cx = cy = size // 2
draw.ellipse([cx - 280, cy - 280, cx + 280, cy + 280], outline=(52, 153, 255, 255), width=28)
draw.ellipse([cx - 220, cy - 220, cx + 220, cy + 220], outline=(48, 209, 88, 180), width=10)
# smile
draw.arc([cx - 140, cy - 40, cx + 140, cy + 160], start=20, end=160, fill=(255, 255, 255, 230), width=22)

out = Path(__file__).resolve().parents[2] / "Glim/Assets.xcassets/appicon.imageset/appicon.png"
out.parent.mkdir(parents=True, exist_ok=True)
img.save(out)
print(f"wrote {out}")
