# Validación de Clusters

- Por qué validar la solución de closterización?
  La tecnica es de aprendizaje no supervisado, por lo que no se puede revisar que 
  tan precisos son los resultados.
- ¿Cómo saber si la solución o los clusters definidos son adecuados?

## Validación Interna

Métricas de la estructura del agrupamiento internamente para evaluar que tan  ien o mal se evalua.

- **Coheción:** Que tan cerca están los puntos de cada closter. Lo que se busca es que los elementos sean compactos.
- **Separación de Clusters:** Entre más separados mejor, ya que los grupos estarían bien definidos.
- **Coeficiente de Silhouette:** Utiliza la cohesión como la separación, toma valores entre -1 y 1, entre más cercano sea a 1 es un indicativo de que es una buena clusterización.
## Validación Interna

## Validación Externa

Utiliza información externa o adicional. No es muy común.

## Validación Relativa

Cómo evaluar distintas métricas de validación (interna o externa) para definir que valores darles a los parámetros

# Validación de resultados