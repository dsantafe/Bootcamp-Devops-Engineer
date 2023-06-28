# !/bin/bash
# Descripción: Tipos de Operadores
# Autor: David Santafe
# Fecha: 2023-06-24

NUMERO_A=10
NUMERO_B=4

echo -e "\nOperadores Aritméticos"
echo "Número: A = $NUMERO_A y B = $NUMERO_B"
echo "Sumar A + B =" $((NUMERO_A + NUMERO_B))
echo "Restar A - B=" $((NUMERO_A - NUMERO_B))
echo "Multiplicar A * B =" $((NUMERO_A * NUMERO_B))
echo "Dividir A / B =" $((NUMERO_A / NUMERO_B))
echo "Mod A % B =" $((NUMERO_A % NUMERO_B))
echo "Potencia A ** 2 =" $((NUMERO_A ** 2))

echo -e "\nOperadores Relacionales"
echo "Número: A = $NUMERO_A y B = $NUMERO_B"
echo "A > B =" $((NUMERO_A > NUMERO_B))
echo "A < B =" $((NUMERO_A < NUMERO_B))
echo "A >= B =" $((NUMERO_A >= NUMERO_B))
echo "A <= B =" $((NUMERO_A <= NUMERO_B))
echo "A == B =" $((NUMERO_A == NUMERO_B))
echo "A != B =" $((NUMERO_A != NUMERO_B))

echo -e "\nOperadores de Asignación"
echo "Número: A = $NUMERO_A y B = $NUMERO_B"
echo "Sumar A += B =" $((NUMERO_A += NUMERO_B))
echo "Restar A -= B =" $((NUMERO_A -= NUMERO_B))
echo "Multiplicar A *= B =" $((NUMERO_A *= NUMERO_B))
echo "Dividir A /= B =" $((NUMERO_A /= NUMERO_B))
echo "Mod A %= B =" $((NUMERO_A %= NUMERO_B))
