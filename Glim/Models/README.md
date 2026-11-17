# ArcFace model asset

Required for production Face Unlock.

## Bundle path

`Glim/Models/ArcFace.mlpackage`

Loaded by `ArcFaceEmbedder`. If missing or unloadable, `FaceRecognitionPipeline` falls back to Apple Vision feature-print (`VisionFeaturePrintEmbedder`).

## Production gate

`FaceRecognitionPipeline.allowsProductionUnlock` is `false` while the Vision fallback is active. `FaceUnlockCoordinator` refuses to type the Mac password in that state. Face Lab may still run on the weak embedder for debugging.

## Rebuild

See `../../tools/convert_arcface.py` and `../../tools/README.md`.
