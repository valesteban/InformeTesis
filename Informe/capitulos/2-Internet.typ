= Infrestructura de Internet 

El internet consiste en una gran coleccion de host interconectados. Este se puede dividir en Sistemás administrativos  los cuales posen uno o varios Sistemás Autónomos.
Dominio sadministrativos pueden ser desde college campuses, corporate networks , Large ISP (Internet Service Providers). 
Cada Sistemas Autonomo es representado por un numero de 16 bits llamado ASN (Autonomous System Number)., lo que hace que existan 65536 ASN posibles, de los cuales no todos estan asignados  a dominios adminitrativos y no todos los asignados son usados. 
Muchos ISPs poseen más de  un solo ASes.

Cada Sistemas Autonomo tiene sus propios routers y touting policies a traves del cual se comunica con otros Sistemas Autonomos para intercambiar trafico.Informe/capitulos/1-Introduccion.pdf



Los Internet Exchange Points (IXPs) son puntos de interconnecion entre redes, funciona como un medio compartido. Tipicamente, consiste en un switch (capa 2) de alta velocidad y capacidad que permite la interconexión de routers pertenecientes a distintos Sistemas Autónomos. Esto facilita el estableciemiento de relaciones de peering entre los Sistemas Autónomos, permitiendo el intercambio de tráfico de manera eficiente y a bajo costo.
Algunos IXPs existentes en Chile son PIT Chile y NAP Chile, quienes establecen conexiones. En Chile existe una normativa que regula la interconexión nacional según la cual, todos los ISP que operen deben estar interconectados entre sí. La interconexión nacional se logra conectándose a NAP Chile. 


Cada Sistema Autoonomo tiene la responsabilidad de 

// -  Un Número de sistema autónomo (ASN): un número entero de 32 bits que identifica de forma única una red. Por ejemplo, uno de los ASN de Cloudflare (tenemos varios) es 13335.

// -  Prefijos IP: un prefijo IP es un rango de direcciones IP, agrupadas en potencias de dos. En el espacio IPv4, dos direcciones forman un prefijo /31, cuatro forman un /30, y así sucesivamente, hasta /0, que es la abreviatura de "todos los prefijos de IPv4". Lo mismo aplica para IPv6, pero en lugar de agregar 32 bits como máximo, puede agregar hasta 128 bits. La siguiente figura muestra esta relación entre los prefijos IP, a la inversa: un /24 contiene dos /25 que contienen dos /26 y así sucesivamente

// los Sistemas autónomos son operados y controlados de manera independiente. 

// -  Clique: Un conjunto de Sistemas Autonomos que estan interconectados, es decir,cada AS dentro del clique tiene una conexion directa con todos los demas AS dentro del clique. Este tipo de estructura suele encontrarse  en la capa más alta de la jerarquía   de tinterent, conocida como Tier-1 ASes.

// Los AS Tier-1 fomran un clique estableciendo coneciones de peering mutuo, intercambiando trafico sin costo entre ellos.





// Estudios hechos por Yuchenjin et al. @ProbLink dentro de su estudio en la creación de un algoritmo de inferencias de ASes, determinó 5 tipos de links que eran dificiles de inferir. Para esto ocupo CoreToLeaf un algoritmo basico de inferencia el cual solo ocupaba la asumtio of valley-free y la ubicacion de Top provider AS para determinar las relaciones(mas info en  la seccion de ProbLink):


// LINKS HARD TO INFER:
// 1. Linls con degree max mas pequeño que 100:
// 2. Links observado por más de 50  pero menos de 100 VP:
// 3. Links Non-VP y Non-Tier1:
// 4. Unlabelede stub-clique links en coreToLeaf: 
// 5. Conflicts en CoreToLeaf:




// CHALLENGES IN AS INFERENCE:
// - Muchoas tecnicas de inferencia de relaciones entre AS relaizan 3 suposiciones-.
//   1. Highest degree ASes sit at top of the routing hierarchy
//   2. Peering ASes have similar degree
//   3. Providers have larger degree than customers
// @InferringASRelatioships2001 @ASRelationshipsCustomerConesValidation @InferringASRelationshipsDeadEndorLivelyBeginning
// esto afecta la accuracy de los algormios ya  que un paso impoortante de stos es encontrar/identificar ql clique Tier 1 Ases al top de la jerarquía.
// Debido al fenomeno de "flattening of the internet" [he flattening
// internet topology: Natural evolution, unsightly barna-
// cles or contrived collapse?] sabemos que Large content providers como Google, Microsoft y otros los cuales tineen un numero alto de degree are more willing to peer with large number  of lower tier Ases to get free and more efficient traffic exchange. 
// // TODO: buscar más de esto

// - violacion de la property Valley-free , que son la causa principal de inferir p2c links y conflictos. 3% of the BGP Paths violate valley-free property in AS-Rank segun @ProbLink en su estidio , la cual policias de AS que usan unconventional economic models [alley-free violation in inter-
// net routinganalysis based on BGP community data. In
// Communications (ICC)]. Por lo que un algoritmo robusto debiese tomar encuenta todos los path que pasan por ese link. y podría tener q revisitar y update la inferencia hehca por un  despues de inferir los tipos de los links vecinos.
// // TODO: leer papaer

// - Current technics are Sensitive to VP and Snapshot Selection: @probabilidad encontro que hay una variación alta de la accuracy cuando esta fue apluciada a AS-Rank algorimo para snapshops de los BGP Path de forma consecutiva. }en el fonod por el paso 1 

// == RIR (Regional Internet Registry)

// La IANA a traves d elos RIR 
// Son organizaciones responsables de la asignacion y administracion de direcciones IP y numeros de Sistemas Autonomos (ASNs) en determinadas regiones geograficas.

// - ARIN (American Registry for Internet Numbers): Norteamerica, el Caribe y Africa Subsahariana.
// - RIPE NCC (Réseaux IP Européens Network Coordination Centre): Europa, Oriente Medio y Asia Central.
// -APNIC (Asia-Pacific Network Information Centre): Asia y el Pacifico.
// - LACNIC (Latin American and Caribbean Network Information Centre): America Latina y el Caribe.
// - AfriNIC (African Network Information Centre): Africa.



// TODO: Definir Tier-1 AS.






// == Internet
// #h(0.5cm)Antes de abordar la definición de Internet, es crucial comenzar definiendo qué es una Red. Se trata de un conjunto de computadoras conectadas entre sí, que posibilita el intercambio de datos. En este contexto, una red puede ser visualizada como un grafo, donde los nodos representan los computadores y las aristas simbolizan las conexiones entre ellos que permiten el envío de mensajes.

// En el caso de Internet, se define como una extensa red creada mediante  la interconexión de redes más pequeñas coonocidas como Sistemas Autónomos (AS), los que consisten en grupos de máquinas interconectadas que comparten un mismo protocolo de enrutamiento. Estos AS están gestionadas por diversas organizaciones, que pueden ser desde proveedores de acceso a Internet (ISP), grandes empresas tecnológicas, universidades o incluso agencias gubernamentales. A cada AS, se le asigna un número único conocido como ASN, el cual es utilizado parar identificar al AS. Además, a cada AS se le asigna un conjunto de direcciones IP del cual es responsable que le lleguen los paquetes.

// La conexión entre computadoras y redes en Internet se establece a través de cables, ondas de radio y otras formas de infraestructura. Los datos transmitidos por estas conexiones se traducen en bits, los cuales, al ser leídos por una computadora, se descodifican y se interpretan como un mensaje.

// Es relevante destacar que los datos transmitidos a través de redes informáticas se dividen en paquetes, que pueden ser subdivisiones de paquetes más grandes. Cada paquete consta de dos partes: el mensaje en sí y el encabezado. Este último contiene información importante, como las direcciones de destino y origen, así como valores que indican si es un paquete es un fragmento de un mensaje más grande, entre otros detalles. El encabezado de un paquete permite que, una vez que el paquete alcanza su destino, pueda ensamblarse adecuadamente si es necesario.

// === Ruteo

// #h(0.5cm)El ruteo consiste en la elección de caminos que seguirá un paquete dentro de una red, con el propósito de garantizar que la información que se transmite por Internet pueda llegar a su destino mediante la ruta más eficiente. Una red está formada por múltiples maquinas a las cuales se les llama nodo y las rutas que las unen. La comunicación entre dos nodos de la red se puede establecer mediante la interconexión de diferentes caminos, permitiendo así, conectar dos nodos que no tienen una conexión directa por medio de nodos intermedios. De esta forma el enrutamiento es el proceso de seleccionar la mejor ruta entre estos nodos en base a algún parámetro o reglas. 

// Un enrutador o router es un dispositivo de red que se conecta a otros dispositivos y redes. Son los encargados de seleccionar las rutas que irán tomando los datos enviados.  

// El ruteo opera gracias a las tablas de rutas presentes en los routers y a la información proporcionada en los encabezados de los paquetes, los cuales contienen datos sobre el destino del paquete.
// Cuando llega un paquete a un router, se consulta la tabla de enrutamiento para localizar la dirección destinos, y posteriormente dirigir el paquete al próximo router o punto de red.

// Para ilustrar esto, supongamos un usuario accede a una página web desde su hogar. En este escenario, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final en su tabla de rutas y lo envía al siguiente punto en red. Este nuevo punto será el encargado de realizar nuevamente el proceso de redirigir el paquete. Este procedimiento se repite en todos los routers hasta que finalmente el paquete llega al destino final.


// Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración. Es útil en situaciones donde los parámetros de red permanecen constantes. Por otro lado, en el enrutamiento dinámico, los routers se encargan de ir actualizando las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.

// === Ruteo Interno

// #h(0.5cm)Se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. En este contexto los routers ocupan protocolos de enrutamiento interno para intercambiar la información del estado de la red y las rutas disponibles. 
// Entre los protocolos de ruteo interno se tiene:

// - OSPF (Open Shortest Path First): Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos@OSPF.
// - RIP (Routing Information Protocol): Utiliza un enfoque de vector de distancia para calcular la ruta más optima, basándose en la cantidad de saltos@RIP.
// - EIGRP (Enhanced Interior Gateway Routing Protocol): 

// - IS-IS (Intermediate System to Intermediate System):


// === Ruteo Externo

// #h(0.5cm)Se centra en la gestión de rutas entre los diferentes Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo, que al igual que los protocolos de enrutamiento interno se encarga de intercambiar la información de las rutas disponibles, permitiendo así que paquetes viajen de manera más efectiva. 
// Algunos protocolos de enrutamiento externos son:

// - BGP (Border Gateway Protocol): Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente@RFC-BGP.

// - IS-IS (Intermediate System to Intermediate System): Protocolo de enrutamiento de estado de enlace, similar a OSPF@IS-IS.



// ==== Border Gateway Protocol (BGP)


// #h(0.5cm)El Border Gateway Protocol (BGP) es un protocolo de enrutamiento externo, que se utiliza para intercambiar información de rutas entre los diferentes Sistemas Autónomos que conforman el Internet ( @BGP-SA ). Toma decisiones de enrutamiento basadas en políticas, reglas de Red y el camino más corto (AS PATH)@RFC-BGP.


// El protocolo BGP comienza con un handshake, el cual se hace entre dos vecinos BGP, donde los AS se ponen de acuerdo en cuanto a configuraciones y soporte que tendrán por ejemplo si soportaran IPv4 o IPv6 o ambas. Una vez establecida la conexión estas intercambian información mediante UPDATES donde se pueden agregar o quitar caminos. De este modo, los vecinos actualizarán sus tablas de rutas y propagarán estos mismos cambios a sus vecinos.

// De este, modo BGP elige caminos mediante la determinación del camino más corto según saltos entre AS apara llegar a su destino, sin embargo, esta métrica para determinar el siguiente salto de un paquete no toma en cuenta factores como congestión o velocidad de conexión al momento de seleccionar una ruta.

// #figure(
//   image("../imagenes/topologiaBGP.png", width: 40%),
//   caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
// ) <BGP-SA>



// The main problem of BGP is the lack of validity and
// verification mechanisms that render it vulnerable to attacks
// such as BGP hijacking or black-holin[C. Zheng, L. Ji, D. Pei, J. Wang, and P. Francis, "A light-weight
// distributed scheme for detecting ip prefix hijacks in real-time", ACM
// SIGCOMM Computer Communication Review, vol. 37, no. 4, p. 277,
// 2007]



// ==== Autonomous Systems (AS)

// Cada AS :
// - Es administrado por una organizaciín por ejemplo ISP, universidad, empresa, etc.

// - Controla un conjunto de direcciones IP.

// - Es ideantificado con un numero.

// Algunas observaciones:
// - Un AS puede incluir ips de diferentes paises. por ejemplo AS de Facebook  (AS32934) tiene direcciones ip en Singapure, Canada Nigeria, KEnya, EEUU y en mas paises.


// - It seems like IP address can be in more than one AS. For example, if I look up 209.216.230.240, it has 2 ASNs associated with it – AS6130 and AS21581. Apparently when this happens the more specific route takes priority – so packets to that IP would get routed to AS21581.


// Ases comunmente son divididos en 3 tier levels:  
// Ases comunmente son divididos en 3 tier levels:   (https://onlinelibrary.wiley.com/doi/10.1111/cgf.14287)
// depending on their status as customer or provider of traffic. esto es mas bien un acuendo aceptado, mas q por una definicion fomral.
// // well-accepted agreement than a binding definition.
// - Tier 1:  re global networks which can reach all other networks without paying for the transit.
// - Tier 3: are small local networks which pay for transit and peering to reach other networks. 
// - Tier 2: are in the middle with a mixture of paid and free transit/peering.

// Luckie et al. [] analizo las rewlaciones y propuso una metrica para (customer cone metric) para indicar  que tan global es un AS., se usa esta metrica para separar entre los tiers.

// - Customer cone >= 200 -> Tier
// - 2000 > Customer cone > =200 -> Tier 2
// - Customer cone < 200 -> Tier 3
// ==== Transit agreements
// FIXME: Esta copiado textual de papers
// are commercial contracts in which,
// typically, a customer pays a service provider for access to the Internet;

// these agreements are
// most prevalent at the edges of the Internet, where the topology consists primarily of singly
// connected “leaf” networks that are principally concerned with the delivery of their own traffic.   

// - Transit agreements: Son contratos comenciales, donde tipicamnet un cliente paga  a un sefive provider para accerder a partes del internet que no pueder llegar. Estos acuerdo son más orevalentes en los bordes/final del grafod e internet donde la topología consiste en su mayoria en "leafs"
// // @SurveyInterconnectionAgreements que representan networks que estas preocupadas principalmente de envia  su propio trafico al esto de Internet.

// - Peering agreements: Son los acuerdos de interconexión entre operadores que permiten a las redes intercambiar tráfico dirigido a los clientes de cada uno. son más comunes en el núcleo de Internet, donde la topología consiste en redes densamente interconectadas @SurveyInterconnectionAgreements que se dedican principalmente al transporte de tráfico en nombre de las redes que son sus clientes.// FIXME: Arrgealr igual que el paper



// The common understanding is that only routes to customer networks are exchanged,
// that BGP version 4 is used to communicate those routes, and that each network will exercise a
// reasonable duty of care in cooperating to prevent abusive or criminal misuse of the network.

// En caso de los peering agreementes 


// REFERENCIAS
// - https://www.berec.europa.eu/sites/default/files/files/document_register_store/2016/11/BoR_%2816%29_237_PCH-Peering-Survey-2016.pdf



// ==

// == Estado del arte
// // TODO: Completar

// - Hablar tecnicas que se han usado para representar grafos:
//   - deepwalk
//   - pagerank
//   - bgp2vec
//   - etc

// - Habalr uso GNN y datos internet

// - hsbalr Problema especifico y como se ha resuelto





// // = Mas inifo que no se donde pondera
// // == Autonomosus Systems (AS)
// // “The classic definition of an Autonomous System is a
// // set of routers under a single technical administration” [RFC1771]

// // ASNs use BGP sessions to exchange routes.

// // PATHS

// // + BGP hides thinfs.
// // +If there are multiple paths between two ASes, BGP will only advertise the best path.
// // + We use multiple views to get around this problem.
// // + we still miss things.

// // ¿Cómo obtenemos los paths?
// + Gettings AS Paths.
// + The more paths we can get the more
// neighbourings we can infer.
// + The more neighbours the better the graph
// looks.

// ¿Donde podemos obtenes los AS Paths?
// - RouteViews
// - RIS:The RIPE NCC collects and stores Internet routing data from several locations around the globe, using the Routing Information Service (RIS), established in 2001


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
// ------------------------------------
// FORMATO MRT
// + https://tools.ietf.org/html/draft-ietf-grow-mrt-09
// + This format was developed in concert with the
// Multi-threaded Routing Toolkit (MRT) from
// whence the format takes it name. The format
// can be used to export routing protocol
// messages, state changes, and routing
// information base contents.
// + A lot of the RouteViews and RIS files are in MRT
// dump format. We need to be able to parse them
// to extract the Paths.


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

// == RIR

// + APNIC (Asia-Pacific Network Information Centre): Asian pacific
// + RIPE NCC (Réseaux IP Européens Network Coordination Centre): Europa
// + ARIN (American Registry for Internet Numbers): America del Norte
// + AfriNIC (African Network Information Centre): Africa
// + LACNIC (Latin American and Caribbean Network Information Centre): America Latina y el Caribe



// == Internet Exchange Points


// Generalmente son  un Swiych (layer 2) de muy alta velocidad/capacidad. (Parece que hay capa 3 (IP) pero la enorme mayoría no).
// // Permiten a los AS conectados establecer sesiones BGP entre ellos a najo costo, en vez de tener $nelevado2$ enlaces, basta con n enlaces. 
// Pero no requieren ser un AS ni son un hop de ruteo.


// == Creación de grafos.

// PAra trabajar con un grafo de la libreria DGL, los nodos deben tener una representación vectorial. Por lo tanto no nos sobra unicamente con tener la topología de los SA que como se vio en la parte de DATOS puede ser sacada de esas 3 fuentes, siendo la principal y mas RAW la de RIPE NCC y RouteVIews, ya que CAIDA contiene estos datoso pero ya en datsets creados por otros investigadores. 
// Es por esto que tenemos que ver como agregarles las featiures. a lo que se tomaren diferentes enfoques a est e problema:
// - Ocupar features ya creadas por el paper [AGREGAR], elc ual tiene diferentes caracteristicas indicadas en el anex [poenr que parte del anexo] a la fecha de Julio de  2022, sin embargo este dataset contiene muchos valores no conocidos para los SA, además de que hace que solo nos podamos trabajar en esa fecha.

// - Crear representaciones en base a las caracteristicas topologicas de nuestro grafo de internet. En este caso se crearon embeddings para lso nodos los cuales contenian el grado de entrada y salida, la cantidad de vecinos, la cantidad de vecinos en comun con otros nodos, entre otros. Tambien se crearon embeddings para las aristas, los cuales contenian la cantidad de vecinos en comun entre los nodos que conectan, la cantidad de nodos en comun entre los nodos que conectan, entre otros.

// - Otro enfoque fue crear representaciones de los nodos en base a metodos/algoritmos ya existentes que intentar representar la posicion/importancia de nodo en el contexto de grafo. Se ocupo por ejemplo PageRank, DeepWalk.

// . Finalemnet el ultimo enfoque que s etomo fue crear estas representaciones desde 0.


// == INTERNETT
// #h(0.5cm)
// Paper: The (In)Completeness of the Observed Internet AS-level Structure (2010)

// Hierarchical structure of the logical Internet graph (2001)
// Internet Topology Research Redux (2013)
// Internet path inflation due to policy routing (2001)
// Inferring AS Relationships Beyond Counting Edges (2004)
// CORIA — Analyzing internet connectivity risks using network graphs (2017)
// IXPs: mapped? (2009)



// En cuatnto a clasificacion con gnn se ha inferido:
// - AS_rank_continent
// - AS_hegemony
// - AS_rank_continent
// - link prediction

// AS to ORG?


// -ver si ahy algun clusting en base a lso embeddings que se crean?



// - hablar en alguna parte de inductive learning y GNN, en contras a el transductivo, donde el modelo solo puede hacer predicciones sobre los nodos y aristas que estaban presentes durante el entrenamiento, sin capacidad de generalización a nuevos nodos.[Ver mas en Extras cuader DGL] 