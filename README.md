# Compiladores y Lenguajes - GR2SW - ICCD422

Repositorio, ejercicios de Lex & Yacc 

## Integrantes
- Niurka Vanesa Yupanqui 
- Muela Joset
- Tumailli Favio

## Estructura del proyecto

COMPILADORES-GR2SW/
└── IIB/
    ├── PRUEBA0/   Ejercicio 0: Reconocedor de secuencias 0^n 1^n (n>=1)
    ├── PRUEBA1/   Ejercicio 1: Calculadora ambigua (+, -)
    ├── PRUEBA2/   Ejercicio 2: Calculadora ambigua (+, -, *, /, ^, parentesis)
    └── PRUEBA3/   Gramatica NO ambigua para expresiones aritmeticas

Cada carpeta debe contener 7 archivos al terminar:
- gcl.l — código fuente Lex
- gcl.y — código fuente Yacc
- y.tab.c, y.tab.h, y.output — generados por yacc
- lex.yy.c — generado por lex
- a.out — ejecutable final

## Cómo compilar cualquier ejercicio

cd IIB/PRUEBAX
yacc -d -v gcl.y
lex gcl.l
gcc lex.yy.c y.tab.c -lfl -o a.out
./a.out

## Cómo colaborar (equipo)

1. Clonar el repo:
git clone https://github.com/NiurkaVane11/proyecto-compiladores.git

2. Antes de empezar a trabajar, traer los últimos cambios:
git pull origin main

3. Trabajar dentro de la carpeta asignada (PRUEBA0, PRUEBA1, PRUEBA2)

4. Subir los cambios:
git add .
git commit -m "Descripcion de lo que hiciste"
git push origin main
