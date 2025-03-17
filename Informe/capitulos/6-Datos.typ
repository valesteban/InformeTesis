= Internet Data collection
// https://www.pacnog.org/pacnog17/presentations/MappingTheInternet.pdf

La recopilación de datos de Internet es fundamental para comprender su funcionamiento, identificar áreas de mejora y optimizar su infraestructura. La información sobre tráfico, rutas y otros permite detectar anomalías, prevenir amenazas y mejorar el rendimiento global. Además, estos datos son clave para la investigación y el desarrollo de nuevas tecnologías que mejoren la conectividad y la eficiencia de la red.

A continuación, se presentan algunas fuentes clave que proporcionan datos públicos sobre Internet:

== CAIDA

El Centro de Análisis de Datos de Internet Aplicados o CAIDA por sus siglas en inglés
@CAIDA es una organización de investigación cuyo principal objetivo es la recopilación y análisis de datos relacionados a la infrestructura, rendimiento y tráfico del Internet. Este funciona como un canal de difusión donde se publican y comparten tanto herramientas como investigaciones relacionado con las redes de Internet.

En el contexto de nuestro problema de *inferencia de Relaciones entre Sistemas Autonomos*, CAIDA ofrece el dataset *CAIDA AS Relationships* @CAIDAS-relationship. Este clasifica las relaciones entre Sistemas Autonomos en dos principales tipos: Customer-to-provider (C2P) y Peer-to-peer (P2P). Estas relaciones son inferidas a partir de datos públicos de ruteoBGP ofrecidos por RouteViews @RouteViewsProject y RIPE RIS @RIPE-RIS.
El dataset *CAIDA AS Relationships* está compuesto por dos subdatasets:
- *serial-1:* Contiene las relaciones inferidas utilizando un método similar al descrito en el estudio de M. Lukie et al. @ASRank .Esta disponible desde 1998 hasta la actualidad, con un archivo mensual. Cada archivo incluye un grafo completo derivado de instantáneas de las tablas BGP de RouteViews y RIPE RIS, tomadas cada 2 horas durante un período de 5 días.

- *serial-2:* Basado en el dataset Serial-1, este agrega enlaces inferidos mediante BGP communities, utilizando el método descrito por Vasileios et al. @Inferring-Multilateral-Peering . Está disponible desde octubre de 2015 hasta el presente, con archivos generados mensualmente.

Otro proyecto relevante de CAIDA es Archipelago (Ark) Measurement Infrastructure, una plataforma de medición distribuida a nivel global. Esta cuenta con nodos de medición ubicados en diversas zonas geográficas y topológicas para proporcionar una visión integral del estado y funcionamiento de Internet. Entre las mediciones realizadas a través de Ark se encuentran proyectos como The Spoofer Project ,Scamper, Internet Topology Discovery, entre otros.


Además, CAIDA ofrece BGPStream @BGPStream, una librería de código abierto diseñada para manejar grandes volumenes de datos BGP. Esta herramienta permite acceder tanto a datos BGP en tiempo real como a históricos, obtenidos de los colectores de RouteViews y RIPE NCC. Esto facilita la investigación y el análisis de eventos relacionados con el enrutamiento, como interrupciones, fugas de rutas o ataques BGP, de manera eficiente y rápida.



// [https://www.caida.org/projects/spoofer/]
// [https://www.caida.org/catalog/software/scamper/]
// [https://www.caida.org/catalog/datasets/ipv4_routed_24_topology_dataset/]


== RouteViews Project

El proyecto RouteViews @RouteViewsProject de la Universidad de Oregon nació en un principio como una herramienta los operadores de Internet, con el fin de que estos pudiesen obtener información BGP en tiempo real sobre el sistema de enrutamiento global desde las perspectivas de varios backbones y ubicaciones en Internet. 

Sin embargo hoy en dia, su uso se ha extendido a multiples tareas, tales como la visualización de rutas AS, el estudio de la utilización del espacio de direcciones IPv4 y  otros aspectos relacionados a la infraestructura y enrutamiento de Internet. 

// Hoy en día, RouteViews es ampliamente utilizado en investigaciones sobre la infraestructura y el comportamiento del enrutamiento global.

// TODO: Arreglar ANexo
El proyecto cuenta con alrededor de 41  recolectores de enrutamiento  (ver en ANEXO)  ubicados en puntos clave alrededor del mundo, como Ámsterdam, Londres, Sídney, Singapur, São Paulo, Santiago, Nairobi, Sudáfrica, Chicago, California y otras ubicaciones, especialmente en Internet Exchange Points (IXP). Estos recolectores obtienen información de enrutamiento de más de 260 organizaciones diferentes que comparten sus datos  con RouteViews, incluyendo muchos de los ISP más grandes del mundo.

Los recolectores establecen sesiones de peering BGP con diferentes sistemas autónomos, a través de estas conexiones, los recolectores reciben actualizaciones de las tablas BGP (RIS) y UPDATES del protocolo BGP, obteniendo así información sobre las rutas globales y las conexiones entre AS.
En estas actualizaciones incluyen información como:
- *AS Path:* Camino de Sistemas Autonomos que un paquete debe seguir para llegar a una red destino.
- *Prefijos IP:* Rangos de direcciones IP que están siendo anunciados por los AS.
- *Next Hop:* Siguiente salto (router o red) que los paquetes deben tomar para continuar hacia su destino.

El proyecto también cuenta con una compilación de archivos en dos formatos, los obtenidos por Cisco y por el software de enrutamiento FRR. El primero recopila información en intervalos de 2 horas, comenzando a las 00:00 UTC. El segundo obtiene RIBs y actualizaciones, los RIBs corresponden a snapshots recogidas cada 2 horas, mientras que los Updates son archivos continuos que se actualizan cada 15 minutos. Estos archivos históricos están en formato MRT y están disponibles para cada recolector.


// + http://www.routeviews.org/
// + PAPERS: https://www.routeviews.org/routeviews/index.php/papers/

== RIPE NCC RIS

RIPE (Reseaux IP Européens) Network Coordination Centre es uno de los cinco Registros Regionales de Internet (RIRs) que proporciona servicios de registro de Internet y coordinación de recursos de Internet para Europa, Oriente Medio y partes de Asia Central.
RIPE NCC opera el Routing Information Service (RIS) @RIPE-RIS, una plataforma de recopilación de datos de enrutamiento, que tiene como objetivo mejorar la comprensión y visibilidad del sistema global de enrutamiento de Internet.

Al igual que RouteViews, RIS recopila datos a través de un conjunto de más de 26 colectores (ANEXO) remotos de rutas (RRCs) distribuidos globalmente, generalmente ubicados en Puntos de Intercambio de Internet (IXPs).  Voluntarios se conectan con los RRCs mediante BGP, y RIS almacena los mensajes que recibe de estos peering.

Para acceder a los datos, existen dos formas: directamente a través de archivos en formato MRT, RIS Live y RISwhois, o mediante herramientas que utilizan los datos de RIS, como RIPEstat, donde se puede encontrar información ya organizada, como la exploración del enrutamiento por país y la localización de información de contacto sobre abusos.


== The peering DB

PeeringDB (@PeeringDB) es una base de datos pública y de acceso libre, gestionada y promovida por voluntarios. Su objetivo principal es facilitar la interconexión entre redes, proporcionando información detallada sobre operadores de red, proveedores de tránsito, centros de datos y Puntos de Intercambio de Internet (IXPs). Gracias a su contenido, es una fuente valiosa para la comunidad de Internet y para investigaciones relacionadas con el enrutamiento y la interconexión de redes. 

PeeringDB contiene una amplia variedad de información, incluyendo los números de Sistema Autónomo (ASN), las políticas de peering, las ubicaciones de redes y los detalles de los IXPs, como la cantidad de participantes y las entidades que los operan. 





// == Otroas Gerramientas
// TODO: Ver si quiero agregar mas a esta sección
// === Hurricane Electric Internet Services

// // == Hurricane BGP Toolkit
// // El Hurricane Electric BGP Toolkit es un conjunto de herramientas en línea desarrollado por Hurricane Electric, diseñado para analizar y monitorear datos de BGP.
// // https://bgp.he.net/

// // == Hurricane BGP Toolkit
// // El Hurricane Electric BGP Toolkit es un conjunto de herramientas en línea desarrollado por Hurricane Electric, diseñado para analizar y monitorear datos de BGP.
// // https://bgp.he.net/


// === Servidores Looking glass
// === BGGPView



// // https://bgpview.io/




// // === Formato MRT

// // - Multi-threaded Routing Toolkit (MRT)

// Muchos de los archivos de RouteViews y RIS estan en formato MRT. Para extraer los Paths se necesita parsearlos.

// Otra forma de obtener es ????? es a traes del formato MRT. Este formato fue desarrollado en conjunto con el Multi-threaded Routing Toolkit (MRT) de donde toma su nombre. El formato puede ser usado para exportar mensajes de protocolos de ruteo, cambios de estado y contenido de la base de datos de ruteo.


// Para pasar archivos en formato MRT a archivos CSV  https://github.com/YoshiyukiYamauchi/mrtparse

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










