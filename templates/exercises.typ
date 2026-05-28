#let topic = sys.inputs.at("topic", default: "topics/a1/001-alfabeto-alemao-e-sons-basicos")
#let data = yaml(topic + "/exercises.yaml")

#set document(title: "German Exercises")
#set page(paper: "a4", margin: (x: 1.6cm, y: 1.6cm))
#set text(size: 10.5pt, lang: "en")
#set heading(numbering: "1.")
#set par(leading: 0.5em)

#show heading: it => [
  #v(0.8em)
  #it
  #v(0.4em)
]

= Exercises

#text(size: 9.5pt)[Topic: #data.topic | Level: #data.level]

#v(0.5em)

#for exercise in data.exercises [
  == #exercise.type

  *Instruction:* #exercise.instruction

  #v(0.2em)

  #for (index, item) in exercise.items.enumerate() [
    #strong(str(index + 1) + ".") #item.question
    #if "options" in item [
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 6pt,
        ..item.options.map(choice => [□ #choice])
      )
    ] else [
      #v(0.25em)
      #line(length: 100%, stroke: 0.45pt)
    ]
    #v(0.45cm)
  ]
]
