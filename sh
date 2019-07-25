#!/bin/bash
a=$(echo -e "\e[40m \e[0m")
b=$(echo -e "\e[47m \e[0m")
for i in {1..16}
do
        if [ $[i%2] -eq 0 ];then
                for j in {1..8}
                do
                        e=$b$b$a$a
                        echo -n $e
                done
        else
                for j in {1..8}
                do
                        e=$a$a$b$b
                        echo -n  $e
                done
        fi
        echo " "
done
