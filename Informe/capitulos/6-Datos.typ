= Internat Data collection
// https://www.pacnog.org/pacnog17/presentations/MappingTheInternet.pdf


== CAIDA

El Centro de Análisis de Datos de Internet Aplicados o CAIDA por sus siglas en inglés
@CAIDA es una organización de investigación cuyo principal objetivo es la recopilación y análisis de datos relacionados a la infrestructura, rendimiento y trafico del Internet. Este funciona como un canal de difusión donde se publican y comparten tanto herramientas como investigaciones relacionado a las redes de Internet.

En el contexto de nuestro problema de *inferencia de Relaciones entre Sistemas Autonomos*, CAIDA ofrece el dataset *CAIDA AS Relationships* @CAIDAS-relationship. Este clasifica las relaciones entre Sistemas Autonomos en dos principales tipos: Customer-to-provider (C2P) y Peer-to-peer (P2P). Estas relaciones son inferidas a partir de datos públicos de ruteoBGP ofrecidos por RouteViews@RouteViewsProject y RIPE RIS@RIPE-RIS.
El dataset *CAIDA AS Relationships* está compuesto por dos subdatasets:
- *serial-1:* Contiene las relaciones inferidas utilizando un método similar al descrito en el estudio de M. Lukie et al.@ASRelationshipsCustomerConesValidation .Esta disponible dasde 1998 hasta la actualidad, con un archivo mensual. Cada archivo incluye un grafo completo derivado de instantáneas de las tablas BGP de RouteViews y RIPE RIS, tomadas cada 2 horas durante un período de 5 días.

- *serial-2:* Basado en el dataset Serial-1, este agrega enlaces inferidos mediante BGP communities, utilizando el método descrito por Vasileios et al. @Inferring-Multilateral-Peering . Está disponible desde octubre de 2015 hasta el presente, con archivos generados mensualmente.

Otro proyecto relevante de CAIDA es Archipelago (Ark) Measurement Infrastructure, una plataforma de medición distribuida a nivel global. Esta cuenta con nodos de medición ubicados en diversas zonas geográficas y topológicas para proporcionar una visión integral del estado y funcionamiento de Internet. Entre las mediciones realizadas a través de Ark se encuentran proyectos como The Spoofer Project ,Scamper, Internet Topology Discovery, entre otros.


Además, CAIDA ofrece BGPStream @BGPStream, una librería de código abierto diseñada para manejar grande svolumenes de datos BGP. Esta herramienta permite acceder tanto a datos BGP en tiempo real como a históricos, obtenidos de los colectores de RouteViews y RIPE NCC. Esto facilita la investigación y el análisis de eventos relacionados con el enrutamiento, como interrupciones, fugas de rutas o ataques BGP, de manera eficiente y rápida.



// [https://www.caida.org/projects/spoofer/]
// [https://www.caida.org/catalog/software/scamper/]
// [https://www.caida.org/catalog/datasets/ipv4_routed_24_topology_dataset/]


== RouteViews Project

El proyecto RouteViews @RouteViewsProject de la Universidad de Oregon nació en un principio como una herramienta los operadores de Internet, con el fin de que estos pudiesen obtener información BGP en tiempo real sobre el sistema de enrutamiento global desde las perspectivas de varios backbones y ubicaciones en Internet. 

Sin embargo hoy en dia, su uso se ha extendido a multiples tareas, tales como la visualización de rutas AS, el estudio de la utilizacion del espacio de direcciones IPv4 y  otros aspectos relacionados a la infrestructura y enrutamiento de Internet. 

// Hoy en día, RouteViews es ampliamente utilizado en investigaciones sobre la infraestructura y el comportamiento del enrutamiento global.

// TODO: Arreglar ANexo
El proyceto cuenta con alrededor de 41  recolectores de enrutamiento  (ver en ANEXO)  ubicados en puntos clave al rededor del mundo, como Ámsterdam, Londres, Sídney, Singapur, São Paulo, Santiago, Nairobi, Sudáfrica, Chicago, California y otras ubicaciones, especialmente en Internet Exchange Points (IXP). Estos recolectores obtienen información de enrutamiento de más de 260 organizaciones difernetes que compaten sus datos  con RouteViews, incluyendo muchos de los ISP más grandes del mundo.

Los recolectores establecen sesiones de peering BGP con diferentes sistemas autónomos, a través de estas conexiones, los recolectores reciben actualizaciones de las tablas BGP (RIS) y UPDATES del protocolo BGP, obteniendo asi información sobre las rutas globales y las conexiones entre AS.
En estas actualizaciones incluyen infomración como:
- *AS Path:* Camino de Sistemas Autonomos que un paquete debe seguir para llegar a una red destino.
- *Prefijos IP:* Rangos de direcciones IP que están siendo anunciados por los AS.
- *Next Hop:* Siguiente salto (router o red) que los paquetes deben tomar para continuar hacia su destino.

El proyecto también cuenta con una compilación de archivos en dos formatos, los obtenidos por Cisco y por el software de enrutamiento FRR. El primero recopila información en intervalos de 2 horas, comenzando a las 00:00 UTC. El segundo obtiene RIBs y actualizaciones, los RIBs corresponden a snapshots recogidas cada 2 horas, mientras que los Updates son archivos continuos que se actualizan cada 15 minutos. Estos archivos históricos están en formato MRT y están disponibles para cada recolector.


// + http://www.routeviews.org/
// + PAPERS: https://www.routeviews.org/routeviews/index.php/papers/

== RIPE NCC RIS


RIPE (Reseaux IP Européens) Network Coordination Centre es uno de los cinco Registros Regionales de Internet (RIRs) que proporciona servicios de registro de Internet y coordinación de recursos de Internet para Europa, Oriente Medio y partes de Asia Central.
RIPE NCC opera el Routing Information Service (RIS) @RIPE-RIS, una plataforma de recopilación de datos de enrutamiento, que tiene como ojetivo mejorar la comprensión y visibilidad del sistema global de enrutamiento de Internet.

Al igual que RouteViews, RIS recopila datos a traves de un conjunto de más de 26 colectores (ANEXO) remos de rutas (RRCs) distfribuidos globalmente, generalmente ubicados en Puntos de Intercambio de Internet (IXPs).  Voluntarios se conectan con los RRCs mediante BGP, y RIS almacena los mensajes que  recibe de estos peering.

Para acceder a los datos, existen dos formas: directamente a través de archivos en formato MRT, RIS Live y RISwhois, o mediante herramientas que utilizan los datos de RIS, como RIPEstat, donde se puede encontrar información ya organizada, como la exploración del enrutamiento por país y la localización de información de contacto sobre abusos.


== The peering DB

PeeringDB @PeeringDB es una base de datos de acceso libre, una iniciativa sin fines de lucro, gestionada y promovida por voluntarios, donde los usuarios comparten información sobre redes. Esta información facilita la interconexión global de redes en Puntos de Intercambio de Internet (IXPs), centros de datos, y además proporciona datos valiosos para investigaciones.

Fue creada con el fin de facilitar 
he resource was created to help support peering between networks and peering coordinators, and today, it includes a wide range of interconnection data from networks, 

== Hurricane Electric Internet Services


// == Servidores Looking Glass


// == Otros

// === BGGPView



// https://bgpview.io/

// === Neo4j
// Neo4j es una base de datos orientada a grafos que permite modelar, almacenar y consultar datos en forma de nodos, relaciones y propiedades. Es ampliamente utilizada para trabajar con datos altamente conectados, gracias a su diseño eficiente para manejar relaciones complejas entre datos.




// https://neo4j.com/



// NeoDash es una herramienta de visualización y análisis de datos diseñada específicamente para bases de datos de grafos Neo4j. Proporciona un entorno intuitivo para crear paneles interactivos (dashboards) que permiten explorar, visualizar y analizar los datos almacenados en Neo4j.



// === Formato MRT

// - Multi-threaded Routing Toolkit (MRT)

// Muchos de los archivos de RouteViews y RIS estan en formato MRT. Para extraer los Paths se necesita parsearlos.

// Otra forma de obtener es ????? es a traes del formato MRT. Este formato fue desarrollado en conjunto con el Multi-threaded Routing Toolkit (MRT) de donde toma su nombre. El formato puede ser usado para exportar mensajes de protocolos de ruteo, cambios de estado y contenido de la base de datos de ruteo.


// Para pasar archivos en formato MRT a archivos CSV  https://github.com/YoshiyukiYamauchi/mrtparse



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










// == Hurricane BGP Toolkit
// El Hurricane Electric BGP Toolkit es un conjunto de herramientas en línea desarrollado por Hurricane Electric, diseñado para analizar y monitorear datos de BGP.
// https://bgp.he.net/

