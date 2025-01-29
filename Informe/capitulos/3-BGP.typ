= Border Gateway protocol (BGP)

Es un Inter-Autoonomous Sistem protocolo de ruteo, el cual tiene como principal funcion el intercambio de de network reachability entre otros sistemas BGP.

Dicho protocolo usa TCP [RFC793] como su protocolo de transport, por lo que no tiene necesidad de preocuparse de la implementacion en casos de fragemnyacion de paquetes, ACK, retransmision ,etc.
//TODO: Explicar como funciona que es incremental corto porque despues sale maś detallado.
EL protocolo BGP ocupa el puerto 179 TCP y es un protoclo del tipo: Path Vector, loq ue quiere decir que  ....


*Resumen del funcionaqmiento de BGP:*

Una ves que la coneccino TCP es estblecida entre los pares, estos intercambian mensajes OPEN para confirmar los paraemtros de connecion para el correcto funcionamiento de BGP. Luego se envia un mensaje KEEPALIVE para confirmar la coneccion.
Luego la información que se envia consiste en una porcion de la BGP routing tablel que es permitida por las politicas de exportaciond eruteo , llamada la Adj-RIB-Out. A medida que la tabla de ruteo va cambiando se envian actualizaciones incrementales a traves de mensajes UPDATE o mensaje KEEPALIVE para asegurar que la xonexion entre ambos extremso sigue viva. En caso de algun errore se envian mensaje NOTIFICATION que indica el tipo de error que se encontro y luego de enviado este la conexión es cerrada, ene ste caso todas la rutas guardads de BGP son borradas.

Un mensaje BGP es procesado una vez que es completamente recibido, su tmañp maximo  y minimo son de 4096 y 19 octetos respectivamente, este ultimo corresponde unicaamente al HEADER de un mensaje BGP.
El tamaño minimo de un mensaje BGP es de 19 octetos correspondiente unicamente al HEADER de un mensaje, existen 4 tipos de mensajes en BGP: OPEN, UPDATE, KEEPALIVE y NOTIFICATION El tamaño minimo de un mensaje BGP es de 19 octetos correspondiente unicamente al HEADER de un mensaje

*Mensaje OPEN*

Luego de establecida la conexión TCP entre los pares BGP, el primer mensaje que se envia en un OPEN con el cual ambso lados confirman los parametros de la conexión.
Aqui se indica la versio de BGP que se esta usando, el AS del emisor, el hold time, el BGP identifier y los parametros opcionales.
EL hold time corresponde al tiempo maximo que puede pasar entre la recepcion de un mensaje KEEPALIVE y/o UPDATE del emisor antes de que la conexión sea cerrada.

*Mensaje UPDATE*

Este mensaje es usado para transferir la información de ruteo entre los pares BGP. En este se anuncian las nuevas rutas y withdraws de rutas que ya no son validas. Aqui se incluyen los path attributes  los cuales entregan onformación sobre las rutas que se estan anunciando, alguns ejemplos de estos son: ORIGIN, AS_PATH, NEXT_HOP, MULTI_EXIT_DISC, LOCAL_PREF, ATOMIC_AGGREGATE, AGGREGATOR.
//FIXME: Ver si poner más informacion

*Mensaje KEEPALIVE*

El intercambio de mensajes KEEPALIVE dentro del protocolo BGP es usado para cnfirmar   ue la conexion entre ambos pares continua viva, de tal forma que no expire el hold time.El mensaje KEEPALIVE consiste unicamente el HEADER del mensaje, donde se infdica que este mensaje BGP  corresponde a un KEEP alive por medio del campo _type_ el cual corrsponde al valor 2 y por lo tanto tiene un tamaño de 19 octetos.

*Mensaje NOTIFICATION*

Este tipo de mensaje es enviado cuando algun error es detectado y luego de ser enviado este mensaje , la conexión es cerrada. El mensaje contiene un codigo de error y un subcodigo de error, los cuales indican en que que tipo de mensaje se encontro el error y que tipo de error fue. Ademas de esto el mensaje contiene un campo de datos el cual entrega mas informacion sobre el error encontrado.

//FIXME: Ver si incluyo State machien BGP

== Routing Information Base (RIB)

Cuando se usa BGP, los routers BGP reciben mensaje UPDATE de sus vecinos BGP, los cuales son analiados y filtrados basandose en las policias que tenga es AS, ára leso ser anunciada a sus otros vecinos. Para esto BGP usa una base de datos llamada Routing Information Base (RIB),esta consta de tres partes:

- *Adj-RIB-In:* Guarda  la routing information de los mensaje UPDATES recibidos de sus peers BGP. store unprocessed routing info  leaprendida de BGP updates recibida se sus peers. 
- *Loc-RIB:* Contiene las rutas que el BGP router selecciona luego de aplicar sus policias locales (proceso de desición) a la información de la _Adj-RIB-in_.
- *Adj-RIB-Out:* Almacena la información que el BGP router selecciona para ser anunciada/Advertised a sus pares BGP. Es la informacipon que se incluye en los mensaje UPDATE.

El flujo de información en BGP es el siguiente: Se recibe la información de los mensjaes UPDATE de sus vecinos, se guarda en la _Adj-RIB-In_, uno por cada peer. Luego la data es analizada y las porciones adecuadas se seleccionan para actualizar la _Loc-RIB_. Finalmente la indormación de la Loc-RIBse escribe en _Adj-RIB-Out_ para ser enviada a los vecinos BGP. Este flujo se conoce como el proceso de desicion BGP.
//FIXME: Revisar esto del RFC sección 9, Esta información se saco 100% de las slides de BGP del ramo de Redes

Sin embargo no todas las rutas del _Loc-RIB_ son agregadas a la tabla de enrutamiento la cual consiste en la informacion que el router ocupa para hacer el forwarding de paquetes, estan deben cubrir ciertos criterios que estan dadso por el software/vendor del router.


La importancia de esta iinformación radica en que la mayoria de los metodos de inferencia de relaciones entre ASes ocupan la información de las RIBs como input de los metodos.

// FIXME: Ver si agregar o no el proceso de desición de BGP


¿Cómo es la propagación de las BGP Routes?



¿Cómo seecciona las rutas BGP?











// == BGP Communities
// Es un atributo, tag o label  

// @RFC-BGP-Communities-Attribute


// LINKS

// - Como funciona BGP, muy buena explicacion: https://blog.cloudflare.com/es-es/prepends-considered-harmful/