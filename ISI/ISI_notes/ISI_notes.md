
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
# Introducción a los Sistemas Inteligentes - ISI

* **Periodo:** 2020-2
* **Grupo:** 2
* **Profesor:** [Jonatan Gomez Perdomo](https://dis.unal.edu.co/~jgomezpe/)
* **Correo:** jgomezpe@unal.edu.co
* **Libro guía:** [Inteligencia Artificial Un Enfoque Moderno 2a Edición](https://luismejias21.files.wordpress.com/2017/09/inteligencia-artificial-un-enfoque-moderno-stuart-j-russell.pdf)
* **Apuntes tomados por:** Guiselle Tatiana Zambrano Penagos

## Calificación

* 30% Participación
* 45% - 3 módulos (proyectos)
* 25% - Ejercicios pequeños (requieren tiempo)

## Grupo de Trabajo: PTL

* Liseth Yurany Arevalo Yaruro
* Valeria Huepa Ducuara
* Guiselle Tatiana Zambrano Penagos

## Temas del curso

1. Busqueda

	* Agente inteligente.
	* ¿Qué son las persepciones?
	* ¿Qué son las acciones?
	* ¿Cuándo se concidera que un agente es inteligente?
	* ¿Cuáles son los tipos de inteligencia artificial que hay?
	* Agentes basados en objetivos.
	* Agentes reflejo.
	* Agentes con estado interno.
	* Agentes con objetivo.
	* Agentes que aprenden. (No es el enfoque del curso).
1. Juegos (¿?)

	* Algoritmos minimax
	* La poda alfa-beta
1. Inteligencia Dura
1. Inteligencia Suave

	* Algoritmos genéticos.
	* Redes neuronales.
	* Arboles de desición.
	* Inicio al aprendizaje maquinal y mineria de datos (data science).
1. Lógica
	* Inteligencia artificial basado en sistemas expertos (en la lógica
	matemática).

		* Inferencia matemática.
		* Prolog.

# Introducción

La IA es una de las ciencias más recientes, el nombre se acuñó en 1956.

## ¿Qué es la IA?

![Definiciones de IA](./images/I00.png){ width=45% }\

Hay un enfrentamiento entre estos enfoques. El que está centrado en el
comportamiento **humano** debe ser una ciencia empírica que incluya hipótesis y
confirmaciones mediante experimentos. El enfoque **racional** implica una
combinación de matemáticas e ingeniería.

### Comportamiento humano: el enfoque de la prueba de Turing.

Esta fue propuesta por Alan Turing (1950), se diseñó para proporcionar una
definición operacional y satisfactoria de inteligencia. La prueba se basa en la
incapacidad de diferenciar entre entidades inteligentes indiscutibles y seres
humanos. El computador debería poseer las siguientes capacidades:

* **Procesamiento de lenguaje natural**
* **Representación del conociemiento** para almacenar lo que se conoce o siente.
* **Razonamiento automático** para utilizar la información almacenada para
responder a preguntas y extraer nuevas conclusiones.
* **Aprendizaje automático** para adaptarce a nuevas circunstancias y para
detectar y extrapolar patrones.

### Actuar de forma racional: el enfoque del agente racional

Los agentes informáticos tienen otros atributos que los distinguen de los
_programas_ convencionales, como:

* Controles autónomos.
* Capacidad de percibir su entorno.
* Persistencia durante un tiempo prolongado.
* Adaptabilidad.
* Alcanzar objetivos diferentes.

Un **agente racional** es aquel que actúa con la intención de alcanzar el mejor
resultadoo, cuando hay incertidumbre, el mejor resultado esperado. Se comporta
tan bien como puede. Obtener una racionalidad perfecta (hacer siempre lo
correcto) no es posible en entornos complejos.

**Racionalidad limitada:** Actuar adecuadamente cuando no se cuenta con el
tiempo suficiente para efecturar todos los cálculos que serían deseables.

## Los fundamentos de la IA

# Agentes inteligentes

## Agentes y su entorno

* **Agente:** es cualquier cosa capaz de percibir su **Medioambiente** con la
ayuda de **sensores** y actuar en ese medio utilizando **actuadores**.
Cada agente puede percibir sus propias acciones (pero no siempre sus efectos).
El comportamiento de un agente viene dado por la **función agente**.

![Partes del agente](./images/II00.png){ width=45% }

* **Percepción:** El agente puede recibir entradas en cualquier instante.
* **Secuencia de percepciones:** refleja el historial completo de lo que el
agente ha recibido. _Un agente tomará una desición en un momento dado
dependiendo de la secuencia completa de percepciones hasta ese instante_.
* **Función agente:** Proyecta una percepción dada, en una acción. Se
implementará mediante el **programa del agente**. La función del agente es una
descripción matemática abstracta; el programa del agente es una implementación
completa, que se ejecuta sobre la arquitectura del agente.

## Buen comportamiento: el concepto de racionalidad

Un agente racional es aquel que hace lo correcto. Hacer lo correcto es aquello
que permite al agente obtener un resultado mejor. Por lo tanto, se necesita
determinar una forma de medir el éxito. Ello, junto a la descripción del entorno
y de los sensores y actuadores del agente, proporcionará una especificación
completa de la tarea que desempeña el agente.

### Medidas de rendimiento

Incluyen los criterios que determinan el éxito en el comportameinto del agente.
Cuando se sitúa un agente en un medio, éste genera una secuencia de acciones de
acuerdo con las percepciones recibidas. Si la secuencia es la deseada, entonces
el agente habrá actuado correctamente.

_Como regla general, es mejor diseñar medidas de utilidad de acuerdo con lo que
se quiere para el entorno, más que de acuerdo con cómo se cree que el agente
debe comportarse_.

### Racionalidad

Depende de 4 factores:

* La medida de rendimiento que define el criterio de éxito.
* El conocimiento del medio en  el que habita, acumulado por el agente.
* Las acciones que el agente puede llevar a cabo.
* La secuencia de percepciones del agente hasta este momento.

_En cada posible secuencia de percepciones, un agente racional deberá emprender
aquella acción que supuestamente maximice su medida de rendimiento, basándose en
las evidencias aportadas por la secuencia de percepciones y en el conocimiento
que el agente mantiene almacenado_

### Omnisciencia, aprendizaje y autonomía

Un agente omnisciente conoce el resultado de su acción y actúa de acuerdo con
él; sin embargo, en realidad la omnisciencia no es posible. La **recopilación de
información** busca llevar a cabo acciones con la intención de modificar las
percepciones futuras. No es suficiente con recopilar la información, el agente
debe **aprender** lo máximo porsible de lo que está percibiendo.
Se dice que un agente carece de **autonomía** cuando se apoya más en el
conocimiento inicial que le proporciona su diseñador que en sus propias
percepciones. Un agente racional debe ser autónomo, debe saber aprender a
determinar cómo tiene que compensar el conocimiento incompleto o parcial inicial

## La naturaleza del entorno

Son esencialmente los **problemas** para los que los agentes racionales son las
**soluciones**.

### Especificación del entorno de trabajo

**REAS** (**R**endimiento, **E**ntorno, **A**ctuadores, **S**ensores).

![Ejemplo del entorno de trabajo](./images/II01.png)
![Ejemplo del entorno de trabajo](./images/II02.png)

#### Propiedades de los entornos de trabajo

Estas dimensiones determinan, hasta cierto punto, el diseño más adecuado para el
agente y la utilización de cada una de las familias principales de técnicas en
la implementación del agente.

* **Totalmente observable** vs. **Parcialmente observable**

Si los sensores del agente le proporcionan acceso al estado completo del medio
en cada momento, entonces se dice que el entorno de trabajo es totalmente
observable. Estos son convenientes ya que el agente no necesita mantener ningún
estado interno para saber qué sucede en el mundo. Un entorno puede ser
parcialmente observable debido al ruido, por sensores poco exactos o porque los
sensores no reciben información de parte del sistema.

* **Determinista** vs. **Estocástico**

Si el siguiente estado del medio está totalmente determinado por el estado
actual y la acción ejecutada por el agente, entonces se dice que el entorno
es determinista; de otra forma es estocástico. Si el medio es parcialmente
observable entonces puede _parecer_ estocástico. Es mejor pensar en entornos
deterministas o estocásticos _desde el punto de vista del agente_.
Si el medio es deterinista, excepto para las acciones de otros agentes, decimos
que el medio es **estratégico**.

* **Episódico** vs. **Secuencial**

En un entorno de trabajo episódico, la experiencia del agente se divide en
episodios atómicos. Cada episodio consiste en la percepción del agente y la
realización de una única acción posterior. El siguiente episodio **no** depende
de las acciones en episiodios previos. Este es más fácil ya que el agente no
necesita pensar con tiempo.

En entornos secuenciales, la decisión presente puede afectar a decisiones
futuras.

* **Estático** vs. **Dinámico**

Si el entorno puede cambiar cuando el agente está deliberando, entonces se dice
que el entorno es dinámico para el agente; de otra forma se dice que es
estático. Si el entorno no cambia con el paso del tiempo, pero el rendimiento
del agente cambia, se dice que el medio es **semidinámico**.

* **Discreto** vs. **Continuo**

La distinción entre discreto y continuo se puede aplicar al estado del medio,
a la forma en la que se maneja el tiempo y a las percepciones y acciones del
agente. Por ejemplo, un medio con estados discretos como el del juego del
ajedrez tiene un número finito de estados distintos.

* **Agente individual** vs. **Multiagente**

Se ha descrito que una entidad puede percibirse como un agente, pero no se ha
explicado qué entidades se deben considerar agentes. ¿Tiene el agente A (por
ejemplo el agente taxista) que tratar un objeto B (otro vehículo) como un
agente, o puede tratarse méramente como un objeto con un comportamiento
estocástico? La distinción clave está en identificar si el comportamiento de B
está mejor descrito por la maximización de una medida de rendimiento cuyo valor
depende del comportamiento de A.

Por ejemplo, en el ajedrez, la entidad oponente B intenta maximizar su medida de
rendimiento, la cual, según las reglas, minimiza la medida de rendimiento del
agente A. Por tanto, el ajedrez es un entorno multiagente **competitivo**.
Por otro lado, en el medio definido por el taxista circulando, el evitar
colisiones maximiza la medida de rendimiento de todos los agentes, así pues es
un entorno multiagente parcialmente **cooperativo**.

![Ejemplos de entornos](./images/II03.png)

## Estructuras de los agentes

El trabajo de la IA es diseñar el **programa del agente** que implemente la
función del agente que proyecta las percepciones en las acciones. Se asume que
este programa se ejecutará en algún tipo de computador con sensores físicos y
actuadores, lo que se conoce como **arquitectura:**

_Agente = arquitectura + programa_

La arquitectura y el programa deben ser compatibles. Si el programa tiene
recomendaciones como _Caminar_, la arquitectura tiene que tener piernas.

### Programas de los agentes

Hay que tener en cuenta la diferencia entre los programas de los agentes, que
toman la percepción actual como entrada, y la función agente, que recibe la
percepción histórica completa.

Completar adecuadamente

Los **agentes reactivos simples** responden directamente a las percepciones,
mientras que los **agentes reactivos basados en modelos** mantienen un estado
interno que les permite seguir el rastro de aspectos del mundo que no son
evidentes según las percepciones actuales. Los **agentes basados en objetivos**
actúan con la intención de alcanzar sus metas, y los **agentes basados en
utilidad** intentan maximizar su _felicidad_ deseada.

### Resolver problemas mediante búsqueda

Los **agentes resoventes-problemas** deciden qué hacer para encontrar secuencias
de acciones qe conduzcan a los estados deseables.

#### Agentes resolventes-problemas

El primer paso para solucionar un problema es la **formulación del objetivo**,
basado en la situación actual y la medida de rendimiento del agente.

Dado un objetivom la **formulación del problema** es el proceso de decidir qué
acciones y estados tenemos que considerar. Un problema puede definirse,
formalmente por cuatro componentes:

* El **estado inicial:** en el que comienza el agente.
* Una descripción de las posibles **acciones** disponibles por el agente. La
formulación más común utiliza una **función sucesor**. Dado un estado particular
$x$, su $SUCESOR-FN(x)$ devuelve un conjunto de pares ordenados $<acción,
sucesor>$, donde cada accióń es una de las acciones legales en el estado $x$ y
cada sucesor es un estado que puede alcanzarce desde $x$, aplicando la acción.
El espacio de estados forma un grafo en el cual los nodos son estados y los
arcos son acciones.
* El **test objetivo** determina si un estado es un estado objetivo.
* Una función **costo del camino** que asigna un costo numérico a cada camino.
Por ahora se asumirá que el costo del camino es la suma de los costos de las
acciones individuales a lo largo del camino. El **costo individual** de una
acción $a$ que va desde un punto $x$ al estado $y$ se denota por $c(x,ay)$.

# Ejercicios

1. Hacer el pseudocódigo de un árbol n-ario.

	```
	Tree T;
	new Queue Q;
	Q.add(T.root);
	while(Q.isntEmpty){
		current = Q.pull;
		print(current);
		Q.add(current.children); ***
		Q.pop;
	}
	```
1.

## Conceptos clave

* **Valor:** Atributo que no tiene significado. Cualidad de un sujeto o un
objeto.
* **Dato:** Valor con significado. Representación de una variable que puede ser
cuantitativa o cualitativa.
* **Información:** Colección de datos. Atributos relacionados a través del
objeto que tiene ese atributo.
* **Conocimiento:** Información relacionada, no es solamente tener información
sino relacionarla. Información de la información. Combinación del conocimiento de
la especie y del adquirido por el individuo. La mineria de datos busca encontrar
conocimiento de los datos.
* **Sistema nervioso:** Estructura donde se almacena el conocimiento.
* **Conciencia:** Conocimiento que se tiene de si mismo. Saber qué es lo que se
sabe.
* **Sabiduría:** Conjunto de conocimientos que se vuelven parte del ser.
Interiorizan el conocimiento.
* **Inteligencia:** Es la capacidad de resolver un problema. Es independiente de
los seres vivos. La capacidad de aprender $\neq$ ser inteligente.
* **Artificial:** Cuya existencia fue mediada por la inteligencia.
* **Aprendizaje:** Requiere estructuras elavoradas.
* **Problema:** Conjunto de acciones para pasar del estado A al estado B.
* **Racionalidad:** Hacer lo correcto (lo que uno espera) de acuerdo a lo que
conocemos, lo correcto puede ir cambiando a medida que avanzamos en el conocimiento
que tenemos.
* **Razón:** Establecer relaciones entre ideas o conceptos y obtener
conclusiones.
* **Razonar:** Pensar en secuencia, con una estructura. Es una forma de ser
racional.
* **Ética:** Define qué es lo correcto e incorrecto.
* **Ethos:** Es el ser, lo que lo define a uno.
* **Equivocación:** 1ra vez que no obtiene el resultado esperado.
* **Error:** Realiza una acción sabiendo que **no** da lo que debe dar.
* **Agentes:** Pueden ser autónomas o no, que hagan lo correcto respecto a lo
que **ellos** conocen. Tiene un objetivo, resolver un problema, lo cuál define la
inteligencia del agente.

## Tareas

1. Definir qué es "artificial"

	**Fecha de asignación:** 24 de agosto de 2020

	[Ensayo de lo natural y lo artificial](https://www.oei.es/historico/salactsi/teorema04b.htm)

	_... Platón defendía que todos los artefactos (incluyendo las obras de arte)
	son imitaciones de algo natural, de algo genuino u original. Para Platón,
	decir que algo es "artificial" es decir que esa cosa parece ser, pero no es
	realmente, aquello que imita. Lo artificial es meramente aparente; lo único
	que hace es mostrar cómo es alguna otra cosa..._

	_... Aristóteles planteaba la cuestión de un modo diferente. Creía que la
	naturaleza y el arte (lo natural y lo artificial) no tienen nada en común;
	constituyen dos esferas diferentes de la realidad. En consecuencia, las leyes
	que gobiernan estos dos tipos de entidades difieren de forma esencial y, por
	esta razón, el conocimiento de ambas también es distinto. La ciencia natural
	no incluye el saber-cómo de los instrumentos, las herramientas y las máquinas,
	y éstas últimas no ofrecen ninguna ayuda para el conocimiento de las entidades
	naturales. Se trata de dos tipos distintos de conocimiento. Los entes
	naturales tienen una forma primaria, mientras que los artificiales tienen una
	forma secundaria que los agentes humanos les imponen. Según Aristóteles
	(Charlton, 1970), lo natural  "tiene en sí mismo la fuente de su propia
	formación", mientras que en el caso de lo artificial, "la fuente es distinta y
	externa". Los casos paradigmáticos de lo artificial ya no son (como lo eran
	para Platón) flores o pájaros artificiales, muñecas y estatuas, sino, e.g., la
	rueda, que no es algo dado en la naturaleza como medio de transporte. Los
	artefactos no son imitaciones de algo dado previamente, sino auténticas
	invenciones; representan algo nuevo, no una simple e imperfecta copia de un
	prototipo..._

2. Ensayo grupal sobre el pasado, presente y futuro de la IA.

	**Fecha de asignación:** 24 de agosto de 2020

	La inteligencia artificial tuvo sus orígenes en el trabajo de Warren McCulloc y
	Walter Pitts (1943), quienes propusieron un modelo construido por neuronas
	artificiales, cuyo estado (activas o inactivas) era producto de la estimulación
	producida por las neuronas vecinas. En 1949 Dorian Hebh propuso una regla para
	modificar las intensidades de conexiones entre neuronas, denominada ahora regla
	de aprendizaje Hebbiano o de Hebb. Posteriormente en 1950 Alan Turing, en su
	artículo \textit{Computing Machinery and Intelligence}, introduce la prueba de
	Turing, el aprendizaje automático, los algoritmos genéricos y el aprendizaje
	por refuerzo. A partir de allí diferentes figuras aparecieron y complementaron
	o reforzaron las ideas ya propuestas, llegando a posicionar la IA como una
	rama de la informática que incorpora los conocimientos de diferentes campos
	como lo son las matemáticas, la economía, neurociencia, estadística, entre
	otros. En el año 1958 McCarthy definió el lenguaje de alto nivel Lisp, que se
	convertiría en el lenguaje de programación dominante en la IA y Marvin Minsky
	supervisó el trabajo de una serie de estudiantes, que se ocuparon de unos
	problemas de dominios limitados, conocidos como micromundos, los cuales fueron
	pioneros en la concepción de agentes específicos, creados para resolver
	pequeñas tareas en un espacio de trabajo bien limitado. \\

	Como podemos ver, en los primeros años se buscó expandir, descubrir y explorar
	nuevos caminos de la IA, sin embargo, estos también iban ligados al desarrollo
	de hardware, donde  el planteamiento de algoritmos y estructuras de software
	que resolvían algunos problemas, se veían limitados por el poco alcance a
	nivel de capacidad y rendimiento computacional de la época, esto ha cambiado
	en el transcurso de los años.\\

	La IA ha tenido grandes avances y esta ha sido aplicada en diferentes áreas,
	particularmente en las áreas de procesamiento del lenguaje natural, visión por
	computadora y robótica. Además en el área de la salud, como por ejemplo en la
	detección de cáncer (cuyo éxito se debe principalmente al éxito del aprendizaje
	automático) donde la IA se encarga  de recopilar y organizar grandes cantidades
	de información para obtener conocimientos y conjeturas que están más allá de
	las capacidades humanas (procesamiento manual), si bien esto suena a áreas muy
	especificas, cabe resaltar que su uso también se ha desarrollado para ambientes
	más cotidianos como lo son, el realizar cualquier búsqueda en internet, el uso
	de un traductor o cuando recibimos recomendaciones de contenido.\\

	Sin duda en un futuro el impacto de la IA en la vida de los seres humanos será
	sin igual, pero ¿podemos asegurar que todo este poder será utilizado para fines
	buenos o malos?. El alcance de este impacto determinará el éxito de la IA.
	Si bien hoy en día el desarrollo de sistemas de reconocimiento de voz, sistemas
	de vigilancia, robots, motores de búsqueda, etc, han sido  posibles a través de
	la IA, estas tecnologías son más sectorizadas y propias de ciertos grupos de
	personas. Se espera que con el paso de los años, estas tecnologías sean tan
	familiarizadas con la sociedad, como lo es hoy en día el uso de redes de
	comunicación computarizadas, como los celulares e internet, y que su presencia
	en estos entornos tengan un impacto positivo en la vida de las personas.\\

	Pero ¿qué sucederá cuando por fin se logre desarrollar inteligencia al nivel de
	un humano y más allá?, ¿estaremos jugando a cambiar el concepto de inteligencia
	y consciencia? ¿Afectará esto el futuro de la raza humana?.
	Es difícil suponer si habrá un punto donde el haber desarrollado IA con tanta
	autonomía afecte nuestra condición humana, y es por esta razón que creemos que
	toda la investigación y futuros descubrimientos en esta área, sean aplicados
	con responsabilidad ética, para garantizar que este instrumento nos permita
	expandir nuestros conocimientos y romper barreras que antes nos limitaban.
3. f


```
perception = array
f(perception){
	if(perception.localisation == a){
		if(perception. isDirty) {
			return agent.clean
		} else {
			return move.right
		}
	} else { //posición b
		if(perception. isDirty) {
			return agent.clean
		} else {
			return move.right
		}
	}
}
```

percibir: mayor, menor, igual o iniciar
acción mostrar:
```
perception = start
number = 0
f(perception){
	if(perception == start){
		number =  random(0, 100)
	}else if( perception == isLess){
		number = random(0, number)
	} else if (perception == isGreater){
		number = random(number, 100)
	}else {
		return finish()
	}
	return number
}
```