#!/bin/bash

while true; do
    read -p "Digite o primeiro número: " num1
    read -p "Digite o segundo número: " num2

    echo "Escolha a operação:"
    echo "1 - Adição (+)"
    echo "2 - Subtração (-)"
    echo "3 - Multiplicação (*)"
    echo "4 - Divisão (/)"

    read -p "Digite o número da operação desejada: " operacao

    case $operacao in
        1)
            resultado=$(echo "$num1 + $num2" | bc)
            echo "Resultado: $num1 + $num2 = $resultado"
            ;;
        2)
            resultado=$(echo "$num1 - $num2" | bc)
            echo "Resultado: $num1 - $num2 = $resultado"
            ;;
        3)
            resultado=$(echo "$num1 * $num2" | bc)
            echo "Resultado: $num1 * $num2 = $resultado"
            ;;
        4)
            if [ "$num2" -ne 0 ]; then
                resultado=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Resultado: $num1 / $num2 = $resultado"
            else
                echo "Erro: Divisão por zero não permitida."
            fi
            ;;
        *)
            echo "Opção inválida."
            ;;
    esac

    read -p "Deseja realizar outra operação? (s/n): " continuar
    if [[ "$continuar" != "s" ]]; then
        break
    fi
done

