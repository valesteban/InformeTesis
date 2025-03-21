= Redes Neuronales

== Grafos
#h(0.5cm)Un grafo (@imagen-grafo) es una estructura discreta formada a partir del conjunto de vértices
(también conocido como nodos) y aristas las cuales son las uniones entre estas @gnnReviewMethods. 
De forma
más sencilla un grafo es una representación visual de una relación binaria.
Un grafo $G$ se caracteriza mediante la pareja de conjuntos $(V, E)$ donde $V$ es el conjunto
no vacío de vértices y $E$ denota el conjunto de aristas, este último es, a su vez, es un conjunto
de pares de nodos. Así, la definición de un grafo está dada por $G = (V, E)$.
Usamos $v_i in V $para denotar que un nodo forma parte del grafo y $e_(i j) = (v_i, v_j ) in E$ para
indicar que existe una arista entre el nodo $v_i$ y $v_j$ . Cada nodo $v_i$ tiene vecinos con los cuales comparte una arista, estos se representan de la forma $N (v_i) = {v_j in V : (i, j) in E}$. El número de vértices y aristas en un grafo se representan mediante $n = |V|$ y $m = |E|$.

#figure(
  image("../imagenes/grafoVale.png", width: 40%),
  caption: [Representación de un grafo no dirigido de 6 nodos numerados.],
) <imagen-grafo>


#h(0.5cm)Una forma de representar un grafo es mediante una matriz de adyacencia denotada $A in.small RR^(n times n)$, donde el valor $A_(i j) = 1$ si $e_(i j) in E$ y $A_(i j) = 0$ si $e_(i j) in.not E$.  Si la matriz es simétrica, el grafo es no dirigido; de lo contrario, se trata de un grafo dirigido.


Nodos y Aristas de un grafo pueden contener atributos. De esta manera, los atributos de los nodos pueden ser representados mediante una matriz $H_n in RR^(n times d)$ donde cada fila representa un vector de características de un nodo. En el caso de los atributos de las aristas, estos pueden ser representados por la matriz de adyacencia, en la cual, en lugar de contener 1 y 0, contiene dichos atributos.

Además, los grafos pueden clasificarse en diferentes categorías que ofrecen información adicional y características distintivas. A continuación, se presentan algunas categorías comunes:

    - Grafos dirigidos/no dirigidos: En un grafo dirigido, cada arista tiene una dirección específica, indicando un flujo unidireccional entre los nodos conectados. A diferencia de un grafo no dirigido, donde las aristas no tienen una orientación definida, lo que representa conexiones bidireccionales entre nodos.
    
    - Grafos homogéneos/heterogéneos: En un grafo homogéneo, tanto nodos como aristas son del mismo tipo, en contraste con grafos heterogéneos donde los nodos y aristas pueden ser diferentes y por tanto representar cosas diferentes.

    - Grafos estáticos/dinámicos: Un grafo dinámico experimenta cambios en su estructura a medida que transcurre el tiempo, a diferencia de un grafo estático, que mantiene una topología constante en función del tiempo.
       

== Inteligencia Artificial


#h(0.5cm)Inteligencia Artificial (IA) es un campo de la informática que busca simular el comportamiento de la inteligencia humana, es decir, intenta replicar y automatizar la capacidad del ser humano para tomar decisiones. 

Dentro del área de la Inteligencia Artificial, nos encontramos con el Machine Learning, disciplina que a través del desarrollo de algoritmos y modelos busca que las máquinas aprendan patrones por medio de la experiencia, la cual incluye datos de entrenamiento y retroalimentación. El objetivo es entrenar una máquina para una tarea específica sin la necesidad de programar explícitamente un algoritmo.

Finalmente, dentro de Machine Learning se encuentra el campo de Deep Learning, un área que se centra en el uso de arquitecturas de Redes Neuronales profundas para aprender representaciones de datos de manera jerárquica. A diferencia de Machine Learning convencional, donde las características se extraen manualmente de los datos y se proporcionan al modelo, en Deep Learning, estas representaciones se aprenden de forma automática mientras el modelo lleva a cabo la tarea asignada.
 Una característica distintiva de esta disciplina es el uso de Redes Neuronales, estructuras compuestas por múltiples capas  entre la entrada y la salida. Cada capa procesa la información y extrae características cada vez más abstractas a medida que se profundiza en la Red. Permitiendo así al modelo capturar patrones y características complejas en los datos.


#figure(
  image("../imagenes/Inteligencia Artificial.jpg", width: 40%),
  caption: [jerarquía conceptual entre Inteligencia Artificial, Machine Learning y Deep Learning.],
) <jerarquiaIAMLDL>



+ Machine learning es una rama de la inteligencia artificial, que ya no depende de unas reglas y u programador, sino que la computadora puede establecer sus propias reglas y aprender por si misma

+ Aprendizaje Supervisado: 

== Redes Neuronales 

#h(0.5cm)Una Red Neuronal es un modelo computacional compuesto de neuronas (perceptrones), dispuestas en capas y conectadas entre sí con el fin de aprender patrones mediante el intercambio de información ponderada por pesos. Estos pesos se ajustan en base a los datos de entrada, asignando valores en función del reconocimiento de patrones, que permiten una salida esperada.


#figure(
  image("../imagenes/red_neuronal.png", width: 40%),
  caption: [Arquitectura básica de una Red Neuronal Fully Connected de una capa.],
) <FullyConnectedLayer>



#h(0.5cm)En una Red Neuronal, cada unidad toma entradas, las pondera por separado, suma los valores y pasa esta suma a través de una función para producir una salida, la cual es compartida con otras neuronas a las cuales está conectada. 
El perceptrón, que funciona como una representación matemática de una unidad básica en la Red, realiza cálculos para determinar tendencias en los datos de entrada, asignándole diferentes pesos a cada valor de entrada en base a patrones entre los datos para realizar tareas específicas.



Un perceptrón está compuesto por cuatro elementos distintivos (@perceptron), i) los valores de entrada definidos como $x_i, x_(i+1) , dots.h , x_(n-1), x_n$ donde cada $x_j$ corresponde a un vector de tamaño d, ii) los pesos definidos como  $w_j in WW^(n times d)$ donde $WW$ corresponde a la matriz de pesos los cuales son ajustados durante la etapa de 
entrenamiento de la Red, iii) la suma $z = sum_(j=1)^d w_j x_j + b$ y iv) la función de activación, la cual establece un umbral de salida para evitar que los valores de salida se disparen. Esta función de activación permite incluir más capas y, por ende, mayor complejidad en las arquitecturas de redes que se construyan. Las funciones de activación tienen la capacidad de mejorar el aprendizaje de patrones en los datos@activation-function.
Algunas de las funciones de activación comúnmente empleadas incluyen la Sigmoide, la Tangente Hiperbólica (tanh), la Rectified Linear Unit (ReLU) y la  Leaky ReLU.



#figure(
  image("../imagenes/perceptron.jpg", width: 40%),
  caption: [Estructura general de un perceptrón.],
) <perceptron>



#h(0.5cm)La técnica comúnmente utilizada para el entrenamiento de Redes Neuronales es el _backpropagation_, que tiene como objetivo ajustar los pesos de los parámetros de la Red para minimizar la función de pérdida@back-propagation. Esta función cuantifica la diferencia entre las predicciones hechas y los valores reales. Una vez que se ha calculado la pérdida, el proceso de optimización se centra en modificar los pesos para mejorar la precisión general de la Red.

 Durante el entrenamiento de las Redes Neuronales, se emplea el descenso de gradiente, un método que implica el cálculo de la derivada de la función de perdida con respecto a los pesos de la Red. Este cálculo determina la dirección y magnitud en la que los parámetros de un modelo deben ser ajustados para minimizar la función de perdida. Por ende, es fundamental que esta función sea continua y derivable.
En problemas de regresión, se suele utilizar funciones como el Mean Squared Error y Mean Absolute Error, mientras que en problemas de clasificación, destaca la Cross-Entropy Loss. 


// === Funciones de Activación

// === Función de Pérdida



// === Tipos de Redes Neuronales



=== Redes Neuronales Feed Forward (FFNN)

#h(0.5cm)También conocida como _multilayer perceptrons_, esta arquitectura representa la forma más simple y fundamental de una Red Neuronal, sirviendo como la base de la mayoría de los modelos de Deep Learning. En esta arquitectura la información fluye exclusivamente hacia "adelante", sin bucles o conexiones hacia atrás.

El flujo de información comienza en la capa de entrada, donde se reciben los datos, seguida de las capas ocultas (_hidden layers_ en ingles), siendo las Fully Connected las más comunes (Figura ???fully-connected), donde cada neurona está conectado a cada neurona de la capa anterior. De esta manera, las salidas de cada perceptrón generan una salida que, al estar conectada con otros nodos, funcionan como entrada para la siguiente capa, continuando así hasta llegar a la capa de salida.

El objetivo principal de una Red Feed Forward es aproximar alguna función $f(x)$. Por ejemplo, en un problema de regresión, se busca modelar la relación $y = f(x)$.

// TODO: fully-connected FIGURA

=== Redes Neuronales Recursivas (RNN)

#h(0.5cm)Las Redes Neuronales Recurrentes (RNN) son una variante de las Redes Neuronales Feed Forward, diferenciándose por su capacidad para retener y utilizar información previa, es decir, poseen "memoria".

A diferencia de las Redes Neuronales Feedforward convencionales, que asumen que los datos de entrada en cada capa son independientes entre sí, las Redes Neuronales Recurrentes (RNN) introducen conexiones entre las salidas previas y la salida actual, generando así un proceso de retroalimentación.

Esta característica en las RNN las hace particularmente eficientes para trabajar con datos secuenciales, como en aplicaciones de procesamiento del lenguaje natural incluyendo traducción, generación de texto y la predicción de series temporales.

#figure(
  image("../imagenes/rnn.png", width: 40%),
  caption: [Arquitectura básica de las Redes Neuronales Recurrentes.],
) <rnn>


#h(0.5cm)La imagen de arriba es una representación simple de una Red Neuronal Recurrente ( @rnn). En el lado izquierdo se encuentra la notación abreviada y, en el lado derecho, la notación desplegada para representar RNNs.
Donde $x_t$ es un vector que representa la entrada en el instante de tiempo t. $A$ el estado oculto con el paso del tiempo $t$ y actúa como la "memoria" de la Red, calculando en función del estado oculto anterior y la entrada en el paso actual.

=== Redes Neuronales Convolucionales (CNN)

#h(0.5cm)Las Redes Neuronales Convolucionales ( @cnn) son un tipo especializado de modelo de Red Neuronal diseñado especialmente para procesar información en forma de grilla @deep-learning. Su aplicación principal se encuentra en el análisis de imagenes, en el reconocimineto de objetos, clases y categorías. 


Las CNN se componen de una capa de entrada, una capa de salida y varias capas ocultas intermedias. Estas capas ocultas llevan a cabo operaciones de convolución, lo que les permite aprender características específicas de las imágenes. En el proceso de convolución, se aplican filtros, a través de matrices de pesos. Estos filtros aprenden a detectar diversas características como bordes, patrones, colores, entre otros. Así a medida que se avanza en las capas de la CNN, la red es capaz de reconocer elementos más complejos.

#figure(
  image("../imagenes/cnn.jpg", width: 40%),
  caption: [Estructura de un modelo de Convolucional con tres capas.],
) <cnn>


=== Graph Neuronla Network (GNN)

#h(0.5cm)Las GNN son una arquitectura de Redes Neuronales especialmente diseñada para realizar predicciones basadas en datos representativos de grafos. A diferencia de las Redes Neuronales convencionales, las GNNs reciben datos en forma de tensores que pueden representar nodos, atributos de nodos, aristas y atributos de aristas.

Existen diferenets enfoques, dependiendo de la tarea de aprendizaje que se quiere llevar a cabo, estos son:

- Nivel de nodo: Incluye tareas como clasificación, regresión y clustering de nodos. Se realizan inferencias a partir de las conexiones con otros nodos. 


- Nivel de  aristas: Se abordan tareas de clasificación y predicción de aristas. Por ejemplo, determinar la existencia de una relación entre dos nodos.

- Nivel de grafo: Se encuentran tareas de clasificación, regresión y matching de grafos para las cuales el modelo debe ser capaz de aprender una representación para el grafo completo.


Las GNN tienen una serie de ventajas sobre las Redes Neuronales convencionales cuando se trabaja con datos de grafos. En contraste con los modelos tradicionales, las GNN aprovechan las relaciones entre las entidades que conforman los datos de entrada a el modelo. Estas relaciones pueden incluir aspectos como orden, jerarquía, dependencias o relaciones de otro tipo que son comunes en grafos y se representan a través de las aristas que conectan los nodos.

En cuanto a la adaptabilidad a variaciones en el tamaño de entrada, las Redes Neuronales convencionales requieren que los datos de entrada mantengan un mismo tamaño. Para ello, recurren a técnicas como padding o broadcast, los cuales no tienen efectos significativos en el desempeño de los modelos. Las GNNs, por su parte, ofrecen flexibilidad para adaptarse a distintos tamaños de entrada@GCN.

Otro motivo para optar por GNNs es su capacidad para manejar el isomorfismo de los grafos, es decir dos grafos pueden lucir diferentes, pero ser estructuralmente iguales. Un modelo tradicional trataría ambos grafos como si fuesen datos diferentes, sin embargo, no lo son. Esto es comparable a lo que sucedería si se le presenta como entrada dos imágenes donde una se encuentra invertida. Es por esta razón que no se puede trabajar directamente con una matriz de adyacencia en una Red Feed Forward, ya que es sensible a estos cambios. Las GNNs utilizan técnicas que son invariantes ante permutaciones, lo que permite trabajar con el isomorfismo en grafos.

Finalmente, el último desafío radica en que la estructura de un grafo no puede ser reducida a un espacio euclidiano, y su conceptualización no puede limitarse a una distancia euclidiana@EuclideanGNN. A diferencia de Redes Neuronales que trabajan, por ejemplo, con imágenes, las cuales pueden ser interpretadas como un grafo, la representación de la información se puede entender en términos de píxeles en un espacio bidimensional. 

Así, la esencia detrás del uso de GNNs radica en su capacidad de entrenar un modelo que pueda procesar un grafo, sus nodos y relaciones, logrando identificar patrones relevantes en la topología para lograr de forma efectiva la tarea asignada.
Por ejemplo, en el ámbito de las redes sociales, las GNNs pueden ser utilizadas para clasificar usuarios según sus interacciones, identificando así grupos afines. Otra aplicación puede ser la recomendación de contenido de interés de un usuario, basándose en sus conexiones y preferencias históricas. En el campo de la biología, es posible predecir el tipo de moléculas basándose en sus características estructurales y propiedades.


El diseño de una GNN se hace por medio de la combinación de diferentes módulos: 

- Módulo de propagación: Este módulo se utiliza para propagar información entre los nodos capturando tanto la topología como los atributos de los nodos. Esto se logra combinando los datos de cada nodo con los de sus vecinos.

- Módulo de muestreo: Cuando los grafos son muy grandes, se utiliza generalmente un módulo de muestreo con el fin de seleccionar un subconjunto del grafo, aportando de este modo  en la capacidad de generalización de un modelo y reducción de complejidad. Se combina generalmente con un módulo de propagación.

- Módulo de pooling: Cuando se necesita representaciones de subgrafos su utiliza este módulo para extraer información de los nodos. Se utiliza para reducir la dimensionalidad de las representaciones de nodos. 

Un modelo GNN se construye generalmente combinando estos módulos. A continuación ( @pipelineGNN), se ilustra el pipeline de una arquitectura GNN. 
El modelo recibe como entrada un grafo, y en la capa GNN, se emplea un operador convolucional, un módulo de muestras y una operación skip-connection que se fusionan para propagar la información y extraer detalles de alto nivel mediante el módulo de pooling. Después de pasar por todas las capas intermedias, se obtiene una salida en forma de embeddings, a los cuales se les aplica una función de pérdida para obtener los resultados del ajuste del modelo en base a la tarea asignada.


#figure(
  image("../imagenes/basepipelineGNN.png", width: 60%),
  caption: [Pipeline básico de una arquitectura GNN.],
) <pipelineGNN>

==== Message Passing Neural Networks (MPNN)
    
#h(0.5cm)Es la arquitectura de Red Neuronal para grafos más utilizada. Su funcionamiento radica en la idea de que cada nodo en un grafo puede intercambiar información con sus vecinos de manera que cada nodo podrá actualizar su representación en base a la información acumulada por su entorno.


La información se propaga entre nodos a través de mensajes. Cada nodo envía mensajes a sus nodos vecinos y recibe mensajes de ellos. Estos mensajes pueden contener información sobre el nodo emisor y se utilizan para actualizar la representación del nodo receptor@mpnn.


Se emplea un mecanismo denominado _message passing_, el cual consta de tres pasos:
+ Propagacion de mensajes entre nodos: Cada nodo envía un mensaje que contine su representación actual a sus nodos vecinos.
+ Aplicación de una función de agregación: Luego de la propagación de mensajes, se aplica una función de agregación para combinar la información recibida de los nodos vecinos.
Esta función puede adoptar diversas formas como la suma o la media.
+ Actualización de la representación: La representación de cada nodo se actualiza mediante la información agregada proveniente de sus nodos vecinos, así como a partir de su representación previa.



A continuación ( @pipelineMP), se presenta el comportamiento de una capa de MPNN para un nodo. El proceso inicia con el envío de un mensaje M por parte de cada nodo vecino de $B$. $B$  recibe estos mensajes y los agrega mediante una operación generando una representación $A$. Finalmente, el nuevo estado del nodo $B$ se calcula mediante una última función que toma el valor $A$ y su propia representación para crear su nueva descripción $U$.

#figure(
  image("../imagenes/MPNN.png", width: 60%),
  caption: [Flujo de Message passing para un nodo del grafo.],
) <pipelineMP>

==== Graph Convolution Network (GCN)



#h(0.5cm)Es un tipo específico de MPNN, donde se utilizan convoluciones de grafos para agregar información de los nodos adyacente de un nodo en un grafo. 

La operación de convolución en el grafo produce la suma normalizada de las características de los nodos vecinos@GCN-formula. Esta normalización garantiza que la información agregada sea ponderada correctamente, es decir, evitar que un nodo con gran cantidad de vecinos tenga una representación desproporcionada y que luego tenga una influencia mayor en la representación otros nodos en las siguientes capas.

La notación de los embeddings de los nodos está dado por: 

$
H^((l+1)) = sigma(tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) H^((l)) W^((l)))
$
#h(0.5cm)Donde  $sigma$ se define como la función de activación, $H^((l))$ la matriz de caracteristicas de los nodos en la capa $l$, $W^((l))$ la matriz de aprendizaje de pesos, con dimensionalidades dada por el tamaños de atributos entrantes y de salida por capa y $tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) $ la matriz de adyacencia normalizada.  

Es asi como GCN permite la creación de embeddings para los nodos de un grafo dada la matriz de adyacencia de este, lo que quiere decir que debe conocer el grafo completo para poder realizar la tarea de aprendizaje. Este es un enfoque transductivo, en contraste a otros enfoques inductivos como GraphSAGE.


==== Graph Attention Network (GAT)

#h(0.5cm)Otra variante de MPNN son las Graph Attention Networks (GAT). A diferencia de una Red Neuronal de Convolución, GAT incorpora un mecanismo de atención que permite que cada nodo pondere de forma diferenciada, indicando la importancia de las representaciones de cada vecino para la actualización de las características de un nodo@GAT.

Los coeficientes se calculan por un mecanismo el cual calcula un puntaje para cada par de nodos. Luego estos puntajes se normalizan por medio de la función SoftMax ( @calculoGAT).

Así tenemos:

$
   z^((l))_(i) = W^((l)) bold(h^((l))_i)
$<gat-formula-1>

$   
  e^((l))_(i j) = "LeakyReLU" (bold(a)^((l)T)(bold(z)^((l))_i || bold(z)^((l))_j))
$<gat-formula-2>

$
   alpha^((l))_(i j) = frac(e^((l))_(i j),sum_{k in N(i)} exp(e^((l))_(i k)))
$<gat-formula-3>

$
    h^((l+1))_i = sigma(sum_(j \in N(i)) alpha^((l))_(i j) z^((l))_j)
$<gat-formula-4>

#h(0.5cm) Donde la @gat-formula-1 corresponde a la transformación lineal del embedding de la capa anterior $h^((l))_i$ con $ W^((l))_i$ una matriz de pesos entrenable.

La @gat-formula-2 calcula un puntaje de atención entre dos vecinos.  Primero concatena los embeddings $z$ de dos nodos. Luego realiza el producto punto entre este y una matriz entrenable $a^((l))$  y aplica una función LeakyReLU al final.

En @gat-formula-3 se aplica una función softmax, con el objetivo de normalizar los puntajes de atención en las aristas entrantes de cada nodo.

Finalmente, en la @gat-formula-4, al igual que en GCN, se lleva a cabo la agregación de los nodos vecinos, pero en este caso, se escala por el puntaje de atención. Se utiliza  $sigma$ como la función de activación que se aplicará a la capa.

#figure(
  image("../imagenes/GAT.png", width: 40%),
  caption: [Pipeline del mecanismo de cálculo de las ponderaciones para una GAT.],
) <calculoGAT>



==== GraphSAGE (SAmple and aggreGatE)

#h(0.5cm)Es un framework de aprendizaje inductivo el cual nos permite aprender representaciones de los nodos de un grafo. A diferencia de los enfoques anteriores los cuales son inherentemente transductivos donde se crean las representaciones de los nodos por medio de la recolección de la infomeación de todos sus nodos vecinos, utilizando factorización de matrices, GraphSAGE "aprende" a crear las representaciones de sus nodos, es decir graphSAGE utiliza las caracteristicas de nodos de su vecindario y la topología para aprender una funcion que genera los embeddings en base a un muestreo de nodos vecinos. Ayudado de esta forma a generalizar sobre nodos no vistos naturalmente @GraphSAGE. 
GraphSAGE no necesita de todos sus vecinos durante el entrenamiento para crear una representacion de el mismo, sino que a traves de un subconjunto de estos aprendera a crear un embedding, que representa su rol local y global en un grafo.
 

¿Qué significa que sea Inductivo?

Que sea inductivo significa que puede crear embeddings para nodos no vistos durante el entrenamiento. Es decri no necesesita conocer todo el grafo ni todos lso nodos para crear estars representaciones. 
Este enfoque es util principalmente a la hora de trabajar con grafos dinámicos, batching/sampling, etc. Representando asi a nodos een un vector de baja dimensionalidad y generalizondo para luego nodos no vistos.

El proceso de creación de embeddings para los nodos del garfo estan dados por las siguientes ecuaciones:
$
   h^((l+1))_(N(i)) = "aggregate" ({ h^l_j, ∀ j ∈ N(i) })
   
$<graphsage-formula-1>

$
h^((l+1))_i = σ(W ⋅ "concat"(h^l_i, h^((l+1))_(N(i))))
$<graphsage-formula-2>

$
h^((l+1))_i = "norm"(h^((l+1))_i)
$<graphsage-formula-3>


#h(0.5cm)Donde $h^((l+1))_(N(i))$ de la @graphsage-formula-1 representa las características de nodos vecinos de un nodo $i$ en la capa $l+1$ el cual a traves de una funcion de agregación combian estos nodos vecinos (por ejemplo promedio, suma, lstm, etc).
Luego tenemos $h^((l+1))_i$ correspondiente a la concatenación de la representación anterios del nodos $i$ y la de las caracteristicas de nodos vecinos de la capa $l+1$, correspondiente a lo previamente calculado.
Finalmente tenemos $"norm"(h^((l+1))_i)$ la cal se encarga de normalizar las caracteristicas del nodo $i$ en la capa $l+1$.


A continuación tenemos @graphsage, el cual ilustra el proceso de creacion de las representaciones de los nodos. Dado primero 1) por la selección de un numero fijo de vecinos de un nodo, 2) Luego la agregación y concatenaciń de las caracteristicas de estos nodos al nodo dst junto con normalizacion, 3) Fianlemente el paso de prediccion y ajuste de valores de los pesos de la red. 
// GraphSAGE @GraphSAGE
#figure(
  image("../imagenes/sample_and_agg.png", width: 60%),
  caption: [TODO.],
) <graphsage>


// === Procesamiento de Datos

// === Entrenamiento
// #h(0.5cm)Existen 2 approach oara llevar a cabo el entrenamiento de una GNN, estos son:

// - Inductive Learning: Se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos.


// - Transductive Learning: Se entrena el modelo en todo el grafo y luego se evalúa en un subconjunto de nodos.


// #figure(
//   image("../imagenes/InductiveTransductive.jpg", width: 60%),
//   caption: [Inductive y transductive settings para entrenar y testear un modelo GNN.],
// ) <SettingStochasticGradientDescent>

// En el caso de la tarea de classificación de nodos, en el enfoque inductivo, se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos. En cambio para el enfoque transductivo, Se tiene un solo gran grafo de donse un subconjunto de este es seleccionado para entrenar el modelo y el resto para testearlo.

// ==== Optimización

// #h(0.5cm)Un modelo de Deep Learning consiste en multiples capas de neuronas, las cuales se conectan entre sí  y organizadas en capas, estas son parametrizadas por pesos y sesgos. Estos parámetros son ajustados durante la etapa de entrenamiento de la Red, con el fin de minimizar una función de perdida, ed decir la diferencia entre la salida del doelo y los valores reales.
// En @opt-grad-loss se muestra un esquema del proceso de entrenamiento de una Red donde tenemos nuestra Red , la cual arroja $attach(y, tr:')$ correspondiente a las predicciones realizadas por el modelo. Luego estos valores son pasados en conjunto con los valores reales/esperados a la funcion de perdida, la que calcula la diferencia entre estos vallores. Con est error se realiza el _backpropagation_ calculando el gradiente de la función de perdida con respecto a los pesos de la Red. 

// #figure(
//   image("../imagenes/Deep-Learning-Optimization-Algorithms.png", width: 60%),
//   caption: [Visualización esquemática del proceso de entrenamiento en un modelo de Red Neuronal.],
// ) <opt-grad-loss>

// *¿Qué es backpropagation?*
// Es el paso en el entrenamiento de una Red donde se ajutan los parametros de la Red en base a a la funcion de perdida y el algoritmo de optimización utilizado, este ultimo se encarga de calcular valor/cantidad que irá cambiando la Red/parametros de la Red.

// // FIXME: Agregar una mejor descripcion de "Algoritmos de de optimización"

// *¿Que son los optimizadores?*
// Los optimizadores son algoritmos o metodos encargados de ajustar que se realiza en cada iteración de los pesos de los parametros está dado por un _algoritmo de optimización_, el cual utiliza los gradiente calculados por _backpropagation_ para determinar el cambio de estos pesos. Es decir controla como (maggnitud y direccion) de los pesos de un modelo para lograr modelar las relaciones entre los datos con el problema.

// // Optimizers help to know how to change weights and learning rate of neural network to reduce the losses.

// Existen diferentes algoritmos de optimización los cuales se ajustan a diferentes problemas. Esstos buscar minimizar la función de perdida, es decri llegar a un minimo global. La desicion de esto puede estar dada por ejemplo enfocado en mejorr la precisión, reducir el tiempo de entrenamiento o gestionar los recursos computacionales.
// ALgunos de estos son:
// // FIXME: Decir en alguna parte  "ocupan diferentes estrategias para escapar de minimos locales"

// - Stochastic Gradient Descent (SGD)
// - Mini-batch Gradient Descent
// - AdaGrad (Adaptive Gradient Algorithm)
// - RMSprop (Root Mean Square Propagation)
// - AdaDelta
// - Adam (Adaptive Moment Estimation)

// ----------------------------------------------------
// // Definición GD
// *_Gradient Descent o Bacth Gradient Descent_*
// Es el algoritmo de optimización más basico y común.
// comienza en un punto aleatorio y se mueve en la direccion opusta del gradiente de la función de perdida.
// Los "pasos" que van dando para acercarse a un minimo están dados por el valor de _learnin rate_  en cada iteración.
// Se le pasa todo el dataset antes de calcular el gradiente y actualizar los pesos. Es decir se espera el paso de un forward de un epoch antes del _backpropagation_ y actualización de los pesos. 
// Hay un risego de overfittig  ya que el modelo es expuesto de forma reptida eln el mismo orden.

// // Explicación Figura
// En @gradientDescent muestra una como el calculo del gradiente nos permite ir avanzando en la función convexa a un minimo, lugar donde se espera se ajuste de mejor manera los pesos de los parametros de la Red.
// Se calcula el gradiente de la función de pérdida utilizando todo el conjunto de datos de entrenamiento antes de actualizar los parámetros. Esto puede requerir una gran cantidad de memoria además de ser más lento. Puede ser csotoso si el dataset es muy grande (necesita realizar calculos sobre todos los ejemplos antes de ajstar los parametros).


// Este esta dado por la siguiente formual matematica,donde se actualizan los nuevos pesos:

// $
// w = w - alpha * gradient_(w) J(w)
// $

// Donde $w$ corresponde a los pesos de los parametros del modelo,  $alpha$ el _learning rate_ y $gradient_(w) J(w)$ el gradiente de la función de perdida con respecto a los pesos de la Red.

// #figure(
//   image("../imagenes/Deep-learning-optimization-algorithms-1.png", width: 60%),
//   caption: [visualizaacion optimixacion del aLgoritmo de Gradient Descnt aolicada a una funcion convexa.],
// ) <gradientDescent>
 
//   #figure(
//     image("../imagenes/BatchGradientDescent.jpg", width: 30%),
//     caption: [Batch Gradient Descent.],
//   ) <BatchGradientDescent>


//   #figure(
//     image("../imagenes/BATCHSGD1.png", width: 30%),
//     caption: [Batch Gradient Descent.],
//   ) <BatchGradientDescentVisualization>


// ------------------------------------------------------
// // Definición SGD
// - *Stochastic Gradient Descent*: 
// Es una variante de la funcion de optmizacion _Gradient Descent_ a diferencia de  que esta actualización se realiza para cada elemento, es decir, calcula el gradiente y se realiza un update de los pesos para cada muestra del dataset.

// Es por esto que los parámetros se ajustan con más frecuencia, lo que peude hacer que sea más rapido que SG y por eende converger antes. Cabe mencionar que debido a la aleatoriedad de las muestras y diferencia entre estas, la trayectoria de la convergencia puede ser ruidosa, aunqye ayudando a no estancarse en minimos locales . 

// Su formula esta dada por:
// $
// w = w - alpha * gradient_(w) J_(i)(w)
// $
// Donde $w$ representa los parametros del modelo, $alpha$ el _learning rate_ y $gradient_(w) J_(i)(w)$ el gradiente de la funcion de perdida para el i-esimo ejemplo de entrenamiento con respecto a los pesos.
// #figure(
//   image("../imagenes/MiniBatchGradientDescent.jpg", width: 30%),
//   caption: [Stochastic Gradient Descent.],
// ) <StochasticGradientDescent>


// #figure(
//   image("../imagenes/SGD1.png", width: 30%),
//   caption: [Stochastic Gradient Descent.],
// ) <StochasticGradientDescentVisualization>


// -----------------------------------------------
//   - *Mini Batch Gradient Descent*: 
//   El dataset es dividido en subconjuntos llamados _mini.batches_. La actualización de los pesos de los parametros se actualiza por mini-batch. Se introduce un nuevo hiperparámetro correspondiente al tamaño de los _mini-batches_.

//   #figure(
//     image("../imagenes/StochasticGradientDescent.jpg", width: 30%),
//     caption: [Batch Gradient Descent.],
//   ) <MiniBatchGradientDescent>

//   #figure(
//     image("../imagenes/optimizing.jpg", width: 60%),
//     caption: [Tipos de Entrenamineto.],
//   ) <SGD-BGDMBGD>



// -----------------------------------------------

// - *Descenso del Gradiente con Momentum*:
// Introduce un término de "momentum" (inercia) en el cálculo del gradiente para evitar oscilaciones y hacer que el proceso de optimización sea más suave y eficiente.
// Ayuda a no quedar atrapado en minimos locales  de la función de perdida.


//   #figure(
//     image("../imagenes/SGDwithmomnetum.png", width: 60%),
//     caption: [Descenso del Gradiente con Momentum:],
//   ) <SGD-with-momentum>

// Su formula matematica esta dada por:

// $
// nu = nu*eta - alpha * gradient_(w) J(w)
// $

// Donde $eta$ se define como el momentum, $alpha$ el _learning rate_ y $gradient_(w) J(w)$ el gradiente de la función de perdida con respecto a los pesos de la Red. Con esto tenemos que cada "paso" depende de los pasos anteriores ayudando a reducir ruido en lal convergencia.
// -------------------------------------------------
// - *AdaGrad(Adaptive Gradient Descent)*: 

// Ajusta dinamiacmente durante el valor del _larnign rate_. Asigna un _learning rate_ para cada paŕametro del modelo, basandose en al magnitud d elos gradientes previos. 
// A medida que se va iterando en el entrenamiento, s ev aacumulando el cuadrado de los gradinetes de cada parámetro. Recordando asi lo que ha cambiado el gradiente a lo largo del tiempo. Así  parámetros con gradientes grandes tendrán una tasa de aprendizaje reducida, lo que previene actualizaciones grandes, mientras que los parámetros con gradientes pequeños se actualizan más rápidamente. //FIXME: Es un copy paste de chatgpt

// Es ineficiente para tareas que requieres un entrenamiento largo, debido a que latasa de entrenamiento irá decayendo haciendo que luego se vuelva muy pequeña.


// -----------------------------------------------
// - *AdaDelta:* Es una mejora sobre AdaGrad, la cual toma la misma formula, pero en vez de tomar todo el historial de derivadas al cuadrado, lo toma en una ventana de tiempo ($delta$). //ejemplo, toma el catch de las ultimas 5 actualizaciones 

// // ------------------------------------------------
// // - *RMSprop*: Root Mean Square Propagation, Ajusta la tasa de aprendizaje de forma adaptativa para cada parametro, utilizando el promedio de los cuadrados de los gradientes.
// // Incorpora el concepto de Decain Rate o decain catch, introduce una nueva variable d , ell cual es un valor que multiplicamos por el catch para enfatizar que queremos tomar en cuenta los valores más recientes y disminuir el impacto de los valores más antigusos
// //FIXME: yo creo que lo voy a sacar

// ----------------------------------------------
// - *Adam (Adaptive Moment Estimation):* Uno de los optimizadores más utilizados, ajusta dinamicamente el _learning rate_ para cada parametro. Adam toma en cuenta la evolución del _learnig rate_ y la evolución de los pesos por medio de la media y varianza y los incorpora al caluclo de los nuevos pesos. Combina las ideas de  AdaGrad y RMSprop. 


// $
// "pesos" = "pesos" - ("Momentum y varianza combinados")
// $


//   // (m , la media de los pesos  alo largo del timmepo ) (v, como han variado esos pesos a lo largo del tiempo  ) 

// // ------------------------------
// // ----------------------------------------------------

// // - *Descenso de Gradiente Estocástico con Nesterov Momentum*:
// // Variante del descenso de gradiente con momentum que realiza una "anticipación" antes de calcular el gradiente. Mejora la velocidad de convergencia en algunas situaciones.
// // Los más utilizados son stochastic Gradient Descent, Adam y RMSprop. SGD es la que más control nos d asobre la Red Neuronal a pesar de ser la menos adaptativo ya qie ADAM y RMSprop son adaptativos y se ajustan a los datos sin nosotros tener mucho control sobre ellos..

// // ---------------------------------------------
// *¿Cuál es la importancia del _Learning Rate_?*

// El _learning rate_ es un hiperparámetro lo que quiere decir que es selecionado manualmente, este ajusta la velocidad a la que vamos a ir dando los "pasos" en cada iteracion para acercarse al minimo de la funcion de perdida para aquellos optimizadores que no lo haedn dinamicamente durante el entrenamiento. La impirtancia d eeste radica en encontrar un valor optimo, de ocupar un _learning rate_ muy pequeño puede hacer que el modelo tarde mucho en converger, ademas de quedarse en un minimo local, de lado contrario uno muy grande puede hacer que el modelo no converga o incluso diverga.

// #figure(
//   image("../imagenes/learningRate.png", width: 60%),
//   caption: [visualizaacion learning Rate grande y chico.],
// ) <learningRate>

// //FIXME: Agregar descipción imagen
// ==== Sampling (Muestreo)


// #h(0.5cm)
// _Sampling_ (muestreo en español) en Machine Learning coresponde a la tecnica utilizada para seleccionar subconjuntos de datos para entrenar o evaluar un modelo, en ve de utilizar el conjunto de datos completo. 
// Esta tecnica se puede susar por diferentes motivos como por ejemplo dataset muy grandes y donde es computacionalmente costoso porcesar todos los datos en cada iteración del entrenamiento, otra razon es  la generalización, al muestrear diferentes subconjuntos de datos en diferentes iteraciones, el modelo tiene más probabilidades de generalizar de forma correcta y no sobreajustar los datos.

// #figure(
//   image("../imagenes/Sampling.png", width: 60%),
//   caption: [Sampling.],
// ) <Sampling>

// Existen diferentes tipos de muestreo, algunos de ellos son:


// + *Random Sampling:* Es la tecnica más simple de muestreo en Machin eLearning. Consiste en  seleccionar muestras de forma aleatoria del dataset, in usar nungun patrón especifico. Este metodo asume que todas las muestras del dataset son igual de importante y la misma probabilidad de ser seleccionada.





// + *Stratified Sampling:* 
// Esta tecnica de muestreo se usa cuando queremos teenr que existan de forma equilibrada los distintos subconjuntos/estratos de datos presente en el entrenmaiento, validacion y testing. 
// Esta tecnica se usa especialmenet en tareas de clasificación para datasets desbalanceados, donde se hay mas muestras de un tipo que de otra.
// Para estoel dataset se divide en estartos, luego dentro de cada uno de estos subgrupos se seelccionan muestras al alazar en las mismas proporciones e que están presentes en el dataset completo.

// Algunas de estás tecnicas son:


// #figure(
//   image("../imagenes/stratifiedSampling.png", width: 60%),
//   caption: [Cluster sampling.],
// ) <stratifiedSampling>

// + *Systematic Sampling:* Es un metodo de muestreo probabilistico.

// Primero se ordena el dataset de manera secuencial en base algun criteorio. Luego se calculo el intervalo de muestreo $k = frac(N,n)$ $N$ nuemro total de elementos en el conjunto y $n$ numero de muestras  aseleccionar. Se selecciona asi un punto de partida aleatorio y de ahi se seleccionan muestr as a intervalos regulares, saltando k elemntoscada vez, hasta completar las muestras deseadas.
// //FIXME: Asegurarse que estoe s correcto, especialmente la primera arte.



// + *Cluster Sampling:* Tecnica usada cuando el conjunto de datos es muy grande y naturalemnet está separado por grupos, donde luego se seleccionan algunso de estos conglomerados completos de manera aleatoria. A diferencia de stratified sampling donde los estratos son homogeneos dentro de un grupo, en cluster sampling estos son más heterogeneos , es decir pueden ser diferentes entre sí , no se seleccionan induvidualemnte las muestras, sino que se selecciona un grupo completo.
// Es util cuando naturalmente las muetras estan divididas en conglomerados y son representativas del global.
// Por ejemplo: queremos obtener un sampling de poblacion, y donde cada cluster supone un grupo de personas que viven en una misma area. Se seleccionan algunos de estos clusters de manera aleatoria y se toman todas las muestras de este grupo para el estudio.


// #figure(
//   image("../imagenes/clusterSampling.png", width: 60%),
//   caption: [Cluster sampling.],
// ) <clusterSampling>


// Para el caso de Graph Neural Network existen tecnicas especificas debido a que estamos trabajando con grafos y las muestras seleccionadas deoendiendo de la tarea serán nodos que aun asi estan conectados a otros nodos, es decri a apesar q se selecionan unos nodos y otros no,e stos forman parte de una estructura completa q al momento del entrenamiento se verán afectada por sus vecinos.
// Sampling en GNN es esencial debido a la naturaleza estructurada y muchas veces masiva de los grafos.
// Las tecnicas utilizadsd en GNN  se pueden dividir en 4 categorias principales: Random Node Sampling, Neighbor Sampling, Layer Sampling y Subgraph Sampling.

// //TODO: Arrgeglar 
// Methods used in trainig GCN are performed  by selecting partial nodes in a graph as a sample based  on the specific rule

// Reduce the computation and storage cost for GCN training.
// Asegurando la eficienci a y escalabilidad en el proceso de trianing un modelo GCN

// // FIXME: Pensar y dejar asi o cambiar a primero Node-base sampling, layer-base sampling y subgraph asmplig

// //TODO: Leer esto:
// //  "Sampling methods for efficient training of graph convolutional networks: A survey" 
// // https://arxiv.org/pdf/2103.05872


// // https://cogdl.ai/gnn2022/courseware/L5_sampling_based_graph_neural_networks.pdf

// + *Random Node Sampling:* Se selecciona de forma aleatotia un subset de nodos del grafoo completo. Reduce el costo computacional en comparacion a entrenar todos los nodos de un grafo, sin emabrgo habrá redundancia al calcular los embeddings si esque dos nodos comparten el mismo vecino, el embedidng de dicho nodo será calculado dos veces. 

// + *Neighbor Sampling:* Se selecciona un numero expecifico de vecinos para cada nodo en cada capa de la Red. Esto permite reducir el costo computacional y la redundancia en el calculo de los embeddings, ya que es menos probable que en coparscion a  la tecnica anterior haya redndancia a la hora de calcular los embeddings de un mimso vecino. 

// PAPERS: GraphSAGE@GraphSAGE, 
// PAPERS: PinSAGE@PinSAGE, @VRGCN

// + *Layer Sampling:* Realiza un muestreo por capas de forma aleatoria  entre las capas. Una desventaja de esta tecnica es que peude causar nodos aisaldos. Tiene como objetivo evitar el calculo redundante en el muestrei po rnodos. Permute un uso más eficiente de memoria.


// Ejemplo de Papers FstGCN@FastGCN, Adaptative Sampling@AdaptiveSampling, LADIES@LADIES

// + *Subgraph Sampling:* Extrae subgrafos de manera aleatoria o divide el grafo original en subgrafos. Estos se entrenan como muestras de datos independientes. Reduce el tamaño significativamente  de la data que la GNN tiene que procesar en cada iteracion.  

// PAPERS: GraphSAINT @GraphSAINT, ClusterGCN @ClusterGCN


// ¿Qué es Bacth Normalization?
// Tiene el fin de estabilizar el training de la GNN.
// Reescala cada salida de las layers ara que su promedio y varianza a traves del batch $B$ 

// $
// m_(h) = frac(1, |B|) sum_(i in B) h_i
// $
// $
// s_(h) = sqrt(frac(1, |B|) sum_(i in B) (h_i - m_(h))^2)
// $
// Se calcula el mean y variance sobre |B| embeddings en un batch B.

// $
// h_i <-- frac(h_i - m_(h), s_(h)+ epsilon.alt )
// $

// $
// h_i <-- gamma h_i + delta
// $

// Normalizar los node embeddings usando el mean y variance calculado en el paso anterior.


// #figure(
//   image("../imagenes/BNLayer.jpg", width: 60%),
//   caption: [Explciacion FIXME:.],
// ) <SGD-BGDMBGD>

// ¿Qué pasa si este weigh termina siendo muy grande (encomparación a otros)?
// Hara que la salida d ela neurona sea muy grande, afectando asi a la siguente capa, causando inestabilidad en el training.
// Nomlamente se normaliza los inputs  y entonces por que no normlaizar entre capas?
// - Acelera el entrenamiento (podemos ocupar lr mas grandes)
// - Disminuye la imortancia de los pesos iniciales 
// - Regulariza el modelo (un poquito)

// Entonces la idea es qu elos pesos no sean muy grandes o muy chicos  y asi no se ve aafectada al estabilidad del modelo.

// #import "@preview/algorithmic:0.1.0"
// #import algorithmic: algorithm

// #algorithm({
//   import algorithmic: *
//   Function("Batch Normalization", args: ("X", "gamma", "beta", "epsilon"), {
//     Cmt[Calculo mean mini-batchten]
//     Assign[$mu_(Beta)$][$frac(1,m) sum_(i=1)^m x_i$]
    
//     Cmt[Calculo varianza del mini-batch]
//     Assign[$sigma^2_(Beta)$][$frac(1,m) sum_(i=1)^m (x_i - mu_beta)^2$]
    
//     Cmt[Normalizar]
//     Assign[$attach(x_i, t: hat)$][$frac(x_i - mu_Beta, sqrt(sigma^2_Beta + epsilon))$]
    
//     Cmt[Scale and shift]
//     Assign[$y_i$][$gamma attach(x_i, t: hat) + beta $]
  
//   })
// })

// // ¿Cuál es la importancia de *sampling* en Machine Learning?

// //  2. Enhancing Model Performance

// // Sampling techniques directly impact the performance of machine learning models. By using appropriate sampling methods, data scientists can ensure that their models are trained on balanced and representative data, which is crucial for building accurate and reliable predictive models. 

// //  3. Tackling Class Imbalance

// // Many real-world problems involve imbalanced classes (e.g., fraud detection, disease diagnosis), where one class is significantly underrepresented in the dataset. Sampling methods like stratified sampling, oversampling, and undersampling are essential for addressing these imbalances, helping to improve model sensitivity to minority classes and thus, their overall performance. 

// //  4. Efficiency and Cost-effectiveness

// // Some sampling techniques can make the data handling process more efficient and cost-effective. For example, cluster sampling can reduce the need for data collection and processing resources when the population is geographically dispersed or when data collection is expensive. 
// //  5. Compliance with Data Regulations

// // In industries where data privacy and compliance are critical (e.g., healthcare, finance), sampling methods can help in working with anonymized or reduced subsets of data, ensuring that data scientists can develop and test models within the confines of regulatory frameworks. 

// // 6. Scalability and Big Data Applications

// // With the advent of big data, techniques such as reservoir sampling become indispensable for data scientists. They allow for the processing of streaming data or very large datasets that cannot be fully loaded into memory or storage, enabling the development of scalable algorithms and applications.
// // 7. Informed Decision-making

// // Sampling is a crucial step in exploratory data analysis. Data scientists must make informed decisions about which data to collect and how to analyze it. Understanding sampling methods allows them to derive insights and make predictions that are representative of the broader population or phenomenon under study.
// // 8. Building Trust in Machine Learning Models

// // Proper sampling can lead to more robust and interpretable models. When stakeholders see that models are built on sound statistical foundations, they are more likely to trust and adopt machine learning solutions.
// // 9. Continuous Learning and Adaptation

// // Industry data is dynamic, and models may need to be updated or retrained periodically. Sampling methods can help in creating efficient pipelines for continuous learning from new data without the need to retrain on the entire dataset.

// // In summary, knowledge of sampling techniques is fundamental for data scientists to handle data effectively, build better models, ensure compliance, and make informed decisions, which are all critical components of their role in the industry.


// ==== Regularización
// #h(0.5cm)Una de las metas que se tiene al momento de entrenar un modelo es evitar el overfitting y por ende que pueda generalizar los resultados de forma optima.
// Es decir logre la tarea correctamente en un dato nunca visto anteriormente.



// // FIXEM: No creo que agrege esto, por mientras lo dejare
// Uno de los obstaculos que ocuren engran medida causando un mal desempeño de u nmodelo es el sobreajuste y subajuste.
// Este se puede ver en @EvaluationClassificationRegresion

// #figure(
//   image("../imagenes/EvaluationClassificationRegresion.png", width: 60%),
//   caption: [Evaluation.],
// ) <EvaluationClassificationRegresion>



// Overfitting: Ocurre cuando un modelo sea ajusta demasiado a los datos de enrenamiento, de forma que se los aprende de memoria y no puede generalizar a nuevos datos. Es decir, el modelo se ajusta demasiado a los datos de entrenamiento y no puede generalizar a nuevos datos.

// Underfitting: Ocurre cuando el modelo noe  ssuficientemente complejo como para caturar la estructura subyacente de los datos. Es decir, el modelo es demasiado simple para capturar la complejidad de los datos y no puede hacer predicciones precisas. //FIXME: Redaccion chatgpt


// Para poder evitar el sobreajuste y subajuste se utilizan tecnicas de regularización, las cuales tienen como objetivo reducir la complejidad del modelo y evitar el sobreajuste y lograr generalizar lsoo modelos de Deep Learnign.
// Existen diferentes tecnicas para lograr esto algunas de estas son:

// - *Dropout*: Es una tecnica que desactiva un número de neuronas de forma aleatoria.Para aplicar este método se asigna una probabilidad a cada neurona de ser desactivada en la fase de entrenamiento. Esto quiere decir que las conexiones que tenía esa neurona desaparecerán momentáneamente.


// #figure(
//   image("../imagenes/dropout.png", width: 60%),
//   caption: [Dropout.],
// ) <Dropout>

// Para el caso de GNN 
// En training:De forma aleatoria se seleccionan neuronas a 0 (drop out) con una probabilidad de p e una capa especifica.
// En Tesing: Se usan todas las neurionas.
// PAPER: @DropGNN


// - *Early Stoping*: Consiste en detener el entrenamiento antes de que el rendimiento del modelo empiece a empeorar para un conjunto de validación, evitacnd oasi un overfitting sobre lso datos.

// - *L1 y L2 Regularization*: Tecnicas paa comtrolar la complejidad de los modelos.estos incluyen un término de penalización rn la funcion de costo, penaliza lso modelos con valores de coeficientes altos (y por ende complejos), e sto porque modelos  menos complejos son menos propensos a el sobreajuste , mejorando asi la generalización de este. En caso de L1 la penalización esta dada por valor absoluto de los coeficientes y en L2 por el cuadrado de estos, haciendo que para el primer caso elimine caracteistcias y el segundo haga una reduccion más suave de la complejidad, conisdernado aun asi todas las caracteristicas.

// // - *Data Augmentation*: blablabla// TODO: Existe para GNN??

// // - *Batch Normalization*: blablabla// TODO: Completar

// === Evaluación

// La evaluacióne es el proceso de usar diferentes métricas de evaluación para comprender el rendimiento de un modelo de aprendizaje automático, así como sus fortalezas y debilidades.
// Este es necesario paa poder asegurar que un modelo sea confiable, generalizable y capaz de realizar predicciones correctas sobre nuevos datos no vistos.

// ==== Metricas de evaluación
// Existen diferentes metricas para poder evaluar un modelo de MAchine Learning ebn base a la tarea que ester ealizará, algunas de estas son:

// - Metricas de Clasificación: Accuracy, Precision, Recall,F1-score, ROC, AUC, etc.

// - MEtricas de Regresión: MSE, MAE, R2, etc.

// - Metricas de Ranking: MRR, DCG, NDCG, etc.
  
// - Metricas de Estadistica: Correlación
// entre otras...

// Partiendo con las metricas de clasificación, primero tenemos que entender qué es la *Matriz d eConfusión*.
// Es una tabla que se usa para describir el rendimiento de un modelo de clasificación en el conjunto de testing d elos datos.
// Definiendo dentro de esta los conceptos de True Positive, True Negative, False Positive y False Negative.
// #figure(
//   image("../imagenes/Confusion-matrix.png", width: 40%),
//   caption: [Matriz de confusión.],
// ) <confusionMatrix>

// #h(0.5cm)
// - True Positive (TP): // TODO: Completar

// - True Negative (TN): // TODO: Completar

// - False Positive (FP): // TODO: Completar

// - False Negative (FN): // TODO: Completar

// Asi la definición de Accuracy, Precision, Recall, F1-Score y ROC para una tarea de clasificación esta dada por:

// - *Accuracy*: Corresponde a la proporcion de predicciones relaizadas correctamente en comparación al numero total de predicciones realizadas. Es decir, de todas las predicciones positivas realizadas, cuantas de estas son realmente positivas.

// $
// "Accuracy" = "Correct Predictions" / "Total Predictions"
// $
// Usando la matriz de confusión:
// $
// "Accuracy" = ("TP" + "TN")/("TP"+"TN"+"FP"+"FN")
// $

// - *Precision*: Evalua la exactitud de predicciones positivas realizadas por un modelo. Es la proporción de verdaderos positivos  en proporcion a las predicciones positivas realizadas por la Red. Una alta presicion indica que , cuando el modelo predice un resultado positivo, es probable que sea correcto.

// - *Recall o True Positive Rate*: También conocido como Sensibilidad, mide la cpacidad del modelo para identificar todos los ejemplo positivo . Esta dado por la proporcion de verdaderos positivos sobre el total de ejemplo s reales positivos. Un alto recall indica que el modelo es bueno identificando la clase positiva, es decir tiene pocas omisiones de positivos.

// $
// "True Positive Rate" = "TP" / ("TP" + "FN")
// $
// $
// "False Positive Rate" = "FP" / ("FP" + "TN")
// $

// - ROC :Receiver operating characteristic. Es una representación gráfica que nos muestra en rendimiento de un modelo de clasificación en base a un umbral de desición. Este ayuda a visulaizar el trade-off entre la tasa de verdaderos positivos y la tasa de falsos positivos en diferentes puntos.

// - AUC: Area Under the Curve, es un valor que representa el area bajo la curva ROC. Mientras más cercano a 1, mejor es el modelo.
// #figure(
//   image("../imagenes/noimage.jpg", width: 40%),
//   caption: [ROC Curve.],
// ) <ROC-Graph>


// $
// "False Positive Rate" = frac("FP", "FP" + "TN")
// $

// - *F1-Score*: Esta metrica mezcla la presicion y el recall en un solo valor. De esta forma evalua el rendemineto del modelo. Esecialmente util en cpontextos de desbalance de clses 

// $
// "F1 score" = 2 * frac("Precision" * "Recall", "Precision" + "Recall")
// $

// En cuanto a metricas par ala Regresión, tenemos:
// - *Mean Squared Error (MSE)*: Es el promedio de los cuadrados de las diferencias entre los valores predichos y los valores reales. Es decir, mide la media de los errores al cuadrado. //FIXME: Arreglar sacada de chatgpt 
// Su formula está dada por:
// $
// "MSE" = frac(1,n) sum_(i=1)^(n) (y_i - hat(y)_i)^2
// $
// - *Mean Absolute Error (MAE)*: Es el promedio de las diferencias absolutas entre los valores predichos y los valores reales. Es decir, mide la media de los errores absolutos.//FIXME: Arreglar sacada de chatgpt 
// Su formula está dada por:
// $
// "MSE" = frac(1,n) sum_(i=1)^(n) |y_i - hat(y)_i|
// $
// - *R2 Score*: Es una medida de cuánto se ajustan los valores predichos a los valores reales. Es decir, mide la proporción de la varianza en la variable dependiente que es predecible a partir de la variable independiente.//FIXME: Arreglar sacada de chatgpt 
// Su formula está dada por:
// $
// R^2 = 1 - frac(sum_(i=1)^(n) (y_i - hat(y)_i)^2,sum_(i=1)^(n) (y_i - bar(y))^2)
// $
// Para GNN:

// // https://arxiv.org/pdf/2207.12599

// // Explanatory Evaluation: Quantitative analyses:

// // - Accuracy Evaluation Accuracy evaluation refers to the process of assessing
// // the correctness and fidelity of the explanations generated by an algorithm or
// // model. Accurate explanations are essential for building trust in the machine
// // learning model’s decision-making process and for ensuring fairness and trans-
// // parency. Therefore, accuracy evaluation is a crucial step in developing and eval-
// // uating graph explanation algorithms.
// // Accuracy (ACC). ACC is the proportion of explanations that are ”correct”.
// // There are two definitions to measure the accuracy of explainable methods

// // $
// // "Accuracy" = frac(1,N) sum_(i=1)^N frac(|s_(i)|, |S_(i)|_(gt))
// // $
// // //FIXME: Nos e si la estoy haciendo bien  https://arxiv.org/pdf/2207.12599
