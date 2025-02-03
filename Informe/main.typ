#import "inicio/portada.typ": portada
#import "conf.typ": conf

#show: portada.with(
    titulo: "EXPLORANDO EL POTENCIAL DE LAS REDES NEURONALES DE GRAFOS PARA EXTRAER INFORMACIÓN DE BGP",
    autor: "VALENTINA FRANCISCA ESTEBAN LAGOS",
    profe: "IVANA BACHMANN ESPINOZA",
    profe2: "SEBASTIÁN FERRADA",
)

// Resumen
// #include "inicio/resumen.typ"
// #pagebreak()

// Dedicatoria
#align(right + horizon, [_dedicatoria._ \ ])
#pagebreak()

// Agradecimientos
// #include "inicio/agradecimientos.typ"
// #pagebreak()

// Indice
#[
#show outline.entry.where(
  level: 1
): it => {
  [#v(12pt, weak: true) \ ]
  text(weight: "bold", it)
}
#outline(indent: auto)]
#pagebreak()

#[
#show outline.entry.where(
  level: 1
): it => {
  [#v(4pt, weak: true) \ ]
  it
}
// Indice tablas
#outline(
  title: [Índice de Tablas],
  target: figure.where(kind: table),
)
#pagebreak()

// Indice monos
#outline(
  title: [Índice de Ilustraciones],
  target: figure.where(kind: image),
)]

// Configuración para documento principal
#show: conf
//----------------------------------------------------------
// Inicio documento

// Capitulo 1: Introducción
#include "capitulos/1-Introduccion.typ"
#pagebreak()

// Capitulo 2: Internet
#include "capitulos/2-Internet.typ"
#pagebreak()

// Capitulo 3: BGP
#include "capitulos/3-BGP.typ"
#pagebreak()

// Capitulo 4: AS Inference
#include "capitulos/4-AS-Inference.typ"
#pagebreak()

// Capitulo 5: Redes Neuronales
#include "capitulos/5-Redes-Neuronales.typ"
#pagebreak()

// Capitulo 6: Datos
#include "capitulos/6-Datos.typ"
#pagebreak()

// Capitulo 7: Experimentos
#include "capitulos/7-Experimentos.typ"
#pagebreak()

// Capitulo 8: Análisis
#include "capitulos/8-Analisis.typ"
#pagebreak()

#figure(
  image("imagenes/puma.jpg", width: 90%),
  caption: [El gatito más bello del mundo.],
) <puma>

#pagebreak()


// Bibliografía
#show heading.where(level: 1): it => [
  #set text(24pt)
  #block(it.body)
  #v(1em)
]
#bibliography(
    "bibliografia.bib",
    title: "Bibliografía",
    style: "ieee",
)
#pagebreak()

// Anexos
#include "anexos/anexoA.typ"
#include "anexos/anexoB.typ"