# Mini Taiwan Stories workflow contract

This is the canonical stage contract. The article's `workbook.md` is the execution record; `TOPIC_BANK.md` is the portfolio view.

## Roles

| Work | Primary owner |
|---|---|
| Notice a striking map phenomenon and describe the desired focus | User + agent |
| Research non-map context, source lineage, data definitions, and disagreements | Agent |
| Validate numbers and calculations | Agent |
| Tune camera, layers, and visual emphasis | User + agent |
| Select the central finding and approve the outline | User + agent |
| Draft, source, trim, review, and score | Agent |
| Final editorial and publication acceptance | User |

The user does not need a hypothesis before intake. A screenshot plus “I want people to notice this” is sufficient. Final human acceptance is publication approval, not an additional pre-draft editorial gate.

## State machine

`只見現象 → 脈絡研究 → 證據成立 → 地圖取景 → 待確認大綱 → 寫作 → 複核刪修 → 完稿 → 已發布`

Side states:

- `暫存`: visually promising, but evidence is currently insufficient.
- `拆篇`: more than one central finding should become separate articles.
- `不成立`: the pattern is explained by data coverage, rendering, or a disproven premise.

## Stage 0 — Intake the phenomenon

**Input:** screenshot, URL, place, layer combination, or a short observation.

**Work:**

- Record only what is visibly present: shape, location, density, boundary, adjacency, contrast, or motion.
- Record what the user wants the reader to notice.
- Convert explanations into questions. Do not invent a cause.
- Search the topic bank for the same phenomenon, place, and layer combination. Update the existing card when it is the same investigation; create a new ID only for a distinct question.
- If place, layer, capture time, source version, or map URL is unknown, record it as unknown and first trace the screenshot, legend, or approximate extent. Do not compare spatial density before the relevant map and data scope are identified.
- Create or update the topic card and initialize the per-article workbook.

**Exit:** the phenomenon and intended visual impact are clear enough to research. Otherwise use `暫存`.

## Stage 1 — Build context and source notes

**Work:**

- Read the article inventory when it exists.
- Search the `taipei-gis-analytics` catalog before open-web discovery.
- Find context that may not be mappable but is necessary: definitions, institutions, historical development, operating mechanisms, policy, and competing explanations.
- Start with official landing pages and primary records; use academic or professional sources for independent interpretation and cross-checking.
- Record URLs, title, publisher, publication or statistical date, access date, edition, relevant page or section, scope, and limitations.
- Preserve useful research in notes even when it does not enter the article.
- Choose the provisional article tier and satisfy the research gate in [`ARTICLE_GUIDELINES.md`](../../../docs/editorial/ARTICLE_GUIDELINES.md): a falsifiable central tension, three reader questions, 8–10 fact-source pairs, and the tier's source minimum. Include at least two primary sources and one English source.
- Find a verifiable human viewpoint, quotations, scenes, and story material. When the subject genuinely does not support them, record `不適用：原因`; never invent them to satisfy the form.

**Exit:** there is enough evidence to say what is known, what is inferred, and what remains unknown. A visually attractive but unsupported premise returns to `暫存` or `不成立`.

## Stage 2 — Verify data and claims

**Work:**

- Create a claim ledger with one row per important statement.
- Classify each row as `map observation`, `source fact`, `computed result`, `interpretation`, or `causal claim`.
- Put every number selected for the outline or prose into `data.json` with its exact definition and reproducible method. Keep exploratory calculations in research notes until selected.
- For official versus self-computed comparisons, reconcile time, geography, population, unit, geometry segmentation, missingness, and revision.
- Check the official index or landing page for the newest edition. Search snippets and direct PDF URLs do not establish that a version is current.
- Recompute ratios from unrounded inputs. Do not call a difference a coverage or error rate unless the denominator and population make that interpretation valid.
- Prefer the official value for a core metric when one is published. Use self-computation only for an unavailable dimension or as a clearly separated comparison; never blend the two populations into one number.
- Mark claims `verified`, `qualified`, `unresolved`, or `omit`.
- Pair data, quotations, and other material claims with draft footnotes while researching; do not postpone citation work until the prose is finished.

Minimum fact shape:

```json
{
  "facts": {
    "fact_id": {
      "value": 0,
      "unit": "unit",
      "as_of": "YYYY or date",
      "scope": "population and geography",
      "method": "how derived",
      "query": "query or formula",
      "source": "primary source",
      "source_url": "https://...",
      "caveat": "limits and non-equivalent interpretations"
    }
  }
}
```

**Exit:** every candidate core claim is verified or explicitly qualified. Unresolved supporting material stays out of the outline.

## Stage 3 — Fix the map view

**Work:**

- Record the embed URL, camera parameters, layers, styling parameters, caption, and release state in `embeds.json`.
- Assign each view an evidence scope:
  - `direct evidence`: the named phenomenon is directly visible.
  - `regional context`: the view shows the surrounding pattern but not the named feature or mechanism.
  - `illustration`: the view only helps explain an idea.
- Check whether apparent regional differences could come from inconsistent source resolution, coverage, vintage, or rendering.
- Provide a static fallback for publishing paths that remove iframes, even when the local article UI shows only the interactive map.
- Ask the user to confirm framing and visual emphasis. Record the decision and any requested tuning.

**Exit:** the map gate is confirmed. Research may continue before confirmation, but full prose may not.

## Stage 4 — Select the finding

**Work:**

- List candidate findings and grade their evidence strength.
- Propose one provisional central finding that a reader can retell in one sentence.
- Keep a useful distinction between “interesting” and “important.” Prefer the finding that changes how the reader sees the map.
- Move independent findings into separate topic cards instead of forcing completeness into one article.

**Exit:** a proposed central finding, article boundary, split plan, and list of intentionally excluded material are ready for the outline gate. They become final only after user confirmation.

## Stage 5 — Approve the outline

Draft a compact outline with a visible narrative movement:

- **起:** show the striking view before explaining it.
- **承:** teach only the map grammar and numbers needed to read it.
- **轉:** reveal the unexpected mechanism, contrast, history, or limitation.
- **合:** return to the view so the reader can see it differently.

Each section must advance the central finding. If two sections could stand alone with different “so what” sentences, propose a split.

The outline also records the title hook, opening mode, two real changes in understanding (or an explicit `不適用` reason), the challenge or limitation woven into the main line, and the intended ending image.

**Exit:** record user approval of the finding, scope, and order; only then mark the central finding and article boundary final. Do not generate the full draft before this gate.

## Stage 6 — Draft from evidence

**Work:**

- Write from approved claims and ledgered numbers, not memory.
- Use the map as evidence or narrative movement, not decoration.
- Keep important context that is invisible on the map, but omit background that does not change the reader's understanding of the central phenomenon.
- Explain the minimum mechanism necessary. Do not close uncertainty merely to make the story smoother.
- Follow [`ARTICLE_GUIDELINES.md`](../../../docs/editorial/ARTICLE_GUIDELINES.md) for title, opening, voice, density, and ending.
- Use footnote-first citations for data, quotations, and material claims, then end with `## 參考資料`. Use Sepia only after the facts and uncertainty language are stable; stylistic revision must not change either.

**Exit:** complete draft with citations, map placements, and no unledgered numbers.

## Stage 7 — Verify the draft

Check every factual sentence against the claim ledger and every number against `data.json`. Re-run queries or calculations where feasible. Recheck source links, edition freshness, units, names, dates, geography, captions, quote boundaries, footnote pairs, source mix, and citation density.

Check the actual embed states required by the current target separately. At `research-ready`, later release checks may be `不適用：尚未進入該發布路徑`. Before publication, local rendering, required layer assets, interaction lock, reset, exit, mobile behavior, production rendering, and static fallback are all required.

**Exit:** no unresolved factual blocker is presented as fact. Release states are recorded without collapsing local and production evidence.

## Stage 8 — Trim and restore story

Perform three passes:

1. **Cut:** remove repetition, research residue, defensive over-explanation, and facts that do not move the article.
2. **Restraint:** replace unsupported causal certainty with qualified language or omission. Keep `what is visible`, `what sources establish`, and `what the author infers` distinct.
3. **Story:** run the five-finger check in [`ARTICLE_GUIDELINES.md`](../../../docs/editorial/ARTICLE_GUIDELINES.md); verify that the opening creates attention, the turns change understanding, and the ending returns meaningfully to the original view.

Move reusable cut material back to research notes or new topic cards. Do not delete evidence merely because it is absent from prose.

## Stage 9 — Score and finish

Use rubric version `0.1-draft`:

| Dimension | Maximum |
|---|---:|
| Data and source correctness | 30 |
| Map impact and claim alignment | 25 |
| Story and narrative movement | 25 |
| Restraint and uncertainty | 15 |
| Source and method completeness | 5 |

The total is diagnostic; v0.1 has no fixed passing threshold. For each dimension record at least one strength and one deduction. Record reviewer, date, initial score, human-adjusted score, and any representative article used as an anchor so weights and anchors can be revised later.

These factual blockers still prevent publication regardless of score:

- A material number cannot be traced or reproduced.
- A map does not display the phenomenon claimed in its prose or caption.
- A causal statement is stronger than its evidence.
- A material limitation or source mismatch is hidden.
- References are missing or point only to an intermediary when the primary source is available.

Finish by recording the release matrix: `research-ready`, `local-preview-ready`, `production-embed-ready`, and `published`.
