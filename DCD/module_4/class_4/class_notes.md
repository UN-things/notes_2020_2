# Métodos de Clusterización

- Introducción
- Tipos de clusterización
- Clusterización Jerárquica
  - Aglomerativo y divisivo
- Clusterización Particional
  - K-means
- Clusterización basada en densidades
  - DBSCAN

## Introducción

Metodología donde agrupamos objetos/observaciones en subgrupos. Los clusters deberían ser homogéneos dentro y heterogéneos entre ellos.

¿Por qué?
- muestra cuál es la estructura interna de la data para encontrar patrones
- entender mejor los datos (segmentación de mercados)
- Puede ser utilizado como un paso previo a análisis predictivo. Genero clusters
  para darle una etiqueta a mis observaciones, luego hago predicción para nuevos
  datos

¿Para qué?
- Resumir de alguna forma todas las variables utilizadas en una nueva variable de
  clases (clusters)
- Definición de una ‘variable latente’ (no se pueden medir ni cuantificar).
- Conocer posibles perfiles de observaciones que existen en la base de datos
- Tomar decisiones de negocio basadas en la segmentación

## Clusterización Jerárquica

Crear una descomposición jerárquica de las observaciones basada en algún criterio
(di)similitud
- Aglomerativo
- Divisivo

Ventajas:

- Fácil de implementar (matemáticamente)
- Se obtiene una jerarquía sobre las observaciones
- No se necesita una definición de número de clusters apriori, el método mismo
  puede sugerir este número
- La estructura jerárquica muchas veces es intuitiva con el conocimiento experto

Desventajas:

- Decisiones arbitrarias frente a la distancia y enlace utilizado
- No es fácil de escalar, aunque es rápido en muchos de los casos

Casi todas las implementaciones utilizan el aglomerativo. La clusterización
divisiva resulta ser más costosa computacionalmente.

### Aglomerativo

**De abajo hacia arriba**

- Empieza con un cluster por cada observación

- Va agrupando estos grupo individuales para formar nuevos clusters de dos o
  más observaciones
- Continúa agrupando los clusters/observaciones hasta generar un único cluster con
  todas las observaciones

**Dificultad:** definir a qué nivel de agrupación se va a llegar.

### Divisivo

**De arriba hacia abajo**

- Empieza con un cluster formado por todas las observaciones
- Va diviendo este gran cluster en clusters más pequeños
- Continúa hasta generar tantos clusters como observaciones hay

### Tipos de enlace

Definir distacias entre dos clusters

- **Enlace mínimo (simple):** Evalúa la distancia mínima entre clusters/
  observaciones.
- **Enlace completo (máximo):** Evalúa la distancia máxima entre clusters/
  observaciones.
- **Enlace promedio:** Evalúa la distancia promedio entre clusters/observaciones.
- **Enlace de centroide:** Evalúa la distancia entre clusters/observaciones como
  la distancia entre sus centroides
- **Ward:** Usa el criterio de varianza minima. En cada paso del algoritmo se
  busca la (des)union que lleve al incremento mínimo de la varianza dentro de los
  clusters

## Clusterización Particional

Construir particiones en los datos y evaluar, de acuerdo a un criterio, que tan
buena es la partición
- K-means
- PAM
- entre otros...

### K-means
## Clusterización basada en densidades
### DBSCAN