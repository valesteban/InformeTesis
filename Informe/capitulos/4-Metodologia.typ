= Metodologia


Teniamos que crear los embeddings para lso ssitemas autonomos para esto se partio construyendo un grafo (DGL y networkx) a partir de las rutas BGP colectadas los primero 3 dias de Juio del a;o (2022 2023). 

Luego se visualizo y saco informacion de esta.


Esta smsimas son tambien las que se ocuparon como input d elos algoritmos/metodos de inferencia previos presentes en el benchmark.

Ad iferencia de otros metodos como node2vec, Deepwalk, bgp2vec GNN no solo estaria incorporando en estos embeddings la topologia del grafo sino tambien los atributos de cada nodo.

Se tomaron 3 enfooques GNN al momento de crear lso embeddings d elso nodos:

- Encode-Decoder perspective
