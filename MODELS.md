# Модели Glim

| Asset | Path | Role |
|---|---|---|
| ArcFace | `Glim/Models/ArcFace.mlpackage` | 512-d face embeddings for unlock/enrollment |

Без ArcFace unlock в production **не работает** (см. `allowsProductionUnlock`). Vision fallback — только lab/debug.
