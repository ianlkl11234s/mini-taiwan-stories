// 組出 dist/（取代 Dockerfile 的 COPY 清單；Cloudflare Workers 靜態資產的發布目錄）
// 清單與 Dockerfile 一致：首頁與 demo-irrigation 都用同一份預覽頁，bathymetry 帶文章與資料檔。
import { cpSync, mkdirSync, rmSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = fileURLToPath(new URL('..', import.meta.url))
const out = join(root, 'dist')

const demo = 'articles/demo-irrigation/taiwan-md-preview.html'
const bathy = 'articles/bathymetry'
// [來源, 發布路徑]
const files = [
  [demo, 'index.html'],
  [demo, demo],
  [demo, 'articles/demo-irrigation/index.html'],
  [`${bathy}/taiwan-md-preview.html`, `${bathy}/taiwan-md-preview.html`],
  [`${bathy}/taiwan-md-preview.html`, `${bathy}/index.html`],
  ...['article.md', 'data.json', 'embeds.json',
    'figures/hero-isobath.png', 'figures/hero-isobath-final.png', 'figures/islands-isobath.png',
  ].map((f) => [`${bathy}/${f}`, `${bathy}/${f}`]),
]

rmSync(out, { recursive: true, force: true })
for (const [src, dst] of files) {
  mkdirSync(dirname(join(out, dst)), { recursive: true })
  cpSync(join(root, src), join(out, dst))
}
// _headers 放在 public/，build 時一併帶入
cpSync(join(root, 'public/_headers'), join(out, '_headers'))
console.log(`dist: ${files.length + 1} files`)
