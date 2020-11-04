El procesamiento de lenguaje es complejo ya que es semiestructurado y además comprenderlo requiere entender el contexto.

- **Tokenización:** Separar en unidades más sencillas el texto. La unidad más pequeña depende del método de análisis usado. Pueden ser tokens por palabras, oraciones, parrafos, entre otros. Usualmente los tokens son palabras.
- **Lematización:** Transformar el texto, se saca la raíz de las palabras, puede que no tenga sentido, pero al analizar el texto se facilita el procesamiento ya que múltiples palabras pueden ser interpretadas con una global. La lematización del español no es muy buena.
- **Truncación:** Truncar palabras para obtener la raíz de las palabras, es mejor en ciertos en idiomas como inglés pero en el español, por ejemplo, se puede perder mucha información.
- **Remover los stopwords:** Las stopwords son aquellas palabras "vacías" que ayudan a formar las frases pero no tiene ningún significado como unidad.
- **Representaciones de conteos:** Se buscan palabras poco comunes que se repitan en un discurso o texto definido. Es bueno buscar la proporción de repetición de una palabra en un texto de una longitud definida o en una cantidad n de textos o discursos. Este análisis es mejor realizarce luego de transformar y limpiar la fuente original de información.

Problemas
- Se incrementa la dimensionalidad muy rápido
- No se tiene en cuenta el ordenen en el que se encuentran las palabras