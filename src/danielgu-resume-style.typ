// =============================================================================
//  danielgu-resume — a formal CV template for Typst
//  Body: Linux Libertine · Headings & labels: Linux Biolinum
//
//  #import "danielgu-resume.typ": *
//  #show: resume.with(name: "…", contacts: (…), address: (…))
//
//  = Education
//  #entry(date: [2020 -- 2024])[University][
//    #role[B.S. in Computer Science]
//    - GPA: …
//  ]
//
//  = Publications
//  #bibliography("pubs.bib")
// =============================================================================

#let _serif   = ("Linux Libertine", "Libertinus Serif")
#let _sans    = "Linux Biolinum"
#let _display = ("Linux Libertine Display", "Linux Libertine", "Libertinus Serif")

#let _muted    = luma(40%)   // contact labels, footer
#let _hairline = luma(60%)   // section rules, list markers
#let _indent   = 0.08in      // body indent under an entry

// Vertical rhythm, in body ems, from the baseline of one line to the cap
// height of the next. Each step is looser than the one above it.
#let _gap = (
  line:    0.45em,   // lines of one paragraph or bullet
  item:    0.6em,  // bullet → bullet, publication → publication
  par:     0.8em,   // paragraph → paragraph
  role:    0.6em,  // bullets → next role within an entry
  entry:   0.7em,     // entry → entry
  heading: 0.9em,  // section rule → first line below it (≥ entry, or an entry's own gap wins)
  section: 1.2em,   // last line of a section → next section title
)

// A two-column line: title on the left, date flush right.
#let _dated(title, date) = {
  // One fixed top edge, so that semibold/italic titles and regular dates
  // (whose cap heights differ) share a baseline.
  set text(top-edge: 0.66em)
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    { set par(justify: false); title },
    date,
  )
}

// Entry, e.g. an institution, lab, company or award.
//   #entry[Title]
//   #entry(date: [2020 -- 2024])[Title][ body ]
#let entry(title, date: none, subtitle: none, ..body) = {
  let body = body.pos().at(0, default: none)
  block(above: _gap.entry, below: _gap.line, sticky: body != none,
    _dated(text(weight: "bold", title), text(weight: "bold", date)))
  if subtitle != none { emph(subtitle) }
  if body != none { pad(left: _indent, body) }
}

// Sub-entry inside an entry, e.g. a degree, position or advisor line.
// Directly under the entry title it follows at line spacing; after
// bullets it is set apart by `_gap.role`.
//   #role(date: [2020 -- 2024])[B.S. in Computer Science]
#let role(title, date: none) = block(above: _gap.role, below: _gap.line,
  sticky: true, _dated(emph(title), date))

#let resume(
  name: "",
  contacts: (:),          // (Label: value, …) — left column of the header
  address: none,          // array of lines — right column of the header
  highlight-author: none, // str, regex or array of them — set in bold in #bibliography
  paper: "us-letter",     // or "a4"
  margin: (x: 0.6in, y: 0.5in),
  font-size: 10.5pt,
  accent: rgb("#407de7"), // bar beside section titles; none to hide it
  body,
) = {
  set document(title: name + " — Curriculum Vitae", author: name)
  set page(
    paper: paper,
    margin: margin,
    footer: context {
      // Page numbers only when the CV runs over one page.
      if counter(page).final().first() > 1 {
        set text(font: _sans, size: 0.8em, fill: _muted)
        h(1fr)
        name + [ · ] + counter(page).display("1 / 1", both: true)
      }
    },
  )
  set text(font: _serif, size: font-size, lang: "en")
  set par(justify: true, leading: _gap.line, spacing: _gap.par,
    // A little letter-spacing slack, so lines with long unbreakable words
    // (URLs, arXiv ids) don't open wide gaps between words.
    justification-limits: (tracking: (min: -0.01em, max: 0.02em)))
  set strong(delta: 200)  // bold = Libertine Semibold
  set list(indent: _indent, body-indent: 0.55em, spacing: _gap.item,
    marker: text(fill: _hairline)[•])
  set enum(numbering: "[1]", indent: 0pt, body-indent: 0.6em, spacing: _gap.item)
  // Lists hug the line above them (a role, an entry title or a paragraph).
  show list: it => block(above: _gap.line, below: _gap.line, it)
  show enum: it => block(above: _gap.line, below: _gap.line, it)

  // Every entry of the .bib file, in file order, without a title of its own.
  set bibliography(title: none, full: true, style: "association-for-computing-machinery")
  show bibliography: it => {
    set par(spacing: _gap.item)  // the gap between numbered entries
    // IEEE leaves a double space where an optional field (e.g. address) is empty.
    show regex(",\s{2,}"): ", "
    // Keep "pp. 1–12", "vol. 3", "no. 2" together on one line.
    show regex("\b(pp?|vol|no)\. "): it => it.text.trim() + sym.space.nobreak
    let names = if highlight-author == none { () }
      else if type(highlight-author) == array { highlight-author }
      else { (highlight-author,) }
    names.fold(it, (acc, n) => { show n: strong; acc })
  }

  show heading.where(level: 1): it => {
    // Undo the built-in 1.4em heading size so the spacing below is in body ems.
    set text(size: font-size)
    let size = 1.25 * font-size  // title size
    let drop = 0.3 * size        // title baseline → rule
    block(
      width: 100%,
      above: _gap.section,
      below: _gap.heading,
      // With the bar, its descent below the baseline provides this gap instead.
      inset: (bottom: if accent == none { drop } else { 0pt }),
      stroke: (bottom: 0.5pt + _hairline),
      sticky: true,
      {
        set text(font: _sans, size: size, weight: "regular", tracking: 0.1em)
        if accent != none {
          // Hangs `drop` below the baseline so that it stands on the rule.
          box(width: 2pt, height: drop + 0.85 * size, baseline: drop,
            fill: accent, radius: (top: 1.5pt))
          h(5pt)
        }
        upper(it.body)
      },
    )
  }

  // ---- header ----
  align(center, block(below: 1.1em, text(font: _sans, weight: "bold", size: 2em, name)))

  let field(label) = text(font: _sans, fill: _muted, smallcaps(label))
  let fields(pairs) = grid(
    columns: (auto, 1fr),
    column-gutter: 0.9em,
    row-gutter: _gap.line,
    ..pairs.map(((k, v)) => (field(k), v)).flatten(),
  )
  pad(x: 0.3in, grid(
    columns: (1fr, 1fr),
    fields(contacts.pairs()),
    if address != none { fields((("Address", address.join(linebreak())),)) },
  ))

  body
}
