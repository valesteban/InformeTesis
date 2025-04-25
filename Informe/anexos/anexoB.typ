





Definiciones:
= Sistemas Autonomos

Como se hablo previamente en la seleccion [TODO:]XXXXX los Sistema sAutonomos son un ocnjunto de dispositivos que comparten un mismo protocolo de ruteo y estan administrados por una misma entidad, y su interconexion forma el Internet.

Los AS se identifican con un número de Sistema Autónomo (ASN) de 16 bits y controlan un conjunto de direcciones IP. 
Esta asignación es llevada a cabo por los Registros Regionales de Internet (_Regional Internet Registry_, RIRs), quienes reciben bloques de IPs por la _Internet Assigned Numbers Authority_ (IANA) y los distribuyen a los Registros Locales de Internet (_Local Internet Registries_, LIR) y a los usuarios finales.

Los ISP, quienes pueden estar conformados por uno o varios Sistemas Autónomos, se dividen comúnmente en tres niveles de jerarquía. El _Tier-1_, donde se encuentran los AS que conforman el _backbone_ de Internet, estos intercambian paquetes entre sí sin un costo asociado. Los _Tier-2_ son generalmente operadores nacionales que compran tránsito a los _Tier-1_ y venden tránsito a los _Tier-3_. Finalmente los _Tier-3_ son los operadores locales que pagan por el tránsito para proporcionar acceso a Internet a los usuarios finales @InterconnectionPeeringSettlements. También, Luckie et al. @ASRank analizó los AS y propuso una métrica para indicar qué tan global es un AS, donde si el customer cone es mayor o igual a 200, se considera _Tier-1_; si es mayor a 2,000, se considera _Tier-2_; y si es menor a 200, se considera _Tier-3_.

Una última separación que se puede hacer entre AS es según sus conexiones a otros Sistemas Autónomos,  clasificándolos en _single-homed_ y _multi-homed_. Los AS _single-homed_ tienen solo una conexión a otro AS, mientras que los _multi-homed_ tiene conexiones a más de un AS.



=== Internet Exchange Points

Los _Internet Exchange Points_ (IXPs) son puntos de interconexión donde múltiples ASes pueden establecer relaciones de peering con otros ASes @Computer-Networking.

Un IXP consiste generalmente en un switch  o router de alta velocidad y capacidad que conecta routers de diferentes ASes, permitiendo el intercambio directo de tráfico sin necesidad de atravesar redes intermedias. Mejorando así el intercambio de tráfico, haciéndolo más eficiente y de bajo costo.

// FIXME: arregalr redaccion
Las relaciones de tráfico en un IXP se establecen mediante el protocolo BGP, y el IXP solo actua como un intermediario. De esta forma por ejemplo un ISP en vez de estar conectados a multiples ASes  en una coneccion punto a punto, puede conectarse unicamente al IXP y como estos otros ASess tambien estaran conectados al IXP se ahorra recuersos fisicos y de administracion.


Al igual que los ASes, los IXPs tienen un ASN. Sin embargo, de forma generalizada, este ASN se extrae de los AS PATH en BGP. Algunos IXPs lo mantienen visible como método de debugging @InferringASRelatioships2001. 




= BGP 


BGP utiliza TCP @RFC793-TCP como su protocolo de transporte, lo que significa que no necesita preocuparse por la fragmentación de paquetes, la confirmación de recepción (ACK), la retransmisión de datos, entre otros aspectos de confiabilidad.


Los mensajes BGP solo son procesados una vez que han sido completamente recibidos. Su tamaño mínimo es de 19 octetos, correspondiente al _HEADER_, mientras que el tamaño máximo es de 4096 octetos. Existen 4 tipos de mensajes en BGP: _OPEN_, _UPDATE_, _KEEPALIVE_ y _NOTIFICATION_.




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




= GNN

// Así, la esencia detrás del uso de GNNs radica en su capacidad de entrenar un modelo que pueda procesar un grafo, sus nodos y relaciones, logrando identificar patrones relevantes en la topología para lograr de forma efectiva la tarea asignada.


// El diseño de una GNN se hace por medio de la combinación de diferentes módulos: 

// - Módulo de propagación: Este módulo se utiliza para propagar información entre los nodos capturando tanto la topología como los atributos de los nodos. Esto se logra combinando los datos de cada nodo con los de sus vecinos.

// - Módulo de muestreo: Cuando los grafos son muy grandes, se utiliza generalmente un módulo de muestreo con el fin de seleccionar un subconjunto del grafo, aportando de este modo  en la capacidad de generalización de un modelo y reducción de complejidad. Se combina generalmente con un módulo de propagación.

// - Módulo de pooling: Cuando se necesita representaciones de subgrafos su utiliza este módulo para extraer información de los nodos. Se utiliza para reducir la dimensionalidad de las representaciones de nodos. 

// Un modelo GNN se construye generalmente combinando estos módulos. A continuación ( @pipelineGNN), se ilustra el pipeline de una arquitectura GNN. 
// El modelo recibe como entrada un grafo, y en la capa GNN, se emplea un operador convolucional, un módulo de muestras y una operación skip-connection que se fusionan para propagar la información y extraer detalles de alto nivel mediante el módulo de pooling. Después de pasar por todas las capas intermedias, se obtiene una salida en forma de embeddings, a los cuales se les aplica una función de pérdida para obtener los resultados del ajuste del modelo en base a la tarea asignada.


// #figure(
//   image("../imagenes/basepipelineGNN.png", width: 60%),
//   caption: [Pipeline básico de una arquitectura GNN.],
// ) <pipelineGNN>


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








= Vocabulario
- *Protocolos:* Un protocolo en Internet ... TODO: Completar



- *IRR*: Internet Routing Registry. Base de datos que contiene información sobre los prefijos IP y los sistemas autónomos que los anuncian. Los IRRs son utilizados por los operadores de red para filtrar rutas BGP y prevenir el anuncio de rutas falsas.
- *RIR:*: Regional Internet Registry. Son organizaciones responsables de la asignacion y administracion de direcciones IP y numeros de Sistemas Autonomos (ASNs) en determinadas regiones geograficas. ARIN (American Registry for Internet Numbers): Norteamerica, el Caribe y Africa Subsahariana; RIPE NCC (Réseaux IP Européens Network Coordination Centre): Europa, Oriente Medio y Asia Central; APNIC (Asia-Pacific Network Information Centre): Asia y el Pacifico; LACNIC (Latin American and Caribbean Network Information Centre): America Latina y el Caribe; AfriNIC (African Network Information Centre): Africa.

- *AS:*: Autonomous System
- *BGP:*: Border Gateway Protocol
- *RRC:*: Route Collectors
- *IXP:*: Internet Exchange Point
- *Internet Carrier*: Empresas que operan infrestructras de Red de gran escala. Ofrecen servicios de intercambio de datos.
Forman parte del nucleo de Internet.
ejemplos de carrier son: AT&T.
- *ISP:* Internet Service Provider
- *CDN:* Content Delivery Network
- *ASN:* Número de sistema autónomo, un número entero de 32 bits que identifica de forma única una red. Por ejemplo, uno de los ASN de Cloudflare (tenemos varios) es 13335.

- *content provider network:* Red privada que conecta sus centros de datos a Internet, a menudo evitando los ISP regionales de nivel 1.@Computer-Networking

- *Internet Service Provider (ISP)*: Proveedor de servicios de Internet. Empresa que ofrece servicios de acceso a Internet a usuarios finales. Se encuentras en la parte mśa oeriferica de la red de Internt


-  *Prefijos IP:* un prefijo IP es un rango de direcciones IP, agrupadas en potencias de dos. En el espacio IPv4, dos direcciones forman un prefijo /31, cuatro forman un /30, y así sucesivamente, hasta /0, que es la abreviatura de "todos los prefijos de IPv4". Lo mismo aplica para IPv6, pero en lugar de agregar 32 bits como máximo, puede agregar hasta 128 bits. La siguiente figura muestra esta relación entre los prefijos IP, a la inversa: un /24 contiene dos /25 que contienen dos /26 y así sucesivamente

-  *Clique:* Un conjunto de Sistemas Autonomos que estan interconectados, es decir,cada AS dentro del clique tiene una conexion directa con todos los demas AS dentro del clique. Este tipo de estructura suele encontrarse  en la capa más alta de la jerarquía   de tinterent, conocida como Tier-1 ASes.

- *IANA:*