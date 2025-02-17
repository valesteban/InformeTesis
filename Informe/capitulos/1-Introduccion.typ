= Introducción
En la sociedad actual, Internet juega un papel esencial en la vida cotidiana, facilitando la comunicación, la colaboración y el intercambio de información.

Internet se compone de múltiples subredes interconectadas. A través del protocolo BGP, estas subredes comparten información sobre la topología de la red, permitiendo que los paquetes de datos enviados por un usuario lleguen correctamente a su destino final. Sin embargo, muchos detalles sobre estas subredes y sus conexiones no siempre son accesibles públicamente.

En este contexto, las Redes Neuronales de Grafos (GNNs) han surgido como una herramienta poderosa dentro del aprendizaje automático para modelar datos estructurados en grafos. Dado que Internet puede representarse naturalmente como un grafo, explorar el uso de GNNs podría proporcionar una mejor comprensión de su topología, mejorar la seguridad del enrutamiento y optimizar la eficiencia de la red.
== Hipótesis
Las Redes Neuronales de Grafos (GNNs) pueden ofrecer un rendimiento superior en comparación con las metodologías del estado del arte @UnveilingtheTypeRelationshipBetweenAutonomousSystemsUsingDeepLearning para la inferencia del tipo de relación entre Sistemas Autónomos.


== Objetivos

=== Objetivo general

El objetivo principal de este estudio es evaluar diversas arquitecturas de Redes Neuronales de Grafos (GNNs) para determinar su viabilidad en la inferencia del tipo de relación de tráfico entre dos Sistemas Autónomos. Para ello, se analizarán características específicas de cada Sistema Autónomo, la información de actualizaciones BGP, la topología de la red y sus cambios.

=== Objetivos específicos

+ *Obtención de datos:* Recopilar datos de fuentes confiables que correspondan a Sistemas Autónomos representativos de la red de Internet. Esto implica obtener datos sobre nodos, características y relaciones entre ellos.
+ *Preparación de datos:* Mejorar la calidad de los datos mediante el uso de técnicas de normalización, conversión de atributos categóricos a numéricos, manejo de desequilibrio de clases, entre otros. Además, construir el grafo y definir cómo se proporcionarán los datos de entrada a nuestros modelos GNN.
+ *Diseño e implementación de modelos:* Diseñar e implementar modelos GNN y frameworks específicos que permitan la inferencia del tipo de relación que dos Sistemas Autónomos comparten.
+ *Evaluación de performance:* Comparar el desempeño de diferentes arquitecturas de GNN y técnicas utilizadas anteriormente para esta inferencia, identificando los parámetros de mayor relevancia.
+ *Análisis de resultados:* Comprender los resultados obtenidos mediante el estudio y la comparación con los valores esperados y el estado del arte @UnveilingtheTypeRelationshipBetweenAutonomousSystemsUsingDeepLearning.

== Metodología
El plan de trabajo que se llevó a cabo durante esta investigación constó de cuatro etapas:

/ Investigación y familiarización: En esta primera etapa, se llevó a cabo la lectura de artículos académicos relacionados con el uso de GNNs, además de artículos relevantes en la representación de datos de Internet y del problema de inferencia de relaciones entre Sistemas Autónomos. En paralelo, se realizó una búsqueda de datasets públicos disponibles y el desarrollo de modelos básicos de GNNs para familiarizarse con la herramienta.

/ Preparación de datos: Una vez seleccionado el dataset, los datos fueron procesados y transformados para adaptarlos a la representación de entrada requerida por nuestro modelo.

/ Construcción de modelos y entrenamiento: Una vez se tuvo más claridad sobre el problema y las herramientas a ocupar, se procedió a la implementación de diversos modelos de GNNs con el conjunto de datos. En conjunto, se llevó a cabo el entrenamiento de estos modelos y el ajuste de hiperparámetros para optimizar su desempeño.

/ Análisis de resultados: Luego de la construcción y entrenamiento de los modelos, se diseñó un pequeño benchmark para comparar el rendimiento de las GNNs con técnicas previas y evaluar sus resultados.

== Contribuciones

//FIXME: Pendiente, comopletar una vez ya completado sección experimentos y análisis
// Al término de esta investigación, se espera lograr:

// \begin{itemize}
//  \item Revisión de la literatura sobre modelos GNNs,  metodologías para la clasificación de aristas en grafos y el funcionamiento de BGP, así como la identificación de fuentes confiables para recolectar información sobre la topología y características de cada Sistema Autónomo.
//  \item Diferentes frameworks y metodologías basadas en GNNs que demuestren un buen desempeño en la inferencia de relaciones entre Sistemas Autónomos.
//  \item Conjunto de datos que incluya información tanto de Sistemas Autónomos con sus características como del flujo de paquetes BGP,así como la determinación de la mejor representación de estos datos como entrada para nuestro modelo.
//  \item Comparación entre los modelos considerados como estado del arte con los desarrollados en esta investigación, así como una comparación entre los diferentes modelos propuestos por este estudio.
// \item Identificación de factores determinantes para el desempeño de modelos GNN en la inferencia del tipo de relación que comparten dos Sistemas Autónomos en la topología BGP.


// \end{itemize}

== Estructura del trabajo
//FIXME: Arreglar secciones individuales
Este documento se organiza de la siguiente manera:

- *Capítulo 2:* Se presenta una visión general de la infraestructura de Internet y sus conceptos clave, incluyendo los Sistemas Autónomos (AS), IXPs, el ruteo, entre otros.

- *Capítulo 3:* Explicación del protocolo BGP, sus componentes esenciales y su funcionamiento.

- *Capítulo 4:* Se abordan las relaciones entre los AS, determinadas por políticas de ruteo, y se describen algunos métodos de inferencia de relaciones utilizados para construir un benchmark.

- *Capítulo 5:* Introducción a las Redes Neuronales y GNN.

- *Capítulo 6:* Se cubren las fuentes de información públicas disponibles sobre la infraestructura de Internet, con un enfoque específico en las utilizadas en este trabajo.

- *Capítulo 7:* Se detallan el diseño de los experimentos y los resultados obtenidos.

- *Capítulo 8:* Análisis de los resultados y conclusiones.