# Clase 15
## Congruencia módulo

$$
a \equiv b (mod n)\hspace{0.3cm} if \quad

\left\{
\begin{aligned}
  &n | (a-b)\\
  &a \mkern5mu mod(n) = b \mkern5mu mod(n)
\end{aligned}
\right.
$$

## Coprimos, primos relativo  s

Números que tienen como máximo común divisor el 1.
$$gcd(234, 67) = 1$$

# Grupo multiplicativo de los $z_n$

$$z_n^* = \{a \in z_n: gcd(a, n) = 1 \}$$

$\phi(n) = |z_n^*|$ es la cantidad de enteros entre [0, n-1] que son coprimos a n

$$z_n^* = {1, 2, 4, 5, 8, 10, 11, 13, 16, 17, 19, 20}, \phi(21) = \phi(3)\phi(7) = 12$$
$\phi(21)$ tiene 12 elementos

## Teoréma de Euler

$$ if\mkern5mu a \in z_n^*, a^{\phi(n)} \equiv 1 \mkern5mu mod(n) $$

## El orden de un entero

$$ord(a) = min(t:a^t \equiv 1 \mkern5mu mod(n))$$

Ejemplo:

$$ord(5) = min(t: 5^t \equiv 1 \mkern5mu mod(7)) = 6$$
