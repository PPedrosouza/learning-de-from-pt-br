#let topic = sys.inputs.at("topic", default: "topics/a1/001-alfabeto-alemao-e-sons-basicos")
#let data = yaml(topic + "/flashcards.yaml")

#set document(title: "German Flashcards")
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.5cm))
#set text(size: 10pt, lang: "en")
#set heading(numbering: "1.")
#set par(leading: 0.65em)

#show heading: it => [
  #v(0.8em)
  #it
  #v(0.4em)
]

= Flashcards

Topic: #data.topic\
Level: #data.level

#v(0.6em)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  ..data.cards.map(card => box(
    width: 100%,
    height: 4.1cm,
    stroke: 0.7pt + gray,
    inset: 0pt,
    [
      #block(fill: luma(245), inset: 8pt, width: 100%)[
        #text(size: 12pt, weight: "bold")[#card.front]
      ]
      #block(inset: 8pt)[
        #text(size: 10.5pt)[#card.back]
        #v(0.45em)
        #line(length: 100%, stroke: 0.4pt + luma(210))
        #v(0.45em)
        #text(size: 9.5pt)[#card.example]\
        #text(size: 9pt, style: "italic")[#card.example_translation]
      ]
    ],
  ))
)
