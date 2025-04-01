= Metodologia


Teniamos que crear los embeddings para lso ssitemas autonomos para esto se partio construyendo un grafo (DGL y networkx) a partir de las rutas BGP colectadas los primero 3 dias de Juio del a;o (2022 2023). 

Luego se visualizo y saco informacion de esta.


Esta smsimas son tambien las que se ocuparon como input d elos algoritmos/metodos de inferencia previos presentes en el benchmark.

Ad iferencia de otros metodos como node2vec, Deepwalk, bgp2vec GNN no solo estaria incorporando en estos embeddings la topologia del grafo sino tambien los atributos de cada nodo.

Se tomaron 3 enfooques GNN al momento de crear lso embeddings d elso nodos:

- Encode-Decoder perspective








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

