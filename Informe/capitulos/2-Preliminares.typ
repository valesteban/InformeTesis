= Preliminares

#h(0.5cm)En este capítulo se presentan conceptos fundamentales para esta tesis.
Se comienza con una descripción del funcionamiento de Internet, su estructura y componentes fundamentales. Luego, se explica el protocolo de enrutamiento BGP, a través del cual se obtuvo la información de ruteo para construir el grafo.
Finalmente, una explicación del funcionamiento de las Redes Neuronales de Grafos (GNN).

== Internet

#h(0.5cm)El Internet es una red global de redes que interconecta miles de dispositivos en todo el mundo que proporcionan servicios a aplicaciones distribuidas @Computer-Networking. Entre estos dispositivos se encuentran computadoras, teléfonos celulares, servidores de contenido y muchos otros.

Cuando un dispositivo final intenta establecer una conexión a través de Internet, los datos a enviar son encapsulados en paquetes con cabeceras que contienen la información necesaria para llegar al dispositivo final.
En algunos casos los datos pueden ser divididos en diferentes paquetes y ser enviados por distintas rutas hasta llegar al dispositivo final, donde son reensamblados. 
El recorrido que sigue un paquete desde su origen hasta su destino a través de distintos routers se conoce como ruta. 

Los sistemas finales acceden a Internet por medio de proveedores de Internet (ISPs), los cuales, a su vez, son redes conformadas por routers y enlaces de comunicación. 
Estos ISPs de nivel inferior se conectan a ISPs de nivel superior,nacionales e internacionales como Level 3, Cogent, entre otros @ASRank-web, que se encuentran en la cima de la jerarquía de Internet, al tener conexiones directas con el _backbone_ de Internet.
Así, estos proporcionan a los usuarios finales el acceso a proveedores de contenido (CDN, por sus siglas en inglés), sitios web y otros servicios, los cuales también están conectados a la infraestructura de Internet.

// Para el correcto funcionamiento de Internet existen diferentes protocolos, sin embargo, los dos más importantes corresponden al Protocolo de Control de Transmisión (TCP) y el Protocolo de Internet (IP),conocidos colectivamente como TCP/IP. El desarrollo de estos estandares los lleva acabo el Internet Engineering Task Force (IETF) @IETF, y los documentos se conocen como Requests for Comments (RFCs).



//TODO: Poner algo: "Segun XX 2n 2025 hay alredeor de x mil millones de dispositivos conectados a Internet y se proyecta que para 2030 ...."




// #figure(
//   image("../imagenes/InfrestructuraInternet.png.jpg", width: 40%),
//   caption: [TODO:],
// ) 


// #figure(
//   image("../imagenes/InternetLY.png", width: 40%),
//   caption: [TODO:],
// ) <Internet>



// #figure(
//   image("../imagenes/Internet2.png", width: 40%),
//   caption: [TODO:],
// ) <Internet2>


// #figure(
//   image("../imagenes/Estructura-Internet-ISP.png", width: 40%),
//   caption: [TODO:],
// ) <Red-de-Redes>


// #figure(
//   image("../imagenes/network-of-networks.svg", width: 40%),
//   caption: [TODO:],
// ) <Red-de-Redes>


=== Sistemas Autonomos 


#h(0.5cm)En la estructura de Internet, un Sistema Autónomo (AS) consiste en un conjunto de routers y enlaces de comunicación que comparten una política de enrutamiento común. Estos son operados independientemente por una organizaciones, como un ISPs, universidadades, empresas, entre otras.

Los AS utilizan el protocolo BGP para intercambiar información de enrutamiento y así lograr una conexión global entre ASes y, por ende, en Internet. Las conexiones entre los Ases pueden ser de tipo cliente-proveedor o peer-to-peer, pero están influenciadas por acuerdos comerciales. Bajo estos acuerdos, podemos crear un grafo de la infraestructura de Internet, donde los nodos son los ASes y las aristas son las conexiones entre ellos. Cabe destacar que, en este caso, una conexión no implica necesariamente el intercambio de tráfico entre los ASes conectados, ya que el enrutamiento está controlado por BGP, un protocolo de enrutamiento basado en políticas @InferringASRelatioships2001.

Ma sinformacion sobre lso Sistmeas Autonomos pueden ser encontrados en el anexo [TODO:], otros conceotop importantes sobre la estructura de Internet son los _Internet Exchange Points_ (IXPs), estos corresponden a puntos de interconecion donde multiples ASes se conectan y establecen conexion con otros ASes sin estar directamente conectados.



// // #figure(
// //   image("../imagenes/internet-exchange-point.jpg", width: 40%),
// //   caption: [TODO:],
// // ) <IXP>



// // #figure(
// //   image("../imagenes/ISP1.png", width: 40%),
// //   caption: [TODO:],
// // ) <IXP1>


// // #figure(
// //   image("../imagenes/ISP2.png", width: 40%),
// //   caption: [TODO:],
// // ) <IXP2>


// // #figure(
// //   image("../imagenes/ISP3.png", width: 40%),
// //   caption: [TODO:],
// // ) <IXP3>



// // #figure(
// //   image("../imagenes/topologiaBGP.png", width: 40%),
// //   caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
// // ) <BGP-SA>




=== Ruteo 


#h(0.5cm)Antes de introducir el protocolo BGP, debemos entender brevemente el ruteo.

El ruteo es el proceso mediante el cual se selecciona el mejor camino que seguirá un paquete dentro de una red para llegar a su destino final. El camino que sigue un paquete se elige según la información de las tablas de enrutamiento (RIBs) de los routers y la información contenida en los encabezados de los paquetes, donde se indica el destino final.

Cuando un paquete llega a un router, se consulta en la tabla de enrutamiento la dirección final para obtener el próximo router o punto de red al cual se debe dirigir el paquete.

Por ejemplo, cuando un usuario accede a una página web desde su hogar, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final, consulta su tabla de enrutamiento y lo reenvía al siguiente punto de la red. Este nuevo router intermedio repite el proceso hasta que el paquete alcanza su destino final.

Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración.
Por otro lado, en el enrutamiento dinámico, los routers se encargan de actualizar las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.



// // #figure(
// //   image("../imagenes/RoutingEI.png", width: 50%),
// //   caption: [TODO:],
// // ) <Ruteo-Externo-Interno>










// // #figure(
// //   image("../imagenes/Graph-rutas.png", width: 40%),
// //   caption: [TODO:],
// // ) <Graph>

// // De esta forma podemos representar 
// // graph:$ G = (N,E)$

// // N = set of routers = { u, v, w, x, y, z }

// // E = set of links ={ (u,v), (u,x), (v,x), (v,w), (x,w), (x,y), (w,y), (w,z), (y,z) }

== Border Gateway protocol (BGP)


#h(0.5cm)Como se mencion[o existen dos tipos de ruteo  estático y dinámico, BGP @RFC-BGP pertenece al tipo dinamico, donde se encarga de analizar todas las posibles rutas a los diferentes destinos y seleccionar la mejor ruta. Luego, comparte esta información con sus routers vecinos, quienes a su vez repiten el proceso. Así, cada Sistema Autónomo genera caminos hacia los distintos prefijos de Internet y cuando ocurren cambios en la red, BGP se encarga de actualizar las rutas  mediante el intercambio de mensajes BGP.



=== Funcionaqmiento de BGP

#h(0.5cm)Una vez que la conexión TCP se ha establecido entre los pares BGP, estos intercambian mensajes _OPEN_ para confirmar los parámetros de la sesión. Luego, envían un mensajes _KEEPALIVE_ para confirmar la conexión.

La información que se intercambia en primera instancia consiste en una porción de la tabla de información de BGP, llamada _Adj-RIB-Out_, la cual está filtrada de acuerdo a las políticas locales de exportación hacia los diferentes AS. a medida que esta tabla va cambiando, se envian actualizaciones incrementales mediando mensajes _UPDATE_. 
Además, para asegurar la conexión sigue activa, los pares BGP intercambian cada cierto tiempo mensajes _KEEPALIVE_.

En caso de que se detecte algún tipo de error durante la conexión, se envía un mensaje _NOTIFICATION_ el cual indica el tipo de error. Tras su envío la conexión BGP se cierra y todas las rutas aprendidas en la sesión son eliminadas.

La figura @FuncionamientoBGP muestra cómo BGP propaga la información de ruteo entre distintos AS. Cada sistema autónomo anuncia la dirección de destino a sus pares, en este caso especifico el AS 64503 anuncia su dirección a sus pares 64502 y 64504, quienes a su vez anuncian la dirección a sus pares, modificando el _AS_PATH_ a medida que la información se propaga. Finalmente, el AS 64501 recibe estos anuncios y, basándose en la información acumulada, determina la mejor ruta para alcanzar la red del AS 64503.

#figure(
  image("../imagenes/BGPFuncionamiento.png", width: 50%),
  caption: [Ejemplo de propagación de anuncion. En este caso AS 6453 comienza anunciando su dirección a sus pares.],
) <FuncionamientoBGP>


=== BGP Routing Information Base (RIB)

#h(0.5cm)Un concepto importante son las tablas RIBs a partir de las cuales se extrajo la informacion para construir el grafo de Internet y las arista que conectan a los ASes.

Cuando se utiliza BGP, los routers BGP reciben mensajes _UPDATE_ de sus vecinos, los cuales son analizados y filtrados según las políticas locales de ruteo del AS, para luego anunciar las rutas seleccionadas a sus vecinos. Para esto, BGP utiliza una base de datos denominada Routing Information Base (RIB), que se compone de tres partes:

- *Adj-RIB-In:* Almacena la información de ruteo de los mensajes UPDATE recibidos de los vecinos BGP. 

- *Loc-RIB:* Contiene la información de ruteo local, es decir, las mejores rutas seleccionadas para cada dirección.

- *Adj-RIB-Out:* Guarda la información seleccionada por el router para ser anunciada a sus pares. Consiste en la información de Loc-RIBs luego de ser aplicadas las políticas internas de ruteo. Esta es la información que se incluye en los mensajes UPDATE.

El flujo de información en BGP y el proceso de toma de decisiones de rutas se realiza de la siguiente manera:
primero, se reciben los mensajes UPDATE de los vecinos, los cuales se almacenan en la Adj-RIB-In, una entrada por cada vecino. Luego, se evalúa el grado de preferencia de cada ruta almacenada en la Adj-RIB-In. En base en esta evaluación, se seleccionan las mejores rutas para cada destino y se instalan en la Loc-RIB. Finalmente, la información contenida en la Loc-RIB se transfiere a la Adj-RIB-Out para ser anunciada a los vecinos BGP, siguiendo las políticas de ruteo locales. Este flujo de información se conoce como el proceso de decisión BGP.

Es importante destacar que las bases de datos que almacenan la información de rutas BGP no son lo mismo que la tabla de ruteo de un router, que es la que el router utiliza para realizar el forwarding de los paquetes. Las rutas almacenadas en la RIB deben cumplir con ciertos criterios, definidos por el software o el proveedor del router, para ser agregadas a la tabla de ruteo.



// // EXTRAS

// // The main problem of BGP is the lack of validity and
// // verification mechanisms that render it vulnerable to attacks
// // such as BGP hijacking or black-holin[C. Zheng, L. Ji, D. Pei, J. Wang, and P. Francis, "A light-weight
// // distributed scheme for detecting ip prefix hijacks in real-time", ACM
// // SIGCOMM Computer Communication Review, vol. 37, no. 4, p. 277,
// // 2007]




// // == EXTRAS 
// // // TODO: Agregar en alguna parte
// // - Export policies:
// //   - PErmitir/denegar una ruta
// //   - Asignar multiples exit discriminator
// //   - Agregar community values
// //   - Prepending

== Graph Neuronla Network (GNN)

#h(0.5cm)Las GNN son una arquitectura de Redes Neuronales especialmente diseñada para realizar predicciones basadas en datos representativos de grafos. A diferencia de las Redes Neuronales convencionales, las GNNs reciben datos en forma de tensores que pueden representar nodos, atributos de nodos, aristas y atributos de aristas.

// Existen diferenets enfoques, dependiendo de la tarea de aprendizaje que se quiere llevar a cabo, estos son:

// - Nivel de nodo: Incluye tareas como clasificación, regresión y clustering de nodos. Se realizan inferencias a partir de las conexiones con otros nodos. 


// - Nivel de  aristas: Se abordan tareas de clasificación y predicción de aristas. Por ejemplo, determinar la existencia de una relación entre dos nodos.

// - Nivel de grafo: Se encuentran tareas de clasificación, regresión y matching de grafos para las cuales el modelo debe ser capaz de aprender una representación para el grafo completo.


Las GNN tienen una serie de ventajas sobre las Redes Neuronales convencionales cuando se trabaja con datos de grafos. En contraste con los modelos tradicionales, las GNN aprovechan las relaciones entre las entidades que conforman los datos de entrada a el modelo. Estas relaciones pueden incluir aspectos como orden, jerarquía, dependencias o relaciones de otro tipo que son comunes en grafos y se representan a través de las aristas que conectan los nodos.

En cuanto a la adaptabilidad a variaciones en el tamaño de entrada, las Redes Neuronales convencionales requieren que los datos de entrada mantengan un mismo tamaño. Para ello, recurren a técnicas como padding o broadcast, los cuales no tienen efectos significativos en el desempeño de los modelos. Las GNNs, por su parte, ofrecen flexibilidad para adaptarse a distintos tamaños de entrada@GCN.

Otro motivo para optar por GNNs es su capacidad para manejar el isomorfismo de los grafos, es decir dos grafos pueden lucir diferentes, pero ser estructuralmente iguales. Un modelo tradicional trataría ambos grafos como si fuesen datos diferentes, sin embargo, no lo son. Esto es comparable a lo que sucedería si se le presenta como entrada dos imágenes donde una se encuentra invertida. Es por esta razón que no se puede trabajar directamente con una matriz de adyacencia en una Red Feed Forward, ya que es sensible a estos cambios. Las GNNs utilizan técnicas que son invariantes ante permutaciones, lo que permite trabajar con el isomorfismo en grafos.

Finalmente, el último desafío radica en que la estructura de un grafo no puede ser reducida a un espacio euclidiano, y su conceptualización no puede limitarse a una distancia euclidiana@EuclideanGNN. A diferencia de Redes Neuronales que trabajan, por ejemplo, con imágenes, las cuales pueden ser interpretadas como un grafo, la representación de la información se puede entender en términos de píxeles en un espacio bidimensional. 
