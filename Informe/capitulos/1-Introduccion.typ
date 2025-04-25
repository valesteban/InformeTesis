= Introducción
En la sociedad actual, Internet juega un rol esencial en la vida cotidiana, 
facilitando la comunicación, la colaboración y el intercambio de información.

Internet se compone de múltiples subredes interconectadas. A través del protocolo 
BGP, estas subredes comparten información sobre su topología de red, permitiendo 
que los paquetes de datos enviados por un usuario lleguen a su 
destino final. Conocer las politicas administrativas y otros aspectos relacionados a estas subredes —mejor conocidas como Sistemas Autónomos (ASes)— es crucial para comprender la topología de Internet 
y, a su vez, tomar mejores decisiones para mejorar la eficiencia y seguridad de la 
red. Sin embargo, esta informacion no es de acceso público.

En este contexto, el uso de Redes Neuronales de Grafos (GNNs) surge como una herramienta poderosa para realizar tareas de aprendizaje sobre datos de Internet, ya que este puede representarse de forma natural como un grafo.
En particular, el uso de GNNs para la tarea de inferencia de relaciones comerciales entre Sistemas Autónomos podría darnos una mirada diferente a cómo se ha resuelto previamente dicha tarea y darnos una mejor comprensión de cómo la topología del Internet se relaciona con los acuerdos comerciales entre Sistemas Autónomos, además de características importantes a la hora de inferir las relaciones, para luego tomar luego mejores decisiones para mejorar la seguridad y eficiencia de la red.




// Conocer las relaciones entre los ASes es de vital importancia, ya que permite entender el 
// comportamiento del tráfico de Internet, detectar posibles ataques y fallos en la red, 
// y optimizar el ruteo de los paquetes. Sin embargo estas no son de acceso público, por 
// lo que inferir estas relaciones es un problema de gran relevancia en la actualidad. A 
// través de las rutas anunciadas mediante BGP, es posible inferir el tipo de relación 
// entre los ASes. 

== Hipótesis
Las Redes Neuronales de Grafos (GNNs) pueden ofrecer un rendimiento superior en 
comparación con las metodologías del estado del arte @UnveilingtheTypeRelationshipBetweenAutonomousSystemsUsingDeepLearning para la 
inferencia del tipo de relación entre Sistemas Autónomos.

== Objetivos

=== Objetivo general

El objetivo principal de este estudio es evaluar diversas arquitecturas de Redes 
Neuronales de Grafos (GNNs) y atributos relevantes de los Sistemas Autónomos para 
determinar su viabilidad en la inferencia del tipo de relación de tráfico entre 
Sistemas Autónomos. Para ello, se analizarán características específicas de cada 
Sistema Autónomo junto con la topología de la red.

=== Objetivos específicos

+ *Obtención de datos:* Recolectar información de fuentes confiables, correspondiente a Sistemas Autónomos representativos de la red de Internet. Esto incluye datos sobre la topología entre Sistemas Autónomos, sus características y relaciones que comparten entre ellos.

+ *Preparación de datos:* Construir un grafo a partir de los datos recolectados, definiendo un formato de entrada específico para nuestros modelos GNN, incluyendo la mejora de calidad de los datos mediante el uso de diferentes técnicas de preprocesamiento, como normalización, conversión de atributos categóricos a numéricos, entre otros.
  
+ *Diseño e implementación de modelos:* Diseñar e implementar modelos GNN y frameworks específicos que permitan la inferencia del tipo de relación que dos Sistemas Autónomos comparten.
  
+ *Evaluación de desempeño:* Comparar el rendimiento de diferentes arquitecturas de GNN y técnicas utilizadas anteriormente para esta inferencia, identificando los parámetros de mayor relevancia.
  
+ *Análisis de resultados:* Interpretar los resultados obtenidos mediante el estudio y su comparación con los valores esperados y el estado del arte@UnveilingtheTypeRelationshipBetweenAutonomousSystemsUsingDeepLearning.

== Metodología
El plan de trabajo que se llevó a cabo durante esta investigación constó de cuatro etapas:

/ Investigación y familiarización: En esta primera etapa, se llevó a cabo la lectura de artículos académicos relacionados con el uso de GNNs, así como de artículos relevantes sobre la representación de datos de Internet y el problema de inferencia. En paralelo, se realizó una búsqueda de datasets públicos disponibles y el desarrollo de modelos básicos de GNNs para familiarizarse con la herramienta.

/ Preparación de datos: Una vez estudiados y recolectado los datos sobre Internet, estos fueron pre-procesados y adaptados a un formato especifico a la entrada requerida por el modelo.

/ Construcción de modelos y entrenamiento: Una vez se tuvo más claridad sobre la tarea y las herramientas a utilizar, se continuó con la implementación de diversos modelos de GNNs utilizando el conjunto de datos. Además, se llevó a cabo el entrenamiento de estos modelos, ajustando hiperparámetros y realizando modificaciones en los datos de entrada a medida que se aprendía y se realizaban pruebas.

// FIXME: Arrgelar el comienzo
/ Contrucción de un benchmark: Luego de desarrolladas diversas implementaciones y frameworks de GNNs para la tarea específica, se diseñó un pequeño benchmark para comparar el rendimiento del uso de GNNs con técnicas previas y evaluar sus resultados.

/ Análisis de resultados:Con las implementaciones ya creadas y los resultados obtenidos tanto de GNNs como de los otros métodos, se pasó al análisis de los resultados y a la comparación de los desempeños de las diferentes técnicas.

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

// PRELIMINARES
- *Capítulo 2:* Explicación de los principales conceptos tratados en esta tesis: Internet, Sistemas Autónomos, BGP y GNNs.

// TRABAJO RELACIONADO
- *Capítulo 2:* Se aborda el problema de inferencia de relaciones entre Sistemas Autónomos y metodos previos que han sido utilizados para resolverlo.

// METODOLOGIA
// - *Capítulo 3:* Se explica la metodología utilizada para resolver la tarea.Se presentan una visión general de la infraestructura de Internet y sus conceptos clave, incluyendo los Sistemas Autónomos (AS), los IXPs, el ruteo, entre otros.


// // RESULTADOS

// - *Capítulo 2:* Se presentan una visión general de la infraestructura de Internet y sus conceptos clave, incluyendo los Sistemas Autónomos (AS), los IXPs, el ruteo, entre otros.

// - *Capítulo 3:* Explicación del protocolo BGP, sus componentes esenciales y su funcionamiento.

// - *Capítulo 4:* Se abordan las relaciones entre los AS, determinadas por políticas de ruteo, y se describen algunos métodos de inferencia de relaciones utilizados para construir un benchmark.

// - *Capítulo 5:* Introducción a las Redes Neuronales y las GNN.

// - *Capítulo 6:* Se cubren las fuentes de información públicas disponibles sobre la infraestructura de Internet, con un enfoque específico en las utilizadas en este trabajo.

// - *Capítulo 7:* Se detallan el diseño de los experimentos y los resultados obtenidos.

// - *Capítulo 8:* Análisis de los resultados y conclusiones.