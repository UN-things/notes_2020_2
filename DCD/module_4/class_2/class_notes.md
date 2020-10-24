## Distancias y medidas de similitud

Tipos:
- [Distancia euclidiana](https://www.lifeder.com/distancia-euclidiana/)
- [Distancia Manhattan](https://es.wikipedia.org/wiki/Geometr%C3%ADa_del_taxista)
- [Distancia de Mahalanobis](https://caminosaleatorios.wordpress.com/2020/04/16/tan-cerca-y-tan-lejos-la-distancia-de-mahalanobis/)
- [Paper - Medidas de asociación](http://www.ugr.es/~gallardo/pdf/cluster-2.pdf)

## Reducción de Dimensionalidad

- [Maldición de la dimensionalidad](https://www.iartificial.net/la-maldicion-de-la-dimension-en-machine-learning/): Tener múltiples variables puede no aportar mucha información, en cambio sí algunos problemas:
  - La distancia media entre los datos aumenta con el número de dimensiones
  - La variabilidad de la distancia disminuye exponencialmente con el número de
    dimensiones.
- El procesamiento de datos con múltiples variables puede ser costoso
  computacionalmente y requeriría mucho tiempo.
- Reducir la dimensionalidad, tambipen reduce el ruido.

## Métodos adicionales para reducción de variables

- **Eliminar variables:** Se eliminan variables redundantes o irrelevantes, solo
  es recomendable hacerlo si se tiene el **conocimiento experto** del campo en el
  que se está trabajando para recolectar los datos.
- **Seleccionar variables:** Se utilizan test estadísticos, lo que brinda cierta
  evidencia para seleccionar las variables. La regularización busca a reducir los
  pesos que tienen esta variable para que no tenga mayor incidencia (penalizar el
  modelo). [Paper-técnicas de regularización](http://e-spacio.uned.es/fez/eserv/bibliuned:masterMatavanz-Jrperea/Perea_Luque_JuanRafael_TFM.pdf)
- **Creación de variables:** Cuando dos o más variables se pueden resumir en una
  sola, se requiere **conociemiento experto**.