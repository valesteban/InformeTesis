= Metodologia


== benchmark
En conjunto a la tarea principal de este trabajo se decidio crear un benchmark con algunos de los algoritmos de inferencia de relaciones comerciales entre Sistemas Autonomos, estos fueron los de GAO @InferringASRelatioships2001, RUAN @computing-observed-autonomous-system-relationships-in-the-internet, problink @ProbLink y bgp2vec @UnveilingtheTypeRelationshipBetweenAutonomousSystemsUsingDeepLearning. Este ultimo siendo un enfoque similar al que se tomo en este trabajo.

El primer paso consistio en la extraccion de als RIBs publicas que se encuentran en diferenstes dataset de internet como lo son las organnizaciones de CAIDA @CAIDA, RIPE RIS @RIPE-RIS y Routeviews @RouteViewsProject. Tanto RIPE como Routeviews mantienen colectores BGP en partes estrategicas de la infrestructura de Internet commo los puntos de intercambio de trafico (IXP) [citar] los cuales se encrgan de recoelsctar las rutas BGP de los diferentes sistemas autonomos que se encuentran conectados a ellos.

Lo que se hizo fue con la libreria BGPStream recolectar las RIBs (Routing informacion Bases, por sus siglas en ingles) de lso colectores de RIPE y Routeviews. 
En unu primer momento se recolectaron las de un dia compelto, sin embargo por razones de espacion y memoria se decidio bajar esto a 12 hrs del dia 1/07/2022 y 2023.



```python
41805|8262|198202
42473|8529|6461|46887|31980
55720|4637|3257|30456|198990
3561|209|3356|9002|50494
13760|6939|19782|1767|19217
```

// TODO: Dejar claro que s esacan y limpian y s edejan de esta forma, no que automaticamente quedan de esta forma.

Los algoritmos fueron sacados de diferentes fuentes, donde fueron previamente implementados en @problinkCode, @BGP2VecCode @AS-ToR-InferenceAlessioMobilia.

Se crearon archivos notebook para cada metodos, lso cuales luegos de extraidas las ribs y conevrtidas a un archvio que las contienen son importadas a los notebooks, luego se corren los metodos de inferencia, se ajsutan los resultados para que todos tengan el formato tipo 


```python
29838|26941|2|2 
46416|34927|1|0 
149478|58752|1|1 
203201|204760|1|2 
```
donde el formato consiste en 

```python
<provider AS>|<customer-AS>|2|<real relationship>
<customer-AS>|<provider AS>|1|<real relationship> 
<peer-AS>|<peer-AS>|0|<real relationship>  
```
Donde en el primer caso algotrimo etiqyeta como 2 a los ASes que consisdero con esa relacion pero `real relationship` consiste en el valor que se tommo como grounfd thriuh en nuestro caso que es AS Rank.


Luego con esta infomrmacion se pudos sacar los siguientes resultados comparando:



TODO: poner graficos y resultados.

TODO: debo poner commo se corren las cosas?

== GNN




Teniamos que crear los embeddings para lso ssitemas autonomos para esto se partio construyendo un grafo (DGL y networkx) a partir de las rutas BGP colectadas los primero 3 dias de Juio del a;o (2022 2023). 

Luego se visualizo y saco informacion de esta.


Esta smsimas son tambien las que se ocuparon como input d elos algoritmos/metodos de inferencia previos presentes en el benchmark.

Ad iferencia de otros metodos como node2vec, Deepwalk, bgp2vec GNN no solo estaria incorporando en estos embeddings la topologia del grafo sino tambien los atributos de cada nodo.

Se tomaron 3 enfooques GNN al momento de crear lso embeddings d elso nodos:

- Encode-Decoder perspective




 En unu primer intante se into recolecctar los path de las RIBS correspondiente  alos 2 primeros dias de julio de 2022/2023, sin embargo por problemas de memoria se decidio tomar unicamente el primer dia de julio de 2022/2023, proque no pod[ia por memoria trabajar con una matriz densao o dispersa para el caso de la matriz de adjacencia negativa. Por otro lado los metodos del benchmark tampoco podians er corridos por lo mismo y como la idea tambeon es poder crear un benchmark y al ceacion de un grafo que otros puedan usar se decidio tomar unicamente un unico dia, pensado q talves se peuda tener mejores resultados o una topologia de internet m[as completa si esque se toman mas dias]]



= Contrucción grafo Interbet

Para esta parte se decidio contruir  un grafo de la topologia donde cada nodo consta de los Sistemas Autonomos , las aristas las conecciones BGP existenete sentre ellas.Ademas se le suma atributos a cada SA. 
Esro con el fin de facilitar el input para diferentes tasks de GNN usando la informacion de internet.

La topologia se saco de las mismas BGP routes sacadas con BGPStream (libreria) que saca las RIBs de los colectores de Routeviews y RIPE NCC.

En cuanto a lso atributos de los nodos se sacaron del dataset de  peeringDB, especificamente los atributos:
- atributo 1
- atributo 2
- atributo 3
- atributo 4
- atributo 5

Las snapshots diarias de la informacion de peeringDB se encuentran en formato sql, sqlite y/o json. 
// the daily snapshots are in both sql, sqlite and/or json formats. 


para esto primero se descargo los archivos diarios de peeringDB, luego se exploraron estos , viendo los potenciales atributos que se podrian usar para los nodos. 

