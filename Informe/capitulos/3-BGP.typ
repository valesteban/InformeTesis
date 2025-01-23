= Border Gateway protocol (BGP)
-  The primary function of a BGP speaking system is to exchange network reachability information with other BGP systems.
- BGP uses TCP [RFC793] as its transport protocol. (No hay necesidad de implementar fragmentadcion, ack, retransmission, etc)
- BGP listens on TCP port 179. 
- A TCP connection is formed between two systems.  They exchange   messages to open and confirm the connection parameters.
- The initial data flow is the portion of the BGP routing table that is
   allowed by the export policy, called the Adj-Ribs-Out (see 3.2).
   Incremental updates are sent as the routing tables change. 
- EEPALIVE messages may be sent periodically to ensure that the
   connection is live.  NOTIFICATION messages are sent in response to
   errors or special conditions.
- NOTIFICATION message is sent and the connection is
   closed.

- si s edesconecta Close connection se borran las Ribs



Un Sistema Autonomo es un "Conjunto de routers bajo una sola administración técnica" [RFC1771].
Estos a traves de sesiones BGP intercambian rutas conocidas como AS Paths.
Utilizando estas rutas podemos mapear la topología de Internet.
 Sin embargo BGP utiliza la "mejor" ruta entre ASNs, a pesar de que pueden haber más de una ruta entre dos ASes. Para este prblema se usan multiples views (viewpoints) Aun asi no se tiene una topología completa.



Border Gateway Protocol is an inter-autonomous system routing    protocol designed for TCP/IP Internets.@RFC-BGP


- tipo: Path Vector
- Puerto: TCP 179


- RFC 4271 
- The initial data flow is the portion of the BGP routing table that is allowed by the export policy, called the Adj-RIB-Out.

- Incremental updates are sent as the routing table changes.

- KEEPALIVE messages must be sent periodically to ensure that the connection is still alive.

- NOTIFICATION messages are sent in response to error or special conditions.(if connection encounters an error conditions or NOTIFICATION message is sent and the connection is closed)

- El tamaño minimo de un mensaje BGP  consiste en 19 octetos , correspondiete unicamente 
al header del mensaje. y el tamaño maximo es de 4096 octetos.



== Routing Information Base (RIB)

Consta de tres partes:

- Adj-RIB-In:
- Loc-RIB:
- Adj-RIB-Out:
Es un  modelo conceptual esta separacion, no significa que s edeba teenr 3 copias separadas de cada uno.
Routing table es la routing info del BGP speacker que ocupa para hacer el forwarding (¿Es lo mismo que el Loc-RIB?)





== Header
Consiste en 
== OPEN message

Luego de establecida la conexion BGP, el primer mensaje que se envia por ambos lados de la conexión es un mensaje OPEN.
Si es aceptado el mensaje OPEN, se envia un mensaje KEEPALIVE confirmando la conexión.

El mensaje OPEN tiene un tamaño mino de 29 octetos incluido el header, además de un header contiene los siguientes campos:

- *Version:* Indica la versión del prtocolo BGP.
- *My Autonomous System:* Indica el número del sistema autónomo del emisor.
- *Hold Tiem:* Indica el número de segundos que propone el emisor para el valor del Hold Timer. Este valor indicates el numero maximo de segundos que puede pasar entre la recepción de un mensaje KEEPALIVE y/o UPDATE del emisor.
- *BGP Identifier:* Identificador BGP del emisor.
- *Optional Parameters Length:* Indica el largo de los parametros opcionales. Si este valor es 0, no hay parametros opcionales.
- *Optional Parameters:* Contiene una lista de los parametros opcionales.

== UPDATE message

- The minimum length of the UPDATE message is 23 octets -- 19 octets Header + 2 octets for the Withdrawn Routes Length + 2 octets for the Total Path Attribute Length 
// - Menazje update 

//    UPDATE messages are used to transfer routing information between BGP
//    peers.  The information in the UPDATE message can be used to
//    construct a graph that describes the relationships of the various
//    Autonomous Systems.  By applying rules to be discussed, routing


//    information loops and some other anomalies may be detected and
//    removed from inter-AS routing.

//    An UPDATE message is used to advertise feasible routes that share
//    common path attributes to a peer, or to withdraw multiple unfeasible
//    routes from service (see 3.1).  An UPDATE message MAY simultaneously
//    advertise a feasible route and withdraw multiple unfeasible routes
//    from service.  The UPDATE message always includes the fixed-size BGP
//    header, and also includes the other fields, as shown below (note,
//    some of the shown fields may not be present in every UPDATE message):
//     Withdrawn Routes Length:

//          This 2-octets unsigned integer indicates the total length of
//          the Withdrawn Routes field in octets.  Its value allows the
//          length of the Network Layer Reachability Information field to
//          be determined, as specified below.

//          A value of 0 indicates that no routes are being withdrawn from
//          service, and that the WITHDRAWN ROUTES field is not present in
//          this UPDATE message.

//       Withdrawn Routes:

//          This is a variable-length field that contains a list of IP
//          address prefixes for the routes that are being withdrawn from
//          service.  Each IP address prefix is encoded as a 2-tuple of the
//          // form <length, prefix>, whose fields are described below:
// he use and the meaning of these fields are as follows:

//          a) Length:

//             The Length field indicates the length in bits of the IP
//             address prefix.  A length of zero indicates a prefix that
//             matches all IP addresses (with prefix, itself, of zero
//             octets).

//          b) Prefix:

//             The Prefix field contains an IP address prefix, followed by
//             the minimum number of trailing bits needed to make the end
//             of the field fall on an octet boundary.  Note that the value
//             of trailing bits is irrelevant.

//       Total Path Attribute Length:

//          This 2-octet unsigned integer indicates the total length of the
//          Path Attributes field in octets.  Its value allows the length
//          of the Network Layer Reachability field to be determined as
//          specified below.

//          A value of 0 indicates that neither the Network Layer
//          Reachability Information field nor the Path Attribute field is
//          present in this UPDATE message.

//       Path Attributes:

//          A variable-length sequence of path attributes is present in
//          every UPDATE message, except for an UPDATE message that carries
//          only the withdrawn routes.  Each path attribute is a triple
//          // <attribute type, attribute length, attribute value> of variable
//          length.

//          Attribute Type is a two-octet field that consists of the
//          Attribute Flags octet, followed by the Attribute Type Code
//          octet.

//                0                   1
//                0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
//                +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//                |  Attr. Flags  |Attr. Type Code|
//                +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

//          The high-order bit (bit 0) of the Attribute Flags octet is the
//          Optional bit.  It defines whether the attribute is optional (if
//          set to 1) or well-known (if set to 0).



// Rekhter, et al.             Standards Track                    [Page 16]


// RFC 4271                         BGP-4                      January 2006


//          The second high-order bit (bit 1) of the Attribute Flags octet
//          is the Transitive bit.  It defines whether an optional
//          attribute is transitive (if set to 1) or non-transitive (if set
//          to 0).

//          For well-known attributes, the Transitive bit MUST be set to 1.
//          (See Section 5 for a discussion of transitive attributes.)

//          The third high-order bit (bit 2) of the Attribute Flags octet
//          is the Partial bit.  It defines whether the information
//          contained in the optional transitive attribute is partial (if
//          set to 1) or complete (if set to 0).  For well-known attributes
//          and for optional non-transitive attributes, the Partial bit
//          MUST be set to 0.

//          The fourth high-order bit (bit 3) of the Attribute Flags octet
//          is the Extended Length bit.  It defines whether the Attribute
//          Length is one octet (if set to 0) or two octets (if set to 1).

//          The lower-order four bits of the Attribute Flags octet are
//          unused.  They MUST be zero when sent and MUST be ignored when
//          received.

//          The Attribute Type Code octet contains the Attribute Type Code.
//          Currently defined Attribute Type Codes are discussed in Section
//          5.

//          If the Extended Length bit of the Attribute Flags octet is set
//          to 0, the third octet of the Path Attribute contains the length
//          of the attribute data in octets.

//          If the Extended Length bit of the Attribute Flags octet is set
//          to 1, the third and fourth octets of the path attribute contain
//          the length of the attribute data in octets.

















// Rekhter, et al.             Standards Track                    [Page 17]


// RFC 4271                         BGP-4                      January 2006


//          The remaining octets of the Path Attribute represent the
//          attribute value and are interpreted according to the Attribute
//          Flags and the Attribute Type Code.  The supported Attribute
//          Type Codes, and their attribute values and uses are as follows:

//          a) ORIGIN (Type Code 1):

//             ORIGIN is a well-known mandatory attribute that defines the
//             origin of the path information.  The data octet can assume
//             the following values:

//                Value      Meaning

//                0         IGP - Network Layer Reachability Information
//                             is interior to the originating AS

//                1         EGP - Network Layer Reachability Information
//                             learned via the EGP protocol [RFC904]

//                2         INCOMPLETE - Network Layer Reachability
//                             Information learned by some other means

//             Usage of this attribute is defined in 5.1.1.

//          b) AS_PATH (Type Code 2):

//             AS_PATH is a well-known mandatory attribute that is composed
//             of a sequence of AS path segments.  Each AS path segment is
//             // represented by a triple <path segment type, path segment
//             length, path segment value>.

//             The path segment type is a 1-octet length field with the
//             following values defined:

//                Value      Segment Type

//                1         AS_SET: unordered set of ASes a route in the
//                             UPDATE message has traversed

//                2         AS_SEQUENCE: ordered set of ASes a route in
//                             the UPDATE message has traversed

//             The path segment length is a 1-octet length field,
//             containing the number of ASes (not the number of octets) in
//             the path segment value field.

//             The path segment value field contains one or more AS
//             numbers, each encoded as a 2-octet length field.



// Rekhter, et al.             Standards Track                    [Page 18]


// RFC 4271                         BGP-4                      January 2006


//             Usage of this attribute is defined in 5.1.2.

//          c) NEXT_HOP (Type Code 3):

//             This is a well-known mandatory attribute that defines the
//             (unicast) IP address of the router that SHOULD be used as
//             the next hop to the destinations listed in the Network Layer
//             Reachability Information field of the UPDATE message.

//             Usage of this attribute is defined in 5.1.3.

//          d) MULTI_EXIT_DISC (Type Code 4):

//             This is an optional non-transitive attribute that is a
//             four-octet unsigned integer.  The value of this attribute
//             MAY be used by a BGP speaker's Decision Process to
//             discriminate among multiple entry points to a neighboring
//             autonomous system.

//             Usage of this attribute is defined in 5.1.4.

//          e) LOCAL_PREF (Type Code 5):

//             LOCAL_PREF is a well-known attribute that is a four-octet
//             unsigned integer.  A BGP speaker uses it to inform its other
//             internal peers of the advertising speaker's degree of
//             preference for an advertised route.

//             Usage of this attribute is defined in 5.1.5.

//          f) ATOMIC_AGGREGATE (Type Code 6)

//             ATOMIC_AGGREGATE is a well-known discretionary attribute of
//             length 0.

//             Usage of this attribute is defined in 5.1.6.

//          g) AGGREGATOR (Type Code 7)

//             AGGREGATOR is an optional transitive attribute of length 6.
//             The attribute contains the last AS number that formed the
//             aggregate route (encoded as 2 octets), followed by the IP
//             address of the BGP speaker that formed the aggregate route
//             (encoded as 4 octets).  This SHOULD be the same address as
//             the one used for the BGP Identifier of the speaker.

//             Usage of this attribute is defined in 5.1.7.




// Rekhter, et al.             Standards Track                    [Page 19]


// RFC 4271                         BGP-4                      January 2006


//       Network Layer Reachability Information:

//          This variable length field contains a list of IP address
//          prefixes.  The length, in octets, of the Network Layer
//          Reachability Information is not encoded explicitly, but can be
//          calculated as:

//                UPDATE message Length - 23 - Total Path Attributes Length
//                - Withdrawn Routes Length

//          where UPDATE message Length is the value encoded in the fixed-
//          size BGP header, Total Path Attribute Length, and Withdrawn
//          Routes Length are the values encoded in the variable part of
//          the UPDATE message, and 23 is a combined length of the fixed-
//          size BGP header, the Total Path Attribute Length field, and the
//          Withdrawn Routes Length field.

//          Reachability information is encoded as one or more 2-tuples of
//          // the form <length, prefix>, whose fields are described below:

//                   +---------------------------+
//                   |   Length (1 octet)        |
//                   +---------------------------+
//                   |   Prefix (variable)       |
//                   +---------------------------+

//          The use and the meaning of these fields are as follows:

//          a) Length:

//             The Length field indicates the length in bits of the IP
//             address prefix.  A length of zero indicates a prefix that
//             matches all IP addresses (with prefix, itself, of zero
//             octets).

//          b) Prefix:

//             The Prefix field contains an IP address prefix, followed by
//             enough trailing bits to make the end of the field fall on an
//             octet boundary.  Note that the value of the trailing bits is
//             irrelevant.

//    The minimum length of the UPDATE message is 23 octets -- 19 octets
//    for the fixed header + 2 octets for the Withdrawn Routes Length + 2
//    octets for the Total Path Attribute Length (the value of Withdrawn
//    Routes Length is 0 and the value of Total Path Attribute Length is
//    0).




// Rekhter, et al.             Standards Track                    [Page 20]


// RFC 4271                         BGP-4                      January 2006


//    An UPDATE message can advertise, at most, one set of path attributes,
//    but multiple destinations, provided that the destinations share these
//    attributes.  All path attributes contained in a given UPDATE message
//    apply to all destinations carried in the NLRI field of the UPDATE
//    message.


//    An UPDATE message can list multiple routes that are to be withdrawn
//    from service.  Each such route is identified by its destination
//    (expressed as an IP prefix), which unambiguously identifies the route
//    in the context of the BGP speaker - BGP speaker connection to which
//    it has been previously advertised.


//    An UPDATE message might advertise only routes that are to be
//    withdrawn from service, in which case the message will not include
//    path attributes or Network Layer Reachability Information.
//    Conversely, it may advertise only a feasible route, in which case the
//    WITHDRAWN ROUTES field need not be present.

//    An UPDATE message SHOULD NOT include the same address prefix in the
//    WITHDRAWN ROUTES and Network Layer Reachability Information fields.
//    However, a BGP speaker MUST be able to process UPDATE messages in
//    this form.  A BGP speaker SHOULD treat an UPDATE message of this form
//    as though the WITHDRAWN ROUTES do not contain the address prefix.

== KEEPALIVE message

- BGP does not use any TCP-based, keep-alive mechanism to determine if peers are reachable. En cambio
los BGP speakers intercambian continuamente mensajes KEEPALIVE de tal forma que  no expire el hold time.
- Un timepo razonable entre mensajes KEEPALIVE es un tercio del hold time interval.
- No deben ser enviados con una frecuencia mayor a un mensaje por segundo.
- Un mensaje KEEPALIVE consiste en unicamnete el header del mensaje y por lo tanto tiene un tamaño de 19 octetos.



== NOTIFICATION message

- Un mensje NOTIFICATION es enviado cuando un error es detectado.
- La conexión es cerrada inmediatamente despues de ser enviado el mensaje.















//    In addition to the fixed-size BGP header, the NOTIFICATION message
//    contains the following fields:

//       0                   1                   2                   3
//       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
//       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//       | Error code    | Error subcode |   Data (variable)             |
//       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

//       Error Code:

//          This 1-octet unsigned integer indicates the type of
//          NOTIFICATION.  The following Error Codes have been defined:

//             Error Code       Symbolic Name               Reference

//               1         Message Header Error             Section 6.1

//               2         OPEN Message Error               Section 6.2

//               3         UPDATE Message Error             Section 6.3

//               4         Hold Timer Expired               Section 6.5

//               5         Finite State Machine Error       Section 6.6

//               6         Cease                            Section 6.7

//       Error subcode:

//          This 1-octet unsigned integer provides more specific
//          information about the nature of the reported error.  Each Error
//          Code may have one or more Error Subcodes associated with it.
//          If no appropriate Error Subcode is defined, then a zero
//          (Unspecific) value is used for the Error Subcode field.

//       Message Header Error subcodes:

//                1 - Connection Not Synchronized.
//                2 - Bad Message Length.
//                3 - Bad Message Type.










// Rekhter, et al.             Standards Track                    [Page 22]


// RFC 4271                         BGP-4                      January 2006


//       OPEN Message Error subcodes:

//                1 - Unsupported Version Number.
//                2 - Bad Peer AS.
//                3 - Bad BGP Identifier.
//                4 - Unsupported Optional Parameter.
//                5 - [Deprecated - see Appendix A].
//                6 - Unacceptable Hold Time.

//       UPDATE Message Error subcodes:

//                1 - Malformed Attribute List.
//                2 - Unrecognized Well-known Attribute.
//                3 - Missing Well-known Attribute.
//                4 - Attribute Flags Error.
//                5 - Attribute Length Error.
//                6 - Invalid ORIGIN Attribute.
//                7 - [Deprecated - see Appendix A].
//                8 - Invalid NEXT_HOP Attribute.
//                9 - Optional Attribute Error.
//               10 - Invalid Network Field.
//               11 - Malformed AS_PATH.

//       Data:

//          This variable-length field is used to diagnose the reason for
//          the NOTIFICATION.  The contents of the Data field depend upon
//          the Error Code and Error Subcode.  See Section 6 for more
//          details.

//          Note that the length of the Data field can be determined from
//          the message Length field by the formula:

//                   Message Length = 21 + Data Length

//    The minimum length of the NOTIFICATION message is 21 octets
//    (including message header).

== BGP Communities
Es un atributo, tag o label  

@RFC-BGP-Communities-Attribute


LINKS

- Como funciona BGP, muy buena explicacion: https://blog.cloudflare.com/es-es/prepends-considered-harmful/