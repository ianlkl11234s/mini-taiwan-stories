#!/usr/bin/env python3
"""07 車站海拔排名

資料源：terrain-art 已烘焙好的車站高程
  ../terrain-art/public/layers/stations.json（生成於 2026-07-14）
  來源 DEM：內政部 NLSC 20m DTM (2024)，terrarium RGB 編碼，z13 取樣
  547 站 6 系統全數命中，0 筆落到海面 fallback

⚠️ 這是【地面高程】，不是軌道面高程。高架站、地下站的實際軌道高度會有落差
   （例：高架化的台中線各站，DEM 取的是地面而非高架橋面）。正文必須寫明。
"""
import json
import pathlib

SRC = pathlib.Path(__file__).resolve().parents[4] / "terrain-art/public/layers/stations.json"

def main() -> None:
    data = json.loads(SRC.read_text())
    pts = data["systems"]["tra"]["points"]
    ranked = sorted(pts, key=lambda p: -p["elev"])
    print(f"# 台鐵車站海拔（n={len(pts)}，DEM 生成日 {data['meta']['generated'][:10]}）\n")
    print("## 最高 10 站")
    for i, p in enumerate(ranked[:10], 1):
        print(f"{i:2}. {p['name']:6} {p['elev']:4} m")
    print("\n## 最低 10 站")
    for i, p in enumerate(ranked[-10:], len(ranked) - 9):
        print(f"{i:3}. {p['name']:6} {p['elev']:4} m")

if __name__ == "__main__":
    main()
