# Introducción a la criptografía y a la seguridad de la Información - ICS

* **Periodo:** 2020-II
* **Grupo:** 1
* **Profesor** 	Jorge Eliecer Camargo Mendoza
* **Correo:** jecamargom@unal.edu.co
* **Página del curso:**
  * [2020-I](https://sites.google.com/site/cryptounal20201/)
  * [2020_II](https://sites.google.com/site/cryptounal20202/)
* **Apuntes tomados por:** Guiselle Tatiana Zambrano Penagos

## Diapositivas utilizadas:

* [parte 1](../part_1.pdf)
* [parte 2](../part_2.pdf)

## Tareas

1. Investigar acerca de la guerra de bóers.

   Las guerras de los Bóeresn, fueron dos conflictos armados que tuvieron lugar en
   Sudáfrica entre el Imperio británico y los colonos de origen neerlandés
   llamados afrikáneres, bóeres o voortrekker.

   La primera de estas guerras se desarrolló desde el 16 de diciembre de 1880
   hasta el 23 de marzo de 1881; y la segunda, entre el 11 de octubre de 1899 y el
   31 de mayo de 1902; su resultado fue la victoria del Imperio británico y la
   extinción de las dos repúblicas independientes que los bóeres habían fundado a
   mediados del siglo XIX: el Estado Libre de Orange y la República de Transvaal.

   Fuetes:
   - [Link wikipedia](https://es.wikipedia.org/wiki/Guerras_de_los_B%C3%B3eres)
      Habla de las 2 guerras en general.
   - [Link segunda guerra](https://es.qwe.wiki/wiki/Second_Boer_War)

2. f


## Tareas Extra

1. Complementar infomación de las diapositivas parte 1 y 2.

## Clase 22 de septiembre
### :c
   1	2	3	4
   3	4	2	1
			1	2	3	4
   m1 = 	1	0	1	1
   c1 = 	1	1	0	1

			1	2	3	4
   m2 = 	0	0	0	1
   c2 = 	0	1	0	0

         1	2	3	4
   m3 = 	0	1	0	0
   c3 = 	0	0	1	1

         1	2	3	4
   m4 = 	1	0	1	0

### CBC

   C0 = 	1	0	1	0

### CFB

```
E:
1	2	3	4
2	3	4	1

```
r = 3

n = 4

```
m1 = 	1	0	1
m2 = 	1	0	0
m3 = 	0	1	0
m4 = 	1	0	0
m5 = 	1	0	1
```

IV = 	1	0	1	0

- j = 1

	```
	I_j = 	1	0	1	0
	O_j = 	0	1	0	1
	t_j = 		0	1	0
	m_j = 	1	0	1
	c_j = 	m_j XOR t_j =	1	1	1
	I_j+1 =	2^r X I_j + c_j mod 2^n
	I_j+1 = (8 * 10 + 7) =  (87) mod 16
	```

- j = 2
	```
  I_j = 	0	1	1	1
	O_j =	1	1	1	0
	t_j	= 		1	1	1
	m_j	=		1	0	0
	c_j = 	0	1	1
	I_j+1	= (8 * 7 + 3) mod 16 = (59) mod 16 = 11
	I_j+1 =	1	0	1	1
	```

- j = 3
	```
  I_j =	1	0	1	1
	O_j	=	0	1	1	1
	t_j	=		0	1	1
	m_j	=	0	1	0
	c_j	=	0	0	1
	I_j+1 =	(8 * 11 + 1) mod 16 = 89 mod 16 = 9
	I_j+1 =	1	0	0	0
	```
- j = 4
	```
	I_j	=	1	0	0	1
	O_j	=	0	0	1	1
	t_j	=		0	0	1
	m_j	=	1	0	0
	c_j	=	1	0	1
	```
### OFB

r = 3

n = 4

```
m1 = 	1	0	1
m2 = 	1	0	0
m3 = 	0	1	0
m4 = 	1	0	0
m5 = 	1	0	1
```

IV = 	1	0	1	0

```
E:
1	2	3	4
2	3	4	1
```
- j = 1
	```
	I_j	=	1	0	1	0
	O_j	=	0	1	0	1
	t_j	=		0	1	0
	m_j	=		1	0	1
	c_j	=		1	1	1
	I_j+1	=	0	1	0	1
	```
- j = 2
	```
	I_j	=	0	1	0	1
	O_j	=	1	0	1	0
	t_j	=		1	0	1
	m_j	=		1	0	0
	c_j	=		0	0	1
	I_j+1	=	1	0	1	0
	```
- j = 3
	```
	I_j	=	1	0	1	0
	O_j	=	0	1	0	1
	t_j	=		0	1	0
	m_j	=		1	0	0
	c_j	=		1	1	0
	I_j+1	=	0	1	0	1
	```
- j = 4
	```
	I_j	=	0	1	0	1
	O_j	=	1	0	1	0
	t_j	=		1	0	1
	m_j	=		1	0	0
	c_j	=		0	0	1
	I_j+1	=	1	0	1	0
	```
- j = 5
	```
	I_j	=	1	0	1	0
	O_j	=	0	1	0	1
	t_j	=		0	1	0
	m_j	=		1	0	1
	c_j	=		1	1	1
	I_j+1	=	0	1	0	1
	```
