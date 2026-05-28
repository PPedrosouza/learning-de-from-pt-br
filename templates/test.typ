#let topic = sys.inputs.at("topic", default: "topics/a1/001-alfabeto-alemao-e-sons-basicos")
#let test = yaml(topic + "/test.yaml")

#set document(title: test.topic + " Test")
#set page(paper: "a4", margin: (x: 1.6cm, y: 1.6cm))
#set text(size: 10.5pt, lang: "en")
#set heading(numbering: "1.")
#set par(leading: 0.5em)

#show heading: it => [
  #v(0.8em)
  #it
  #v(0.4em)
]

= #test.topic Test

Level: #test.level

Name: #line(length: 7cm) Date: #line(length: 4cm)

#v(0.7em)

#for (index, question) in test.questions.enumerate() [
  #strong(str(index + 1) + ".") #question.question

  #if "options" in question [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 6pt,
      ..question.options.map(option => [□ #option])
    )
  ] else [
    #v(0.25em)
    #line(length: 100%, stroke: 0.45pt)
  ]

  #v(0.6cm)
]
