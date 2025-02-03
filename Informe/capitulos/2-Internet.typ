= Infrestructura de Internet 


- Internet es una red de computadoras que interconecta miles de millones de dispositivos informáticos en todo el mundo. @Computer-Networking

- Según algunas estimaciones, en 2015 había alrededor de 5 mil millones de dispositivos conectados a Internet, y se proyectaba que este número alcanzaría los 25 mil millones en 2020 [Gartner 2014]. @Computer-Networking
- Además, se estimaba que en 2015 había más de 3.2 mil millones de usuarios de Internet en todo el mundo, aproximadamente el 40% de la población mundial [ITU 2015]. @Computer-Networking

- El conglomerado de redes de investigación, académicas y gubernamentales, combinado con el núcleo de la red ARPANET, fue el principio de lo que llegaría a ser conocido como Internet.
- 

Gracias a la infrestructura de Internet un computados puede comunicarse con otro ubicado en una red lejana. Permitiendo asi el intercambio de información entre computadores de todo el mundo.

- In summary, today’s Internet—a network of networks—is complex, consisting of a dozen or so tier-1
ISPs and hundreds of thousands of lower-tier ISPs. The ISPs are diverse in their coverage, with some
spanning multiple continents and oceans, and others limited to narrow geographic regions. The lower-
tier ISPs connect to the higher-tier ISPs, and the higher-tier ISPs interconnect with one another. Users
and content providers are customers of lower-tier ISPs, and lower-tier ISPs are customers of higher-tier ISPs. In recent years, major content providers have also created their own networks and connect directly into lower-tier ISPs where possible @Computer-Networking
[Computer networking : a top-down approach [7th edition]]


#figure(
  image("../imagenes/Estructura-Internet-ISP.png", width: 40%),
  caption: [TODO:],
) <Red-de-Redes>




#figure(
  image("../imagenes/network-of-networks.svg", width: 40%),
  caption: [TODO:],
) <Red-de-Redes>

// En el caso de Internet, se define como una extensa red creada mediante  la interconexión de redes más pequeñas coonocidas como Sistemas Autónomos (AS), los que consisten en grupos de máquinas interconectadas que comparten un mismo protocolo de enrutamiento. Estos AS están gestionadas por diversas organizaciones, que pueden ser desde proveedores de acceso a Internet (ISP), grandes empresas tecnológicas, universidades o incluso agencias gubernamentales. A cada AS, se le asigna un número único conocido como ASN, el cual es utilizado parar identificar al AS. Además, a cada AS se le asigna un conjunto de direcciones IP del cual es responsable que le lleguen los paquetes.




 Este se puede dividir en Sistemás administrativos  los cuales posen uno o varios Sistemás Autónomos.
Dominio sadministrativos pueden ser desde college campuses, corporate networks , Large ISP (Internet Service Providers). 
Cada Sistemas Autonomo es representado por un numero de 16 bits llamado ASN (Autonomous System Number)., lo que hace que existan 65536 ASN posibles, de los cuales no todos estan asignados  a dominios adminitrativos y no todos los asignados son usados. 
Muchos ISPs poseen más de  un solo ASes.

Cada Sistemas Autonomo tiene sus propios routers y touting policies a traves del cual se comunica con otros Sistemas Autonomos para intercambiar trafico.Informe/capitulos/1-Introduccion.pdf

== Sistemas Autonomos (AS)


- Representados por un numero (ASN) de 16 bits.
(65536 ASN posibles, de los cuales no todos estan asignados  a dominios adminitrativos y no todos los asignados son usados. )
- Muchos ISPs por ejemplo poseen más de un solo AS.
- los Sistemas autónomos son operados y controlados de manera independiente. 


== Internet Exchange Points (IXPs)

- Tipicamente considera un medio compartido , interconecta varios routers de varios AS. La conexion fisica en un IXP no implica necesariamente que cada par de ASes intercambia trafico.
- IXP tienen asignados un ASN, pero de forma universalemnet aceptado este se saca de un AS PATH (pero algunos IXP lo dejan como metodo de debbuging)@InferringASRelatioships2001.


Los Internet Exchange Points (IXPs) son puntos de interconnecion entre redes, funciona como un medio compartido. Tipicamente, consiste en un switch (capa 2) de alta velocidad y capacidad que permite la interconexión de routers pertenecientes a distintos Sistemas Autónomos. Esto facilita el estableciemiento de relaciones de peering entre los Sistemas Autónomos, permitiendo el intercambio de tráfico de manera eficiente y a bajo costo.
Algunos IXPs existentes en Chile son PIT Chile y NAP Chile, quienes establecen conexiones. En Chile existe una normativa que regula la interconexión nacional según la cual, todos los ISP que operen deben estar interconectados entre sí. La interconexión nacional se logra conectándose a NAP Chile. 


Cada Sistema Autoonomo tiene la responsabilidad de 
// In the absolute simplest terms… a managed switch. Seriously, that’s pretty much it. I’m only kidding a bit. IXPs allow internet service providers or content providers to have a general space to come together and peer with each other. Each participant will have a router at the IXP site and peer with every participant, route server, or a subset of the participants. Peering will be done using external BGP (eBGP). This can also be a combination of peering with a route server and a few participants. The cost to run an IXP is usually divided between the participants.

// Imagine two internet providers with customers of their own in the west coast. The ISPs only peer with each other on the east coast. If customers on the west coast want to talk to each other, that traffic would have to travel from coast to coast just to end up back on the west coast. Not very efficient or economical. The ISPs could peer with each other at the west coast, but what if there’s another ISP or five? This would not scale very well and would become very costly. Below is a simple list of other IXP benefits:

//     Save money
//     Traffic stays local
//     Performance
//     Better customer experience



Internet Exchange
Point (IXP), which is a meeting point where multiple ISPs can peer together. An IXP is typically in a
stand-alone building with its own switches [Ager 2012]. There are over 400 IXPs in the Internet today
[IXP List 2016]. We refer to this ecosystem—consisting of access ISPs, regional ISPs, tier-1 ISPs,
PoPs, multi-homing, peering, and IXPs—as Network Structure 4.
[Computer networking : a top-down approach [7th edition]]


#figure(
  image("../imagenes/internet-exchange-point.jpg", width: 40%),
  caption: [TODO:],
) <IXP>

Internet Exchange Points:

    An Internet exchange point (IXP) is a physical location through which Internet infrastructure companies such as Internet Service Providers (ISPs) and Telecom Service Providers connect with each other.
    These locations exist on the “edge” of different networks, and allow network providers to share transit outside their own network.
    Internet exchange points (IXes or IXPs) are common grounds of IP networking, allowing participant Internet service providers (ISPs) to exchange data destined for their respective networks.
    Organizationally, most IXPs are each independent not-for-profit associations of their constituent participating networks (that is, the set of ISPs which participate at that IXP).
    The primary alternative to IXPs is private peering, where ISPs directly connect their networks to each other.
    The primary purpose of an IXP is to allow networks to interconnect directly, via the exchange, rather than going through one or more third-party networks. The primary advantages of direct interconnection are cost, latency, and bandwidth.0




// Generalmente son  un Swiych (layer 2) de muy alta velocidad/capacidad. (Parece que hay capa 3 (IP) pero la enorme mayoría no).
// // Permiten a los AS conectados establecer sesiones BGP entre ellos a najo costo, en vez de tener $nelevado2$ enlaces, basta con n enlaces. 
// Pero no requieren ser un AS ni son un hop de ruteo.




En base a esta estrctura podemos grer un grafo de internet, donde los nodos son los ASes y las aristas son las conexiones entre ellos. Cabe destacar en este caso que conexion no implica necesariamente que haya un intercambio de trafico entre los ASes conectados. Estod ebido a las posibles politicas de intercambio entre ASes.









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




// --------------------------------------------------


// -  Clique: Un conjunto de Sistemas Autonomos que estan interconectados, es decir,cada AS dentro del clique tiene una conexion directa con todos los demas AS dentro del clique. Este tipo de estructura suele encontrarse  en la capa más alta de la jerarquía   de tinterent, conocida como Tier-1 ASes.

// Los AS Tier-1 fomran un clique estableciendo coneciones de peering mutuo, intercambiando trafico sin costo entre ellos.









// == RIR (Regional Internet Registry)

// La IANA a traves d elos RIR 
// Son organizaciones responsables de la asignacion y administracion de direcciones IP y numeros de Sistemas Autonomos (ASNs) en determinadas regiones geograficas.

// - ARIN (American Registry for Internet Numbers): Norteamerica, el Caribe y Africa Subsahariana.
// - RIPE NCC (Réseaux IP Européens Network Coordination Centre): Europa, Oriente Medio y Asia Central.
// -APNIC (Asia-Pacific Network Information Centre): Asia y el Pacifico.
// - LACNIC (Latin American and Caribbean Network Information Centre): America Latina y el Caribe.
// - AfriNIC (African Network Information Centre): Africa.



// TODO: Definir Tier-1 AS.





#figure(
  image("../imagenes/topologiaBGP.png", width: 40%),
  caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
) <BGP-SA>


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



// == RIR

// + APNIC (Asia-Pacific Network Information Centre): Asian pacific
// + RIPE NCC (Réseaux IP Européens Network Coordination Centre): Europa
// + ARIN (American Registry for Internet Numbers): America del Norte
// + AfriNIC (African Network Information Centre): Africa
// + LACNIC (Latin American and Caribbean Network Information Centre): America Latina y el Caribe









== Ruteo 

El ruteo consiste en la elección de caminos que seguirá un paquete dentro de una red, con el propósito de garantizar que la información que se transmite por Internet pueda llegar a su destino mediante la ruta más eficiente. Una red está formada por múltiples maquinas a las cuales se les llama nodo y las rutas que las unen. La comunicación entre dos nodos de la red se puede establecer mediante la interconexión de diferentes caminos, permitiendo así, conectar dos nodos que no tienen una conexión directa por medio de nodos intermedios. De esta forma el enrutamiento es el proceso de seleccionar la mejor ruta entre estos nodos en base a algún parámetro o reglas.
Un enrutador o router es un dispositivo de red que se conecta a otros dispositivos y redes.
Son los encargados de seleccionar las rutas que irán tomando los datos enviados.
El ruteo opera gracias a las tablas de rutas presentes en los routers y a la información proporcionada en los encabezados de los paquetes, los cuales contienen datos sobre el destino del paquete. Cuando llega un paquete a un router, se consulta ls tabla de enrutamiento para localizar la dirección destinos, y posteriormente dirigir el paquete al próximo router o punto de red.
Para ilustrar esto, supongamos un usuario accede a una página web desde su hogar. En este escenario, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final en su tabla de rutas y lo envía al siguiente punto en red. Este nuevo punto será el encargado de realizar nuevamente el proceso de redirigir el paquete. Este procedimiento se repite en todos los routers hasta que finalmente el paquete llega al destino final.
Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración. Es útil en situaciones donde los parámetros de red permanecen constantes.
Por otro lado, en el enrutamiento dinámico, los routers se encargan de ir actualizando las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.


*Ruteo Interno*

Se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. En este contexto los routers ocupan protocolos de enrutamiento interno para intercambiar la información del estado de la red y las rutas disponibles. Entre los protocolos de ruteo interno
se tiene:
- *OSPF (Open Shortest Path First):* Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos @RFC-OSPF.
- *RIP (Routing Information Protocol):* Utiliza un enfoque de vector de distancia para
calcular la ruta más optima, basándose en la cantidad de saltos @RFC-RIP .

*Ruteo Externo*

Se centra en la gestión de rutas entre los diferentes Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo, que al igual que los protocolos de enrutamiento interno se encarga de intercambiar la información de las rutas disponibles, permitiendo así que paquetes viajen de manera más efectiva. Algunos protocolos de enrutamiento externos son:

- *BGP (Border Gateway Protocol):* Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente @RFC-BGP.
- *IS-IS (Intermediate System to Intermediate System):* Protocolo deenrutamiento de estado de enlace, similar a OSPF @IS-IS.




#figure(
  image("../imagenes/RoutingEI.png", width: 50%),
  caption: [TODO:],
) <Ruteo-Externo-Interno>










// == INTERNETT
// #h(0.5cm)
// Paper: The (In)Completeness of the Observed Internet AS-level Structure (2010)

// Hierarchical structure of the logical Internet graph (2001)
// Internet Topology Research Redux (2013)
// Internet path inflation due to policy routing (2001)
// Inferring AS Relationships Beyond Counting Edges (2004)
// CORIA — Analyzing internet connectivity risks using network graphs (2017)
// IXPs: mapped? (2009)

