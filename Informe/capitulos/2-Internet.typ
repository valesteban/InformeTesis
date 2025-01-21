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


