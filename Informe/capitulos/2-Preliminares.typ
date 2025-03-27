= Preliminares

== Internet

El Internet es una red global de redes que interconecta miles de millones de dispositivos en todo el mundo que proporcionan servicios a aplicaciones distribuidas @Computer-Networking. Entre estos dispositivos se encuentran computadoras, teléfonos celulares, servidores de contenido y muchos otros.

Cuando un dispositivo final intenta establecer una conexión a través de Internet, los datos a enviar son encapsulados en paquetes con cabeceras que contienen la información necesaria para llegar al dispositivo final.
En algunos casos los datos pueden ser divididos en diferentes paquetes y ser enviados por distintas rutas hasta llegar al dispositivo final, donde son reensamblados. 
El recorrido que sigue un paquete desde su origen hasta su destino a través de distintos routers se conoce como ruta. 

Los sistemas finales acceden a Internet por medio de proveedores de Internet (ISPs), los cuales, a su vez, son redes conformadas por routers y enlaces de comunicación. 
Estos ISPs de nivel inferior se conectan a ISPs de nivel superior,nacionales e internacionales como Level 3, Cogent, entre otros @ASRank-web, que se encuentran en la cima de la jerarquía de Internet, al tener conexiones directas con el _backbone_ de Internet.
Así, estos proporcionan a los usuarios finales el acceso a proveedores de contenido (CDN, por sus siglas en inglés), sitios web y otros servicios, los cuales también están conectados a la infraestructura de Internet.

Para el correcto funcionamiento de Internet existen diferentes protocolos, sin embargo, los dos más importantes corresponden al Protocolo de Control de Transmisión (TCP) y el Protocolo de Internet (IP),conocidos colectivamente como TCP/IP. El desarrollo de estos estandares los lleva acabo el Internet Engineering Task Force (IETF) @IETF, y los documentos se conocen como Requests for Comments (RFCs).



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

En la estructura de Internet, un Sistema Autónomo (AS) consiste en un conjunto de routers y enlaces de comunicación que comparten una política de enrutamiento común. Estos son operados de forma independiente por una organización, como un ISP, una universidad, una empresa, entre otras.

Los AS utilizan el protocolo BGP para intercambiar información de enrutamiento y así lograr una conexión global entre ASes y, por ende, en Internet. Las conexiones entre los Ases pueden ser de tipo cliente-proveedor o peer-to-peer, pero están influenciadas por acuerdos comerciales. Bajo estos acuerdos, podemos crear un grafo de la infraestructura de Internet, donde los nodos son los ASes y las aristas son las conexiones entre ellos. Cabe destacar que, en este caso, una conexión no implica necesariamente el intercambio de tráfico entre los ASes conectados, ya que el enrutamiento está controlado por BGP, un protocolo de enrutamiento basado en políticas@InferringASRelatioships2001.
// reachability

Los AS se identifican con un número de Sistema Autónomo (ASN) de 16 bits y controlan un conjunto de direcciones IP. 
Esta asignación es llevada a cabo por los Registros Regionales de Internet (_Regional Internet Registry_, RIRs), quienes reciben bloques de IPs por la _Internet Assigned Numbers Authority_ (IANA) y los distribuyen a los Registros Locales de Internet (_Local Internet Registries_, LIR) y a los usuarios finales.

Los ISP, quienes pueden estar conformados por uno o varios Sistemas Autónomos, se dividen comúnmente en tres niveles de jerarquía. El _Tier-1_, donde se encuentran los AS que conforman el _backbone_ de Internet, estos intercambian paquetes entre sí sin un costo asociado. Los _Tier-2_ son generalmente operadores nacionales que compran tránsito a los _Tier-1_ y venden tránsito a los _Tier-3_. Finalmente los _Tier-3_ son los operadores locales que pagan por el tránsito para proporcionar acceso a Internet a los usuarios finales @InterconnectionPeeringSettlements. También, Luckie et al. @ASRank analizó los AS y propuso una métrica para indicar qué tan global es un AS, donde si el customer cone es mayor o igual a 200, se considera _Tier-1_; si es mayor a 2,000, se considera _Tier-2_; y si es menor a 200, se considera _Tier-3_.

Una última separación que se puede hacer entre AS es según sus conexiones a otros Sistemas Autónomos,  clasificándolos en _single-homed_ y _multi-homed_. Los AS _single-homed_ tienen solo una conexión a otro AS, mientras que los _multi-homed_ tiene conexiones a más de un AS.

=== Internet Exchange Points

Los _Internet Exchange Points_ (IXPs) son puntos de interconexión donde múltiples ASes pueden establecer relaciones de peering @Computer-Networking.

Un IXP consiste generalmente en un switch de alta velocidad y capacidad que conecta routers de diferentes ASes, permitiendo el intercambio directo de tráfico sin necesidad de atravesar redes intermedias. Mejorando así el intercambio de tráfico, haciéndolo más eficiente y de bajo costo.

Las relaciones de tráfico en un IXP se establecen mediante el protocolo BGP. Por ende, a pesar que los ASes estén físicamente conectados a través del IXP, no se establece una relación a no ser que se configure explícitamente.

Al igual que los ASes, los IXPs tienen un ASN. Sin embargo, de forma generalizada, este ASN se extrae de los AS PATH en BGP. Algunos IXPs lo mantienen visible como método de debugging @InferringASRelatioships2001. 


// #figure(
//   image("../imagenes/internet-exchange-point.jpg", width: 40%),
//   caption: [TODO:],
// ) <IXP>



// #figure(
//   image("../imagenes/ISP1.png", width: 40%),
//   caption: [TODO:],
// ) <IXP1>


// #figure(
//   image("../imagenes/ISP2.png", width: 40%),
//   caption: [TODO:],
// ) <IXP2>


// #figure(
//   image("../imagenes/ISP3.png", width: 40%),
//   caption: [TODO:],
// ) <IXP3>



// #figure(
//   image("../imagenes/topologiaBGP.png", width: 40%),
//   caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
// ) <BGP-SA>




=== Ruteo 

El ruteo es el proceso mediante el cual se selecciona el camino que seguirá un paquete dentro de una red para llegar a su destino mediante la mejor ruta. La comunicación entre dos dispositivos de la red puede establecerse mediante diferentes rutas, lo que permite conectar dispositivos de red sin una conexión directa a través de dispositivos intermedios.

Un enrutador o router es un dispositivo de red encargado de seleccionar las rutas que seguirán los datos enviados a través de la red.
El camino que sigue un paquete se elige según la información de las tablas de enrutamiento (RIBs) de los routers y la información contenida en los encabezados de los paquetes, donde se indica el destino final.
Cuando un paquete llega a un router, se consulta en la tabla de enrutamiento la dirección final para obtener el próximo router o punto de red al cual se debe dirigir el paquete.

Por ejemplo, cuando un usuario accede a una página web desde su hogar, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final, consulta su tabla de enrutamiento y lo reenvía al siguiente punto de la red. Este nuevo router intermedio repite el proceso hasta que el paquete alcanza su destino final.

Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración.
Por otro lado, en el enrutamiento dinámico, los routers se encargan de actualizar las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.

También se pueden clasificar los protocolos de enrutamiento en dos categorías: ruteo interno y ruteo externo.
El ruteo Interno se encarga de gestionar las rutas que seguirá un paquete dentro de un Sistema Autónomo. Algunos de los protocolos internos son:

- *OSPF (Open Shortest Path First):* Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos @RFC-OSPF.
- *RIP (Routing Information Protocol):* Utiliza un enfoque de vector de distancia para calcular la ruta más óptima, basándose en la cantidad de saltos @RFC-RIP.

El ruteo externo se centra en la gestión de rutas entre los Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo. Algunos protocolos de enrutamiento externos son:

- *BGP (Border Gateway Protocol):* Tiene un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente @RFC-BGP.
- *IS-IS (Intermediate System to Intermediate System):* Protocolo de enrutamiento de estado de enlace, similar a OSPF @IS-IS.




// #figure(
//   image("../imagenes/RoutingEI.png", width: 50%),
//   caption: [TODO:],
// ) <Ruteo-Externo-Interno>










// #figure(
//   image("../imagenes/Graph-rutas.png", width: 40%),
//   caption: [TODO:],
// ) <Graph>

// De esta forma podemos representar 
// graph:$ G = (N,E)$

// N = set of routers = { u, v, w, x, y, z }

// E = set of links ={ (u,v), (u,x), (v,x), (v,w), (x,w), (x,y), (w,y), (w,z), (y,z) }

== Border Gateway protocol (BGP)

Como se mencionó en la sección anterior, BGP @RFC-BGP es un protocolo de enrutamiento utilizado para intercambiar información de rutas entre Sistemas Autónomos en Internet. El cual utiliza TCP @RFC793-TCP como su protocolo de transporte, lo que significa que no necesita preocuparse por la fragmentación de paquetes, la confirmación de recepción (ACK), la retransmisión de datos, entre otros aspectos de confiabilidad.

Como sabemos el Internet está formado por miles de redes privadas, públicas, corporativas y gubernamentales que están interconectadas mediante protocolos estandarizados entre sí. BGP se encarga de analizar todas las posibles rutas a los diferentes destinos y seleccionar la mejor ruta. 

A medida que un paquete viaja por las diferentes redes de Internet, cada Sistema Autónomo decide el siguiente salto por el cual se enviara el mensaje. Esta decisión se toma en base a la información de ruteo recolectada por el intercambio de mensaje BGP.

Por ejemplo, cuando un usuario en Chile carga una página web con servidores en Argentina, BGP permite que la comunicación se establezca ya que asegura que los paquetes sigan la mejor ruta disponible a través de múltiples redes interconectadas.

=== Funcionaqmiento de BGP

Una vez que la conexión TCP se ha establecido entre los pares BGP, estos intercambian mensajes _OPEN_ para confirmar los parámetros de la sesión. Luego, envían un mensajes _KEEPALIVE_ para confirmar la conexión.

La información que se intercambia en primera instancia consiste en una porción de la tabla de información de BGP, llamada _Adj-RIB-Out_, la cual está filtrada de acuerdo a las políticas locales de exportación hacia los diferentes AS. a medida que esta tabla va cambiando, se envian actualizaciones incrementales mediando mensajes _UPDATE_. 
Además, para asegurar la conexión sigue activa, los pares BGP intercambian cada cierto tiempo mensajes _KEEPALIVE_.

En caso de que se detecte algún tipo de error durante la conexión, se envía un mensaje _NOTIFICATION_ el cual indica el tipo de error. Tras su envío la conexión BGP se cierra y todas las rutas aprendidas en la sesión son eliminadas.

Los mensajes BGP solo son procesados una vez que han sido completamente recibidos. Su tamaño mínimo es de 19 octetos, correspondiente al _HEADER_, mientras que el tamaño máximo es de 4096 octetos. Existen 4 tipos de mensajes en BGP: _OPEN_, _UPDATE_, _KEEPALIVE_ y _NOTIFICATION_.

A continuación la figura @FuncionamientoBGP muestra un ejemplo de como BGP propaga la información de ruteo a través de los diferentes AS. quienes repiten el proceso de anunciar la dirección de destino a sus pares modificando la información de AS AS_PATH y asi sucesivamente hasta qie la información llega al AS 64501, el cual gracias a la informacion acumula podra sabra como llegar a la red del AS 64503 y podrá eleir entre los dos posibles rutas que tiene almacenda dentro de sus rutas .



La figura @FuncionamientoBGP muestra cómo BGP propaga la información de ruteo entre distintos AS. Cada sistema autónomo anuncia la dirección de destino a sus pares, en este caso especifico el AS 64503 anuncia su dirección a sus pares 64502 y 64504, quienes a su vez anuncian la dirección a sus pares, modificando el _AS_PATH_ a medida que la información se propaga. Finalmente, el AS 64501 recibe estos anuncios y, basándose en la información acumulada, determina la mejor ruta para alcanzar la red del AS 64503.

#figure(
  image("../imagenes/BGPFuncionamiento.png", width: 50%),
  caption: [Ejemplo de propagación de anuncion. En este caso AS 6453 comienza anunciando su dirección a sus pares.],
) <FuncionamientoBGP>








*Mensaje OPEN*

Luego de establecida la conexión TCP entre los pares BGP, el primer mensaje que se envía en un mensaje _OPEN_ ,mediante el cual ambos lados confirman los parámetros de la conexión.

En este mensaje se especifica la versión de BGP a utilizar, el número de Sistema Autónomo (AS) del emisor, el Hold Time, el BGP identifier y los parámetros opcionales.

El Hold Time define el tiempo máximo que puede pasar sin recibir un mensaje _KEEPALIVE_ o _UPDATE_ en una sesión antes de que la conexión sea cerrada.


*Mensaje UPDATE*

Se utiliza para transferir información de enrutamiento entre los pares BGP. A través de este mensaje se anuncian nuevas rutas y se notifican los withdrawals de aquellas que ya no son válidas.

Además, estos mensajes incluyen path attributes, los cuales proporcionan información sobre las rutas que se están anunciando para que luego cada AS pueda decidir la mejor ruta a los diferentes destinos. Algunos ejemplos de estos atributos son ORIGIN, _AS_PATH_, _NEXT_HOP_, _MULTI_EXIT_DISC_, _LOCAL_PREF_, _ATOMIC_AGGREGATE_ y _AGGREGATOR_.


*Mensaje KEEPALIVE*

El intercambio de mensajes _KEEPALIVE_ dentro del protocolo BGP se utiliza para confirmar que la conexión entre ambos pares sigue activa, evitando que el Hold Time expire.

Este mensaje consta únicamente del _HEADER_ de un mensaje BGP, donde se indica que corresponde a un _KEEPALIVE_ por medio del campo _type_, cuyo valor es 2, el cual corresponde al valor 2. Dicho mensaje tiene un tamaño de 19 octetos.

*Mensaje NOTIFICATION*

El mensaje _NOTIFICATION_ se envía cuando se detecta un error en la comunicación BGP. Una vez enviado, la conexión se cierra.

Este mensaje incluye un código de error y un subcódigo de error, los cuales indican en qué tipo de mensaje se produjo el error y la zona específica del problema. Además, contiene un campo de datos que proporciona información adicional sobre el error detectado.


=== BGP Routing Information Base (RIB)

Cuando se utiliza BGP, los routers BGP reciben mensajes _UPDATE_ de sus vecinos, los cuales son analizados y filtrados según las políticas locales de ruteo del AS, para luego anunciar las rutas seleccionadas a sus vecinos. Para esto, BGP utiliza una base de datos denominada Routing Information Base (RIB), que se compone de tres partes:

- *Adj-RIB-In:* Almacena la información de ruteo de los mensajes UPDATE recibidos de los vecinos BGP. 

- *Loc-RIB:* Contiene la información de ruteo local, es decir, las mejores rutas seleccionadas para cada dirección.

- *Adj-RIB-Out:* Guarda la información seleccionada por el router para ser anunciada a sus pares. Consiste en la información de Loc-RIBs luego de ser aplicadas las políticas internas de ruteo. Esta es la información que se incluye en los mensajes UPDATE.

El flujo de información en BGP y el proceso de toma de decisiones de rutas se realiza de la siguiente manera:
primero, se reciben los mensajes UPDATE de los vecinos, los cuales se almacenan en la Adj-RIB-In, una entrada por cada vecino. Luego, se evalúa el grado de preferencia de cada ruta almacenada en la Adj-RIB-In. En base en esta evaluación, se seleccionan las mejores rutas para cada destino y se instalan en la Loc-RIB. Finalmente, la información contenida en la Loc-RIB se transfiere a la Adj-RIB-Out para ser anunciada a los vecinos BGP, siguiendo las políticas de ruteo locales. Este flujo de información se conoce como el proceso de decisión BGP.

Es importante destacar que las bases de datos que almacenan la información de rutas BGP no son lo mismo que la tabla de ruteo de un router, que es la que el router utiliza para realizar el forwarding de los paquetes. Las rutas almacenadas en la RIB deben cumplir con ciertos criterios, definidos por el software o el proveedor del router, para ser agregadas a la tabla de ruteo.



// EXTRAS

// The main problem of BGP is the lack of validity and
// verification mechanisms that render it vulnerable to attacks
// such as BGP hijacking or black-holin[C. Zheng, L. Ji, D. Pei, J. Wang, and P. Francis, "A light-weight
// distributed scheme for detecting ip prefix hijacks in real-time", ACM
// SIGCOMM Computer Communication Review, vol. 37, no. 4, p. 277,
// 2007]




// == EXTRAS 
// // TODO: Agregar en alguna parte
// - Export policies:
//   - PErmitir/denegar una ruta
//   - Asignar multiples exit discriminator
//   - Agregar community values
//   - Prepending

== Graph Neuronla Network (GNN)

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

=== Message Passing Neural Networks (MPNN)
    
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

=== Graph Convolution Network (GCN)



#h(0.5cm)Es un tipo específico de MPNN, donde se utilizan convoluciones de grafos para agregar información de los nodos adyacente de un nodo en un grafo. 

La operación de convolución en el grafo produce la suma normalizada de las características de los nodos vecinos@GCN-formula. Esta normalización garantiza que la información agregada sea ponderada correctamente, es decir, evitar que un nodo con gran cantidad de vecinos tenga una representación desproporcionada y que luego tenga una influencia mayor en la representación otros nodos en las siguientes capas.

La notación de los embeddings de los nodos está dado por: 

$
H^((l+1)) = sigma(tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) H^((l)) W^((l)))
$
#h(0.5cm)Donde  $sigma$ se define como la función de activación, $H^((l))$ la matriz de caracteristicas de los nodos en la capa $l$, $W^((l))$ la matriz de aprendizaje de pesos, con dimensionalidades dada por el tamaños de atributos entrantes y de salida por capa y $tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) $ la matriz de adyacencia normalizada.  

Es asi como GCN permite la creación de embeddings para los nodos de un grafo dada la matriz de adyacencia de este, lo que quiere decir que debe conocer el grafo completo para poder realizar la tarea de aprendizaje. Este es un enfoque transductivo, en contraste a otros enfoques inductivos como GraphSAGE.


=== Graph Attention Network (GAT)

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



=== GraphSAGE (SAmple and aggreGatE)

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
