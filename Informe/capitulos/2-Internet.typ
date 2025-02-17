= Infrestructura de Internet 

El Internet es una red global de redes que interconecta miles de millones de dispositivos en todo el mundo que proporciona servicios a aplicaciones distribuidas @Computer-Networking. Entre estos dispositivos se encuentran computadoras, teléfonos celulares, servidores de contenido y muchos otros.

Cuando un dispositivo final intenta establecer una conexión a traves de Internet, los datos a enviar son encapsulados en paquetes con cabeceras que contienen la información necesaria para llegar a traves de Internet al dispositivo final.
En algunos casos los datos puedes ser separados en diferentes paquetes y ser enviados por diferentes rutas hasta llegar al dispositivo final, donde son reensamblados. 
El recorrido que sigue un paquete desde su origen hasta su destino a través de distintos routers se conoce como ruta. 

Los sistemas finales acceden a Internet por medio de provedores de Internet (ISPs), los cuales a su vez son una red conformada por routers y enlaces de comunicacion.  
Estos ISPs de nivel inferior se conectan a ISPs de nivel superior,nacionales e internacionales como Level 3, Cogent, entre otros @ASRank-web, que se encuentran en la cima de la jerarquía de Internet, al tener conexiones directas con el "backbone" de Internet.
Asi estós proporcionan a los usuarios finales el acceso a provedores de contenidos (CDN por sus siglas en ingles), sitios web y otros servicios, los cuales también estan conectados a la infrestructura de Internet

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


== Sistemas Autonomos 

En la estructura de Internet un Sistema Autonomo (AS) consiste en un conjunto routers y enlaces de comunicación que comparten una política de enrutamiento común. Estos son operados de forma independiente por una organización, como un ISP, una universidad, una empresa, entre otros.

Los AS utilizan el protocolo BGP, para intercambiar información de enrutamiento y así tener una conexión global entre ASes y por ende del Internet. Las conexiones entre los Ases pueden ser de cliente-proveedor o de peer-to-peer, pero están influenciadas por acuerdos comerciales. Bajo estos acuerdos, podemos crear un grafo de la infrestructura de Internet, donde los nodos son los ASes y las aristas son las conexiones entre ellos. Cabe destacar en este caso conexión no implica necesariamente que haya un intercambio de trafico entre los ASes conectados, ya que el enrutamiento está controlado por BGP, un protocolo de enrutamiento basado en politicas (reachability)@InferringASRelatioships2001.

Los AS se identifican con un número de Sistema Autonomo (ASN) de 16 bits y controlan un conjunto de direcciones IP.
Esta asignación es llevada a cabo por los Registros _Regional Internet Registry_ (RIRs), quienes reciben bloques de IPs por la _Internet Assigned Numbers Authority_ (IANA) y los distribuyen a los _Local Internet Registries_ (LIR) y usuarios finales.

Los ISP, quienes puedes estar conformados por uno o varios Sistemas Autonomos, se dividen comunmente en tres niveles de jerarquía. El Tier-1, donde se encuentran los AS que conformaan el "backbone" de Internet, estos intercambian paquetes entre si sin un costo asociado.Los Tier-2 son generalmente operadores nacionales que compran tránsito a los Tier-1 y venden tránsito a los Tier-3. Finalmente los Tier-3 son los operadores locales que pagan por el tránsito para proporcionar acceso a Internet a los usuarios finales @InterconnectionPeeringSettlements. Tambien Luckie et al. @ASRank analizó los AS y propuso una métrica para indicar que tan global es un AS, donde si el customer cone es mayor o igual a 200 se considera Tier, si es mayor a 2000 se considera Tier 2 y si es menor a 200 se considera Tier 3.

Una ultima separación que se puede hacerentre AS es segun sus conexiones a otros Sistemas Autonomos, en
single-homed y multi-homed. Los AS single-homed tienen solo una conexión a otro AS, mientras que un multi-homed tiene conexiones a más de un AS.



== Internet Exchange Points

Los _Internet Exchange Points_ (IXPs) son puntos de interconexión donde múltiples AS pueden establecer relaciones de peering @Computer-Networking.

Un IXP consiste generalmente en un switch de alta velocidad y capacidad que conecta routers de diferentes AS, permitiendo el intercambiodirecto de tráfico sin necesidad de atravesar por redes intermedias. Mejorando asi el intercambio de tráfico haciendolo más eficiente y de bajo costo.

Las relaciones de tráfico en un IXP seestablecen mediante el protocolo BGP, por ende a pesar que los AS esten fisicaamente conectados a tarves del IXP, no se establecen un relación a no ser que se configure explicitamente.

Al igual que los AS, los IXPs tienen un ASN. Sin embargo, de forma generalizada, este ASN se extrae de los AS PATH en BGP. Algunos IXP lo mantienen visible como metodo de debbuging @InferringASRelatioships2001. 


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




== Ruteo 

El ruteo es el proceso mediante el cual se selecciona el camino que seguirá un paquete dentro de una red para llegar a su destino mediante la mejor ruta. La comunicación entre dos dispositivos de la red puede establecerse mediante diferentes rutas, lo que permite conectar dispositivos de red sin una conexión directa a través de dispositivos intermedios.

Un enrutador o router es un dispositivo de red encargado de seleccionar las rutas que seguirán los datos enviados a traves de la red.
El camino que sigue un paquete se elige según la información de las tablas de enrutamiento (RIBs) de los routers y en la información contenida en los encabezados de los paquetes, donde se indica el destino final.
Cuando llega un paquete a un router, se consulta en la tabla de enrutamiento la dirección final para obtener el proximo router o punto de red al cual se debe dirigir el paquete. Cuando un paquete llega a un router, este consulta su tabla de enrutamiento para determinar el siguiente salto, es decir, el próximo router o punto de red al que debe enviarlo.

Por ejemplo, cuando un usuario accede a una página web desde su hogar, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final, consulta su tabla de enrutamiento y lo reenvia al siguiente punto de la red. Este nuevo router intermedio repite el proceso hasta que el paquete alcanza su destino final.

Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración.
Por otro lado, en el enrutamiento dinámico, los routers se encargan de ir actualizando las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.

También se pueden clasificar los protocolos de enrutamiento en dos categorías: ruteo interno y ruteo externo.
El ruteo Interno se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. Algunos d elos protocolos son:

- *OSPF (Open Shortest Path First):* Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos @RFC-OSPF.
- *RIP (Routing Information Protocol):* Utiliza un enfoque de vector de distancia para calcular la ruta más optima, basándose en la cantidad de saltos @RFC-RIP.

El ruteo externo se centra en la gestión de rutas entre los Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo. Algunos protocolos de enrutamiento externos son:

- *BGP (Border Gateway Protocol):* Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente @RFC-BGP.
- *IS-IS (Intermediate System to Intermediate System):* Protocolo deenrutamiento de estado de enlace, similar a OSPF @IS-IS.




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
