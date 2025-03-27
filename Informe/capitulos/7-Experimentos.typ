= Benchmark

// TODO: Agregar porque se fueron tomando algunas desiciones
// TODO: Agregar parte de codigo y formato en el anexo

== Proceso de Ejecución del Benchmark


Este apartado describe el procedimiento seguido para ejecutar el benchmark comparativo de métodos de inferencia de relaciones entre Sistemas Autónomos (ASes). El objetivo principal es evaluar el rendimiento de diferentes enfoques tradicionales en comparación con una arquitectura de Redes Neuronales en Grafos (GNN). Los métodos evaluados incluyen: Gao, Ruan, ProbLink y BGP2Vec.



=== Organización del Repositorio

El repositorio del benchmark está organizado en carpetas correspondientes a los distintos métodos evaluados:

#list(
   [`Data/`],
   [`gao/`],
   [`ruan/`],
   [`problink/`],
   [`bgp2vec/`],
   [`create_bgp_routes.py`],
   [`create_tor_dataset.py`],
   [`tor_results.py`],
   [`utils.py`]
)

Cada carpeta contiene un archivo .ipynb que se ejecuta para obtener los resultados de cada método en función de los datasets generados. La estructura modular del repositorio permite la fácil incorporación de nuevos métodos para futuras comparaciones.

=== Descarga y Procesamiento de Rutas BGP

El primer paso consiste en la recopilación y limpieza de rutas BGP. Para ello, se utilizó el script create_bgp_routes.py, que se ejecuta de la siguiente manera:

```bash
python3 create_bgp_routes.py
```

Este script se encarga de:

+ *Descarga de Rutas BGP:* Se utiliza la librería BGPStream para obtener las rutas BGP en función de una fecha determinada. En este caso sonsitio en el dia 1/07/2022. // FIXME: Agregar fecha correcta.
+ *Obtención de Información Complementaria:* Se descargan el archivo AS to Organization y un archivo .json de Peering DB. Este archivo es ocupado luego en el porceso de inferencia del metodo problink.
+ *Procesamiento y Limpieza de Datos:* Se aplican los siguientes filtros para asegurar la calidad de las rutas:
      - Eliminación de ASes duplicados en los paths.
      - Eliminación de paths con loops para evitar inconsistencias.
      - Eliminación de paths con ASN reservados que no representan entidades públicas.


=== Generación del Dataset de Relaciones de Tor

El segundo paso consiste en la creación del dataset de relaciones entre ASes, utilizando el script  `create_tor_dataset.py`, que se ejecuta de la siguiente manera:

```bash
python3 create_tor_dataset.py
```

Este script:
+ Descarga el archivo AS Relationship de CAIDA, el cual proporciona información sobre las relaciones entre ASes del metod AS Rank @ASRank.
+ Construye una lista de relaciones en forma de pares de ASN junto con sus respectivas etiquetas (labels), clasificándolas en relaciones de tipo cliente-proveedor, pares horizontales o conexiones internas.

Este dataset es utilizado posteriormente en la evaluación de los métodos de inferencia de relaciones.

=== Ejecución de los Métodos de Inferencia


Cada archivo .ipynb correspondiente a un método específico realiza los siguientes pasos:

  + Importación de los datasets procesados de Tor y rutas BGP.
  + Aplicación del método de inferencia para determinar relaciones AS.
  + Generación de un archivo de resultados en el formato:

```bash
<nombre_metodo>_results.txt
```
Este archivo contiene las relaciones inferidas junto con las probabilidades o etiquetas asignadas por el modelo.



=== Análisis de Resultados

Una vez obtenidos los resultados de todos los métodos, se ejecuta un archivo .ipynb dedicado al análisis comparativo. Este archivo:
  + Importa los resultados generados por cada método.
  + Genera gráficos comparativos para visualizar el desempeño de los métodos en términos de precisión, recall, F1-score y otras métricas relevantes.
  + Evalúa el rendimiento de los métodos utilizando métricas clave para determinar su efectividad en la inferencia de relaciones AS.

Este análisis proporciona información valiosa sobre las fortalezas y debilidades de cada enfoque, así como su viabilidad en entornos de producción.




TODO: Mostrar resultados con gragos y tablas


// == Creación de grafos.

// PAra trabajar con un grafo de la libreria DGL, los nodos deben tener una representación vectorial. Por lo tanto no nos sobra unicamente con tener la topología de los SA que como se vio en la parte de DATOS puede ser sacada de esas 3 fuentes, siendo la principal y mas RAW la de RIPE NCC y RouteVIews, ya que CAIDA contiene estos datoso pero ya en datsets creados por otros investigadores.
// Es por esto que tenemos que ver como agregarles las featiures. a lo que se tomaren diferentes enfoques a est e problema:
// - Ocupar features ya creadas por el paper [AGREGAR], elc ual tiene diferentes caracteristicas indicadas en el anex [poenr que parte del anexo] a la fecha de Julio de  2022, sin embargo este dataset contiene muchos valores no conocidos para los SA, además de que hace que solo nos podamos trabajar en esa fecha.

// - Crear representaciones en base a las caracteristicas topologicas de nuestro grafo de internet. En este caso se crearon embeddings para lso nodos los cuales contenian el grado de entrada y salida, la cantidad de vecinos, la cantidad de vecinos en comun con otros nodos, entre otros. Tambien se crearon embeddings para las aristas, los cuales contenian la cantidad de vecinos en comun entre los nodos que conectan, la cantidad de nodos en comun entre los nodos que conectan, entre otros.

// - Otro enfoque fue crear representaciones de los nodos en base a metodos/algoritmos ya existentes que intentar representar la posicion/importancia de nodo en el contexto de grafo. Se ocupo por ejemplo PageRank, DeepWalk.

// . Finalemnet el ultimo enfoque que s etomo fue crear estas representaciones desde 0.


// RIBs vs BGP UPDATES

// RIB = Routing Information Base
// - Pretty much what most people thing about as
// the "Route Table"
// • BGP UPDATES
// - These are the actual UPDATE and
// WITHDRAW messages as they are
// communicated by the BGP protocol

// Why UPDATES
// • As routes are added and withdrawn, we
// may get to see some of those sub-optimal
// routes which are normally hidden by BGP

// Turning into CSV
// + Parse the MRT files and output one line
// per path.
// + https://github.com/YoshiyukiYamauchi/mrtparse

// Sort  Uniq
// • If we take that output from a lot of different
// sources then we are going to get
// duplicates.
// • We need a way to sort these CSV files
// and remove duplicates



// == Benchmark

// Para abordar este problema se comenzó por la creación de un Benchmark.
// .....

// Para esto se probaron los siguientes metodos anteriores:
// 1. Gao [sacado de BGP2VEC] Paper - @InferringASRelatioships2001
// 2. Ruan [sacado de BGP2VEC]: ntroduced by Ruan
// and Susan Varghese @computing-observed-autonomous-system-relationships-in-the-internet
// // 3. Sark [sacado de BGP2VEC]: Es el algortimo presentado por Subramanian et al.@CharacterizingIAS  "Characterizing the Internet Hierarchy from Multiple Vantage Points"
// // 4. AS Rank @BGP-Data-Analysis - codigo: @Code-BGP-Data-Analysis-Code
// // 5. TopoScope @BGP-Data-Analysis - codigo: @Code-BGP-Data-Analysis-Code
// // 6. ProbLink @BGP-Data-Analysis - codigo: @Code-BGP-Data-Analysis-Code
// // two different cores



// == Datos

// - Se uso x durante lso X displaying
// - ¿Cuanto se demoró?
// == modelos

// Para bordar este problema  se utiulizaron ......

// == Dataset de Evaluación
// Las Relaciones entre SA son privadas, esto hace que en algoritmos de inferencia sea dificir validar, y para casos de machine learning, entrenar el modelos.

// Lo primero que podriamos hacer es buscar  un SA que publique sus AS relaciones.
// esto fue loq ue hoz la personsa de la tesis  y creo un dataset a partir de la informacion que provee Hurricane's BGP Toolkit.



// = Experimentos
// Para abordar este problema se tomarón dos enfoque diferentes.

// - Clasificación Binaria: Se tomaron p2c y c2p como una misma clase y las otras siendo p2p.

// - Clasificación Multiclase: Las relaciones p2c y c2p se tomaron como clases diferentes.


// == Dataset de Validación

// Uno de los podibles caminos a ocupar fue ocupar como dataset de validación de la Tesis "BGP Data Analysis: Exploring Solutions for Au-
// tonomous Systems Relationships Inference"

// Este utiliza el atributo  BGP communities más la información RIB, esto con la idea de que hay algunos AS que publican sus políticas de BGP communities. Entonces se creó un JSON que contiene reglas de ciertos SA y reglas (BGP communies policy) con las que podría saber el tipo de relación que se tendría con un vecino.

// Por ejempo TODO: Agregar un ejemplo.







// == Experimento 1:


// - GNN -> GCN
// - Predictor -> DOtProduct y MLP
// - Optimizador -> Adam
// - Función de pérdida -> CrossEntropyLoss
// - Split de edges para entrenamiento y validacion
// - Stochastic Gradient Descent (SGD) con un learning rate de XXX.



// #figure(
//   image("../imagenes/noimage.jpg", width: 20%),
//   caption: [Resultados.],
// ) <SettingStochasticGradientDescent>

// - Problemas con el modelo:
//   - Posible overfitting.

// == Experimento 2:


// - GNN -> GraphSAGE
// - Predictor -> MLP
// - Optimizador -> Adam
// - Función de pérdida -> CrossEntropyLoss
// - Split de edges para entrenamiento y validacion
// - Neighbou sampling.


// #figure(
//   image("../imagenes/noimage.jpg", width: 20%),
//   caption: [Resultados.],
// ) <SettingStochasticGradientDescent>

// - ¿Por que ocupamos GraphSAGE y no GCN?


// Como estamos entreando de forma transductive, es decir ocupando un mismo grafo para entrenar y validar, puede ocurrir que se este overfiteando el grafo y por eso obteniendo buenos resultados, estod ebdo a que al probar con epoch muuuy grandes los valores de loss todo el rato eran muy similares, y lo que se espera obtener  en este caso es q llegase a un punto dond ela loss era similar , pero luego empezaran adiverger, que seria el punto en donde el modelo se esta empezando a aprender los datos de memoria, pero esto no paso???.
// Para evitar esto se decidio ocupar otras forma sd eentrenamiento para majear que el modelo pudeese generalizar y no se estuviese validando mal (porq al final mas q na es problema de q noe stamos validando con datos diferentes ). Entrena runasdo ampling.

// == Experimento 3:

// - GNN -> GraphSAGE
// - Predictor -> MLP
// - Optimizador -> Adam
// - Función de pérdida -> CrossEntropyLoss
// - Split de edges para entrenamiento y validacion
// - Otro sampling

// #figure(
//   image("../imagenes/noimage.jpg", width: 20%),
//   caption: [Resultados.],
// ) <SettingStochasticGradientDescent>


// == Experimento 4:

// Agregar paquetes de flujo


// #figure(
//   image("../imagenes/noimage.jpg", width: 20%),
//   caption: [Resultados.],
// ) <SettingStochasticGradientDescent>


// Destacar que en nuestro enfoqeu fue de Regresion, es decir la salida final de los modelos corresponde a un valor uncaente al cual luego se calcula un umbral para clasificar en las clases correspondientes. Esto porque l tener clases desbalanceadas, el modelo desidiria en solo clasificar un solo tipo (la q es mayor) y aun asi no se tienen resultados tan malos. Por esto no se tomo ese enfoque ya que es una de als fallas a la que queda propenso.


// GCN VS GraphSAGE

// - Comparamos el caso de GCN con GraphSAGE usando como Predictor el DotProduct y ocupando todas las features:

// GCN:
//  - Con 100 epoch, un % de train de 0.6 se obtiene una accuracy de 0.81, sin embargo se puede observar overfitting mas o menos desde el epoch 70.
//  - Ocupando un modelo que agrega entre cada capa GNN dropout se octiene una accuracy 0.8. No es muy diferentes.
//  - Drop out ayuda harto, sin embargo hace q no sea tan smoth el converger.

// GraphSAGE:
//   - Con epoch 100, un % de experience
// Podemos ver que GraphSAGE super en performance a GCN. Tambien podemos ver que para ambos modelos el overfitting se presenta en diferentes casos, esto por la naturaleza de los calculos de cada uno en la aggregación. Pues en GCN para obtener un mensaje al nodo , se necesitan todos sus vecinos haciendo que se afacil reconocer un nodo de otro ya si mas fcil de que se reconosca overfitting, en vambio en graphSAGE el mensaje al nodo en como un promedio de los vecinos, por lo que es mas dificil que se reconosca overfitting.

// Se realizo la mism acomparación pero en vez de DotProduct se ocupo MLPPredictor. En el caso de GCN La accuracy subió a un 0.8222(0.9221 cmabiando porte capas) y GraphSAGE a un 0.92 (con el mismo numero entre capas) 0.9546 (cambiando nuemero de capas). Sin embargo con 100 epoch no cambiaba mucho al final. Quise ver que ocurria si ocupaba un porcentaje  muy bajo de train, para evr si habia overfitting, pero lo que psao fue q igual habia buenos resultados...??? ocupe el modelo sin droppout y ahi se podia ver un poco el overfitting. con una cantidad de X ejmplos de edge para train.

// [Cachar porque no me esta encajando el numero de true y falses en el train msakk al ahcer split del datset]

// como sea Es mejro con MLP que con DotProduct, por lo que se ocupara MLP en los siguientes experimentos.

// OCUPAR TODAS LAS FEATURES ES NECESARIO?

// Luego para ver que tan esenciales en la tarea era los features recolectados se porbo con graphSAGE y MLP como predictor (con ahsta el momento los mejores resultados que s e ahan obtenido), con 100 epoch y un % de train de 0,6 .


// Se partio ocupando unicamente como atributos de los ndoos su grado in y grado out por nodo. Obteniendo una Accuracy de 0.8724 con DotProduct y 0.9290 con MLPpredcitor. Con esto vemos que si bien se dan buenos rsutltodos agregar las feeatures Mejora la accuracy.
// ¿Pero son de ayuda las que le estamos pasando?
// Prque si bien ya tenemos que son una ayuda luego de hacer una exploracion de esta (En anexo mas info) podemos notar que para muchos features par ala mayria de los nodos no se tiene información y por ende no serian muy relevantes?.


// PAra esto se decidio incluir unicamete aquellas features cuya información para todos los nodos estuviera sobre 80%. Es decir existe info de la feature para el 80 % de los nodos.
// Estoso consistieron en :
// - AS_rank_numberAsns
// - AS_rank_customer
// - AS_rank_peer
// - peeringDB_ix_count
// - peeringDB_fac_count
// - cti_top
// Con estos usando GraphSAGE y MLP como predictor se obtuvo una accuracy de 0.9452 lo que s eve que tener todas las otras valores lo mejora pero no tanto, es decir no son tan relevantes para dicha tarea.

// otros caso fue elegir unicamente .....[COMPLETAR]...


// ---------------------------------------------------------

// IDEAS FALLIDAS
// - Dentrro de otras ideas que se intentaron pero no funcionaron fue crear grafos a partir de los recolectores RRC, de sta forma tener diferentes grafos a partri d elos cuales algunos se elijan para training y otro diferente para testeo. Sin embargo falle, no se si retomar o no.

// - otra idea fue que RIPEstat tineen una API de la cual se puede obtener información, sin embrago se demora demasiado para la cantidad de nodos ques e tienen por grafos.

// -----------------------------------------------------------

// Continuando con los experimentos una de los problemas que mas miedo tenia era que se entrenara y se esttuviera overfitteoando el grafo, porque no tenemso mas grafo que el de esa fechaa, pues esos datos (los atributos corresponden a sacados por otro paper) . Es decir estabamos tomando un enfoque inductivo.
// Es por esto que una podible solución que se nos ocurrio fue proabr diferentes tecnicas de samplingm¿, area que aun sigue en investigación e inovacion en el area de GNN.

// Para esto se partio con random neighbour sampling[explicado en XXX marco teorico] y se obtuvo una accuracy de 0.9414 , lo que no mejoro mucho los resultados obtenidos anteriormente. ya desde el segundo epoch hay overfitiing.

// se decidió probar con otro tipo dxxxe meodo el cual corrspondiente a ClusterGCN [explciado marco teorico seccion XXX] obteniendo una accuracy 0.9696 !!!!!!!!!



// Luego para comparar GNN con otros metods para resolver dicha tarea, se probo resolver la atrae de clasificación con PAgeRank, DeepWalk y BGP2Vec.
// Obteniendo Resultados XX, 0.9270 (entrenando ) y XX respectivamente.

// La idea es ver que tan bien se comporta el modelo en comparación con otros metodos que se han ocupado para resolver la misma tarea.





// #table(
//   columns: (auto, auto),
//   inset: 10pt,
//   align: horizon,
//   table.header(
//     [Caso], [Accuracy],
//   ),
//   "GCN + DotProductPredictor",$0.81$,
//   "GraphSAGE + DotProductPredictor", $0.9$,
//   "GCN + MLPPredictor", $0.9221$,
//   "GraphSAGE + MLPPredictor", $0.9546$,
//   "GraphSAGE + MLPPredictor + in_degree y out_degree", $0.9290$,
//   "GraphSAGE + MLPPredictor + features sobre 80%", $0.9452$,
//   "GraphSAGE + MLPPredictor + Random neighbour sampling", $0.9414$,
//   "GraphSAGE + MLPPredictor + ClusterGCN", $0.9696$,
//   "PageRank", $0.8746$,
//   "DeepWalk", $0.9270$,
//   "BGP2Vec", $X$,
//   "Crear de 0", $0.9068$,
// )


// Con GCN el overfitting es más facil que con GraphSAGE, es de esperarxe por la formula de cada una.
// GraphSAGE para que se vea overfitting % de train debe ser más bajo a diferencia de GCN que puede ser alto .

