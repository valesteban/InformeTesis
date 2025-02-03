= Border Gateway protocol (BGP)

Como se mencionó en la sección anterior, BGP @RFC-BGP es un protocolo de enrutamiento utilizado para intercambiar información de rutas entre Sistemas Autónomos en Internet. El cual utiliza TCP @RFC793-TCP como su protocolo de transporte, lo que significa que no necesita preocuparse por la fragmentación de paquetes, la confirmación de recepción (ACK), la retransmisión de datos, entre otros aspectos de confiabilidad.

Como sabemos el Internet esta formado por miles de redes privadas, públicas, corporativas y gubernamentales que están interconectadas mediante protocolos estandarizados entre sí. BGP se encarga de analizar todas la posibles rutas a los diferentes destinos y seleccionar la mejor ruta. 

A medida que un paquete viaja por las diferentes redes de Internet, cada Sistema Autonomos decide el siguiente salto por el cual se enviara un el mensaje. Esta desición se toma en base a la información de ruteo recolectada por en intercambio de mensaje BGP.


Por ejemplo, cuando un usuario en Chile carga una página web con servidores en Argentina, BGP permite que la comunicación se establezca ya que asegura que los paquetes sigan la mejor ruta disponible a través de múltiples redes interconectadas.

== Funcionaqmiento de BGP

Una vez que la conexión TCP se ha establecido entre los pares BGP, estos intercambian mensajes _OPEN_ para confirmar los parámetros de la sesión. Luego, envían un mensajes _KEEPALIVE_ para confirmar la conexión.

La infomración que se intercambia en primera instancia consiste en una porción de la tabla de entrutamiento de BGP, llamada _Adj-RIB-Out_, la cual está filtrada de acuerdo a las politicas locales de exportación hacia los diferentes AS. a medida que esta tabla va cambiando en envian actualizaciones incrementales mediando mensajes _UPDATE_. 
Además, para asegurar la conexión sigue activa, los pares BGP intercambian cada cierto tiempo mensajes _KEEPALIVE_.

En caso de que se detecte algun tipo de error durante la conexión, se envia un mensaje _NOTIFICATION_ el cual indica el tipo de error. Tras su envio la conexipon BGP se cierra y todas las rutas aprendidas en la sesión son eliminadas.


Los mensajes BGP solo son procesados una vez que han sido completamente recibidos. Su tamaño mínimo es de 19 octetos, correspondiente al _HEADER_, mientras que el tamaño máximo es de 4096 octetos. Existen 4 tipos de mensajes en BGP: _OPEN_, _UPDATE_, _KEEPALIVE_ y _NOTIFICATION_.


A continuación la figura @FuncionamientoBGP muestra un ejemplo de como BGP propaga la información de ruteo a través de los diferentes AS. quienes repiten el proceso de anunciar la dirección de destino a sus pares modificando la informacipon de AS PATH y asi sucesivamente hasta qie la información llega al AS 64501, el cual gracias a la informacion acumula podra sabra como llegar a la red del AS 64503 y podrá eleir entre los dos posibles rutas que tiene almacenda dentro de sus rutas .



La figura @FuncionamientoBGP muestra cómo BGP propaga la información de ruteo entre distintos AS. Cada sistema autónomo anuncia la dirección de destino a sus pares, en este caso especifico el AS 64503 anuncia su dirección a sus pares 64502 y 64504, quienes a su vez anuncian la dirección a sus pares, modificando el _AS_PATH_ a medida que la información se propaga. Finalmente, el AS 64501 recibe estos anuncios y, basándose en la información acumulada, determinar la mejor ruta para alcanzar la red del AS 64503.

#figure(
  image("../imagenes/BGPFuncionamiento.png", width: 50%),
  caption: [Ejemplo de propagación de anuncion. En este caso AS 6453 comienza anunciando su dirección a sus pares.],
) <FuncionamientoBGP>








*Mensaje OPEN*

Luego de establecida la conexión TCP entre los pares BGP, el primer mensaje que se envia en un mensaje _OPEN_ ,mediante el cual ambos lados confirman los parámetros de la conexión.

En este mensaje se especifica la versión de BGP ha utilizar, el número de Sistema Autónomo (AS) del emisor, el Hold Time, el BGP identifier y los parámetros opcionales.

El Hold Time define el tiempo máximo que puede pasar sin recibir un mensaje _KEEPALIVE_ o _UPDATE_  una sesión antes de que la conexión sea cerrada.


*Mensaje UPDATE*

Se utiliza para transferir informaciónde enrutamiento entre los pares BGP. A través de este mensaje se anuncian nuevas rutas y se notifican los withdraws de aquellas que ya no son válidas.

Además, estos mensajes incluyen path atributes, los cuales proporcionn información sobre las rutas que se están anunciando para que luego cada AS pueda decidir la mejor ruta a los ddifernetes destinos. Algunos ejemplos de estos atributos son ORIGIN, _AS_PATH_, _NEXT_HOP_, _MULTI_EXIT_DISC_, _LOCAL_PREF_, _ATOMIC_AGGREGATE_ y _AGGREGATOR_.


*Mensaje KEEPALIVE*

El intercambio de mensajes _KEEPALIVE_ dentro del protocolo BGP se utiliza para confirmar que la conexión entre ambos pares sigue activa, evitando que el hold time expire.

Este mensaje consta unicamente del _HEADER_ de un mensaje BGP, donde se indica que corresponde a un _KEEPALIVE_ por medio del campo _type_, cuyo valor es 2el cual corrsponde al valor 2. Dicho mensaje tiene un tamaño de 19 octetos.


*Mensaje NOTIFICATION*


El mensaje _NOTIFICATION_ se envía cuando se detecta un error en la comunicación BGP. Una vez enviado, la conexión es cerrada.

Este mensaje incluye un código de error y un subcódigo de error, los cuales indican en qué tipo de mensaje se produjo el error y la zona  específica del problema. Además, contiene un campo de datos que proporciona información adicional sobre el error detectado.


== BGP Routing Information Base (RIB)

Cuando se utiliza BGP, los routers BGP reciben mensajes _UPDATE_ de sus vecinos, los cuales son analizados y filtrados según las políticas locales de ruteo del AS, para luego las rutas seleccionadas ser anunciados a sus vecinos. Para esto BGP utiliza una base de datos denominada Routing Information Base (RIB), que se compone de tres partes:


- *Adj-RIB-In:* Almacena la información de ruteo de los mensajes UPDATE recibidos de los vecinos BGP. 

- *Loc-RIB:* Contiene la infomración de ruteo local, es decir las mejores rutas seleccionadas para cada dirección.

- *Adj-RIB-Out:* Guarda la información selecionada por router para ser anunciada a sus pares. Consiste en la información de Loc_RIBs luego de ser aplicadas las politicas internas de ruteo. Esta es la información que se incluye en los mensajes UPDATE.

El flujo de información en BGP y el proceso de toma de decisiones de rutas se realiza de la siguiente manera:
primero, se reciben los mensajes UPDATE de los vecinos, los cuales se almacenan en la Adj-RIB-In, una entrada por cada vecino. Luego, se evalúa el grado de preferencia de cada ruta almacenada en la Adj-RIB-In. Con base en esta evaluación, se seleccionan las mejores rutas para cada destino y se instalan en la Loc-RIB. Finalmente, la información contenida en la Loc-RIB se transfiere a la Adj-RIB-Out para ser anunciada a los vecinos BGP, siguiendo las políticas de ruteo locales. Este flujo de información se conoce como el proceso de decisión BGP.

Es importante destacar que las bases de datos que almacenan la información de rutas BGP no son lo mismo que la tabla de ruteo de un router, que es la que el router utiliza para realizar el forwarding de los paquetes. Las rutas almacenadas en la RIB deben cumplir con ciertos criterios, definidos por el software o el proveedor del router, para ser agregadas a la tabla de ruteo.



// EXTRAS

// The main problem of BGP is the lack of validity and
// verification mechanisms that render it vulnerable to attacks
// such as BGP hijacking or black-holin[C. Zheng, L. Ji, D. Pei, J. Wang, and P. Francis, "A light-weight
// distributed scheme for detecting ip prefix hijacks in real-time", ACM
// SIGCOMM Computer Communication Review, vol. 37, no. 4, p. 277,
// 2007]




== EXTRAS 
// TODO: Agregar en alguna parte
- Export policies:
  - PErmitir/denegar una ruta
  - Asignar multiples exit discriminator
  - Agregar community values
  - Prepending
