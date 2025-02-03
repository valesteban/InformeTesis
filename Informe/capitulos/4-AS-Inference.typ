= AS Inference




 - These routing policies are constrained by the contractual commercial agreements between Administrative domains [GAO] 
- Routing policies are mainly determined by the business relationships between ASes [ruan]


- Since 2 ISPs might merge into one and each administrative domain can poses several ASes, an adminis domain can operate one or several ASes. @InferringASRelatioships2001

- Routing policies are mainly determined by the business relationships between ASes [ruan]



( BGP permite que cada sistema autónomo (AS) elija su propia política administrativa al seleccionar rutas y propagar información de alcance a otros. Estas políticas de enrutamiento están restringidas por los acuerdos comerciales contractuales entre dominios administrativos.)
- Las políticas de enrutamiento de BGP están determinadas principalmente por las relaciones comerciales entre ASes vecinos
- Dado que las relaciones entre ASes no son de acceso público, varios estudios han propuesto algoritmos heurísticos para inferir dichas relaciones utilizando datos de BGP disponibles públicamente.


- La mayoría de estos algoritmos se basan en la propiedad libre de valles de los caminos AS. Sin embargo, no todos los caminos AS cumplen esta propiedad, ya que algunos ASes no se ajustan a la política de exportación común. Como resultado, las relaciones inferidas entre ASes suelen ser inexactas. (e ha demostrado que si todos los ASes se adhieren a esta política de exportación común, entonces todos los caminos AS estarán libres de valles.)

// ToR information allows us to infer the possible routes selected by BGP, e.g., in case of a link failure @Internet-resiliency-to-attacks-and-failures-under-BGP-policy-routing,

// It can also be used to identify malicious fiddling with the routing system,
// known as IP hijack attack @Chinas-Maxim-Leave-No-Access-Point-Unexploited-The-Hidden @

// BGP allows each AS to choose its own administrative policy in selecting routes and propagating reachability information to others.@InferringASRelatioships2001 


// - "On infering AS relationships in the Internet" (2001)

// - "characterize the Internet Hierchy from  relationships between ASes in the Internet"

// los Sistemas autónomos son operados y controlados de manera independiente. 



// La mayoria de las soluciones son metodos heuristicos con algoritmos basado en data publica de anuncios BGP sacados de routeviews y otros
// == algoritmos de inferencia

Gao fue la primera perdona en plantear el problema de inferencia de las relaciones entre Sistemas Autónomos. En su estudio @InferringASRelatioships2001, sento las primeras bases para tratar el problema como:
- Propuso una representacion de forma de grafo para la representación de las relaciones entre los Sistemas Autónomos. Entre las que se encontrabas relaciones de Customer-Provider, Peering y Sibling.
- Propuso un algoritmo heurístico para inferir las relaciones entre ASes a partir de tablas de enrutamiento BGP.

Para Gao esto defidefinio a un Customer como que AS que paga a un provedor para obtener conectividad al resto del Internet, Provider como aquel que transita trafico de sus clientes, relación de peering como aquellos que s eponene de acuerdo  de transitar trafico de  sus clientes entre ellos.
Como el ruteo entre ASes es controlado por el protocoolo de ruteo BGP, conectividad fisica entre dos ASes no significa reachability.


 



=== Gao

El algoitmo presentado por Gao
Fue la primera en abordar el problema de inferencia de los tipos de relaciones entre Sistemas Autónomos. a partir de tablas de enrutamiento BGP y la heuristica de los grados de cada AS.

Para validar sus resultados, Gao utilizó información interna de At&T y datos del servicio WHOIS para verificar relaciones de tipo Siblings. Ene ste análisis, el 99.1% de los resultados de inferencia fueron confirmados por AT&T.



Su algotimo consistió en :
+ *Parsear las Routing Tables*: Se parsean las tablas de enrutamiento BGP y se calcula el grado de cada AS.
+ *Identificar el top provider*: Se identifica el top provider de cada AS path.
+ *Clasificar las relaciones*: Se clasifican las relaciones entre los ASes en base a la jerarquía de los ASes y el top provider.

La clasificaciónde relaciones esaba dado por la logica de que una ves encontrado el top provider de un as path, los pares AS que se encontrasen antes del top provider tendrian una relación de P2C, mientras que los pares que se encontrasen despues del top provider tendrian una relación de P2P y realcion S2s si ambos pares proveian de transito para each other es decir, podia encontrarse ese par tanto antes como despues del top provider.

Pero como no se puede asumir que todods lso speaging routers que pertences a un AS pueden estar bien configurados, Gao propuso un amejora para evitar inferncias incorrectas la cual consistia en contar un numero de Routing tbales que  que concluian que una relacion era de un tipo y otra. es decir,  si no más de L routing tables inferian que un AS u preoveia de transito a AS vy más de L routing tables inferian que v proveia d etransito a u entonces se ignoraba que u proveia de trnasito a v, sendo L una constante pequeña.


En caso de las relaciones de P2P Gao primero identifico aquellos Ases con qquienes no podría establecer relaciones de peering las identifico bajo la idea de que en una relacion de peering los ASes no differ more than R times.


// === AS Rank:



// https://asrank.caida.org/


// === Problink


=== Lu Rank

Uno de los algoritmos más recientes es el propuesto por Ruan y Susan en 2014 @computing-observed-autonomous-system-relationships-in-the-internet. Hasta ese momento, la mayoría de los métodos para inferir los tipos de relaciones entre sistemas autónomos se basaban en la suposición de que todos los AS siguen una política uniforme de exportación de rutas. Según esta política, las rutas provenientes de proveedores y peers no son exportadas AS vecinos que también son proveedores o peers. Bajo este idea, todos los AS Paths serían _"valley-free"_. 

Los algoritmos previos asumían que todos los AS paths eran _"valley-free"_ o buscaban maximizar el número de caminos que cumplían esa propiedad. Sin embargo, se sabe que un número gran número de AS paths en los updates  o tablas de enrutamiento BGP no son "_valley-free_". Esto hace que al depender de dicha propiedad las relaciones inferidas sean imprecisas.

Ruan y Susan en lugar de basarse en la propiedad de _"valley-free"_, prupusieron un método para clasificar las relaciones observadas entre AS, sustentandose en las relacioens de tránsito entre ellas, a tarves de los datos de BGP. A diferencia del algoritmo de Gao @InferringASRelatioships2001 [TODO:], que se basa principalmente en el grado de los AS, este metodo utiliza el concepto de grado de tránsito de los ASlo cual en conjunto con la ideantificación de los top providers de los AS Path, permiten identificar las relaciones entre AS. .

El algoritmo propuesto consta de tres fases principales:
1. *Preprocesamiento de los datos:* La entrada consiste en un conjunto de BGP routing table dumps obtenidos de RouteViews @RouteViewsProject. Estos datos se sanitizan eliminando loops, descartando ASN inválidos, eliminando ASN duplicados y excluyendo conjuntos de ASN terminales, en caso de que estén presentes en las secuencias.


2. *Procesamiento de AS paths que contienen AS Tier-1:* 
En esta fase se definen dos contadores cnt(X, Y) y cnt(Y, X), los cuales indican el número de veces que X actúa como proveedor de tránsito para Y, y el número de veces que Y actúa como proveedor de tránsito para X respectivamente. Si X e Y aparecen en un AS path antes del top provider, se interpreta que Y proporciona tránsito a X; de lo contrario, X proporciona tránsito a Y. A partir de esta información y la identificación de ASN Tier-1, las relaciones se clasifican en base a las suiguientes reglas:

    - Si cnt(X, Y) > 0 y cnt(Y, X) = 0, se establece una relación P2C entre X y Y.
    - Si cnt(X, Y) > 0 y cnt(Y, X) > 0, y al menos uno entre X o Y es un AS Tier-1, la relación entre ellos es P2P.
    - Si cnt(X, Y) > 0 y cnt(Y, X) > 0, y ninguno de los dos es un AS Tier-1, la relación es S2S.

3. *Clasificación de AS paths indeterminados:* En esta fase final, primero se determina el top provider de los AS paths donde no se encontraron AS Tier-1. Para ello, se construye un grafo dirigido en el que cada nodo tiene un atributo denominado _distance_, que indica el camino  más corto en hops a un AS Tier-1. Luego, con esta infomación al igual que en la fase anterior se puede determianr las relaciones de los AS paths bajo las siguientes reglas:
  - Si cnt(X, Y) > 0 y cnt(Y, X) = 0, entonces X y Y tienen una relación provider-to-customer (P2C).
  - Si cnt(X, Y) > 0 y cnt(Y, X) > 0, entonces X y Y tienen una relación peer-to-peer (P2P).

Esta última regla puede corresponder también a una relación S2S, en caso de que en el paso anterior se hayan clasificado como S2S. Si un AS path contiene una relación P2P que no es adyacente a un top provider, entonces se reclasifica como S2S, dado que el enlace es visible a través de un upstream provider. caso contrario se mantiene como P2P.

// // TODO:
// // - Ver accuracy o como de identifico que daba buenos resultados.
// // - Dataset que se uso para inferir.
// // - Dataset de validación


=== BGP2Vec

En 2020, Tal Shapira y Yuval Shavitt presentaron un nuevo enfoque @BGP2VecASRelationships, para 
la inferencia de Sistemas Autónomos utilizando por primera vez técnicas de Deep Learning. Este metodo 
se realiza se basa en la creacion de empebings de estos Sistemas autonomos utilizando unicamente anuncion BGP provenientes de datasets públicos.
El modelo alcanzó una precisión del 95.8 % en la clasificación de relaciones entre ASes.

El pipeline que siguieron para esta tecnica consistio en dos etapas: La 
primera, donde se entrena un modelo de Deep Learning para generar embeddings de los ASes, y la segunda, donde se entrena un modelo de Deep Learning para clasificar las relaciones entre los ASes.


El entrenamiento de BGP2Vec para la generar embeddigs de Sistemas Autónomos consiste en utilizar como entrada un vector one-hot representante del ASN (Número de Sistema Autónomo) y como salida otro vector one-hot que representa los ASNs del contexto. Luego mediante el descenso de gradiente, se ajustan los pesos de la red para maximizar la probabilidad logaritmica de cualquier ASN de contexto dado el ASN de entrada.


#figure(
  image("../imagenes/BGP2Vec1.png", width: 100%),
  caption: [???.],
) <BGP2Vec-AS-Path>


Una vez entrenado los embeddings para casa ASN, se continua con la tarea de classificación de las relaciones entre los Sistemas Autónomos. Para esto se ocupa un Red Neuronal Artificial de dos capas.

#figure(
  image("../imagenes/BGP2Vec2.png", width: 100%),
  caption: [???.],
) <BGP2Vec-Pipeline>


Para la etapa inicial de entrenamiento de BGP2Vec, se utilizaron anuncios extraídos de RouteViews @RouteViewsProject, que contenían anuncios de rutas de AS (AS PATH) recolectadas por 19 colectores. Este dataset recopiló 3,600,000 rutas de AS con 62,525 vértices de AS y 113,400 enlaces no dirigidos.

Para el entrenamiento de la Red Neuronal encargada de la clasificación de las relaciones entre ASes, se utilizó el conjunto de datos de relaciones entre AS de CAIDA @CAIDAS-relationship, que contiene relaciones P2P y P2C/C2P. Además para algunos experimentos, se empleó el dataset ToR de BGProtect (www.BGProtect.com) @BGProtect, basado en el trabajo de Shavitt et al. @Near-deterministic-Iinference-of-AS-relationships..


// https://github.com/talshapira/BGP2Vec/tree/main
// Se uso este conjunto de datos para entrenar ls red neuronal y varios algoritmos de aprendizaje supervisado basados en embedding de ASN, y como referencia para la comparación con trabajos previos.

// El algoritmo de BGP2Vec se basa en la misma idea de Word2Vec, donde se buscar representar vectorialmente los ASes de manera que las relaciones entre ellos se puedan inferir a partir de la distancia entre los vectores. Para esto, se utilizan los anuncios BGP de rutas de AS (AS PATH) para entrenar un modelo de Deep Learning que genere embeddings de los ASes. Estos embeddings son utilizados para clasificar las relaciones entre los ASes.
// E n este caso s eocupo skip-gram, que es un modelo de aprendizaje no supervisado para aprender representaciones vectoriales de palabras. El objetivo es aprender representaciones vectoriales de palabras que sean útiles para predecir las palabras vecinas en un contexto dado.

// ¿Cómo se creó el Dataset?

// Para este caso se necesitan 2 datasets, el primero el dataset correspondiente a las rutas BGP, para por medio de Word2Vec characterizeembedding
// de los Ases y un segundo dataset para entrenar la red neuronal srtificial para la tarea de clasificacion.
 
// 1. A partir del dataset de rutas BGP proporcionadas por CAIDA @CAIDAS-relationship, para el caso especifico de este problema _aaaammdd.as-rel2.txt.bz2_ correspondiente a la fecha dd/mm/aaaa, se generaron dos listas: una con pares de Sistemas Autonomos que comparten algún tipo de relación, y otra que etiqueta el tipo de la relación de cada par.

// // TODO: Agregar fecha dataset 

// ```python
// tor_dataset = []
// tor_labels = []

// with bz2.open(DATA_PATH + ToR_CSV, "rt") as csv_file:
//     reader = csv.reader(csv_file,delimiter='|')
//     for i, row in enumerate(reader):
//       if row[0][0] != '#' and int(row[2]) in TOR_CSV_LABELS_DICT.values():
//         # print(row)
//         # Agrego arista en ambos sentidos 
//         tor_dataset.append(np.asarray(row[:2]))
//         tor_dataset.append(np.asarray(row[1::-1]))

//         # Si etiqueta -1 -> 2; si etiqueta 0 -> 0; si etiqueta 1 -> 1
//         label = int(row[2])
//         if label == -1:         # Si es P2C,
//           label = 2
//           tor_labels += [label, 1]
//         elif label == 0:        # Si es P2P
//           tor_labels += [label, label]
//         else:                   # Si es C2P
//           tor_labels += [label,2]
// ```
// Estas listas se gurdan en archivos np con los nombres _bgp2vec_caida_tor_dataset.npy_ y _bgp2vec_caida_tor_labels.npy_ respectivamente.

// Las etiquetas correspondientes a las relaciones entre ASes corresponden a:
// - 0: Peer-to-Peer (P2P)
// - 1: Customer-to-Provider (C2P)
// - 2: Provider-to-Customer (P2C)
// Con un conteo de 619648, 121096 y 121096 relaciones, respectivamente.

// 2. Crear 



// 3. Se entrena  el modelo BGP2VEC con el dataset de rutas BGP y se guarda el modelo en el archivo _bgp2vec.word2vec_.

// ```python
// test_limit = 2000000 #cantidad paths/horaciones
// mode = None# 'test' # par limitar cantidad de paths/oraciones
// epochs = 1
// debug = True


// # Crea embeddings de ASN con  BGP2VEC y lo guarda en "bgp2vec/bgp2vec.word2vec"
// bgp2vec = BGP2VEC(model_path = MODELS_PATH ,oix_path=oix_path,rewrite=True, test_limit= test_limit, mode = mode, epochs = epochs)

// ```

// 4. 


== ProbLink



ProbLink es un algoritmo probabilistico para inferir las relaciones entre Sistemas Autonomos propuesto por Yuchen Jin et al. @ProbLink. 
Este permite el uso de atributos con valores estocásticos. Toma en cuenta información sobre los links y caminos qure atraviesan . ProbLink no impone un orden específico en que los ASes y lso enlances deben ser analizados, en su lugar itera con tinuamente hasta alcanzar una convergencia. 

// El algoritmo comienza con la clasificación inicial con los resultados de CoreToLeaf, un algoritmo de clasificación de relaciones entre ASes propuesto por los mismos autores de baja complejidad. Si CoreToLeaf etiqueta el link $L$ como un link P2C, entonces $P(L=P2P) = 0.0$, $P(L=C2P)= 0.0$ y $P(L=P2C)=1.0$.

Para cada atributo se calcula la distribución de probabilidad condicional basada en lso datos observados y el conjunto inicial de etiquetas.
Luego en cada iteración, se actualiza las probabilidades de los tipos de cada enlace ejecutando su algoritmo probabilistico y se recalcula las distribuciones d elas caracteristicas utilizando los valores de probaboilidad actualizadas de cada enlace. 
Se repite el proceso hasta la convergencia, es decir , ahsta que el porcentaje de enlaces que cambia de etiqute caiga por debajo de un umbral.



== Desafíos en la inferencia de Relaciones entre Sistemas Autónomos
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


= EXTRAS

// Estudios hechos por Yuchenjin et al. @ProbLink dentro de su estudio en la creación de un algoritmo de inferencias de ASes, determinó 5 tipos de links que eran dificiles de inferir. Para esto ocupo CoreToLeaf un algoritmo basico de inferencia el cual solo ocupaba la asumtio of valley-free y la ubicacion de Top provider AS para determinar las relaciones(mas info en  la seccion de ProbLink):

