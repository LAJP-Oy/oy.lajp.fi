#set page(width: 100pt, height: 100pt, margin: 0pt, fill: none)
#set text(top-edge: "cap-height")

#let primary = rgb("#1E2650")

#box(
  width: 100pt,
  height: 100pt,
  radius: 12pt,
  fill: primary,
)[
  #place(
    center + horizon,
    dy: 1em,
    //dy: 50pt,
  )[
    #text(
      font: "Inter",
      size: 36pt,
      weight: 800,
      fill: white,
    )[LAJP]
  ]
]
