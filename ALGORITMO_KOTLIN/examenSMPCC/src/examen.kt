

/* Author: Pedro Cruz Caballero
*  Fecha: 23 Octubre 2018
*
*  Problema del arreglo estrictamente incrementable
*
*  Descripcion:
*  El problema consiste, en validar si al recorrer de 0 a N
*  los valores dentro de un arreglo, estos siempre aumentan.
*  De no hacerlo, se tiene una oportunidad de retirar, una sola vez, cualquier
*  elemento del arreglo con la intencion de reparar la secuencia del mismo.
*
*  Si el arreglo ya es incrementable o puede ser reparado con un solo movimiento
*  la función debe devolver VERDADERO, de lo contrario se devuleve FALSO.
*
*
* */
fun main(args : Array<String>) {

    val arr_numerosEnteros = mutableListOf<Int>()
    arr_numerosEnteros.addAll(listOf(1,3,2,1))

    print("Resultado: " + almostIncreasingSequence(arr_numerosEnteros))
}


fun almostIncreasingSequence(sequence: MutableList<Int>) : Boolean{

    // Variable contador, usada para indicar si se ha omitido un valor dentro del arreglo.
    // El valor de esta variable no debe ser mayor a 1, de lo contrario, indicaria que el
    // arreglo no es estrictamente incrementable.
    val contPosicionesRechazadas = 0


    // En caso que el primer valor del arreglo sea mayor o igual al siguiente, se omite el primer valor
    // La variable 'contPosicionesRechazadas', se incrementa, y ahora con valor 1 indicaria que ya se ha
    // hecho uso de nuestra unica oportunidad de corregir el arreglo.
    if (sequence[0] >= sequence[1]){
        contPosicionesRechazadas.inc()
    }



    /* Se recorre el arreglo a partir de la segunda posicion (i = 1)
    * Validando que cada numero sea menor a su vecino siguiente
    *
    * Si el vecino siguiente fuera menor o igual, podemos omitir esta posicion
    * y evaluar la siguiente. Siempre y cuando la variable 'contPosicionesRechazadas'
    * no sea mayor a uno, ya que esto indicaria que queremos realizar una segunda correccion
    *
    * Si el for termina y la variable 'contPosicionesRechazadas' no es mayor a uno
    * se devuelve VERDADERO, indicando que el arreglo es estrictamente incremnetable
    * a lo más con una corrección.
    */
    for (i in 1..sequence.count()-2) {

        if(sequence[i] >= sequence[i+1]) {

            contPosicionesRechazadas.inc()

            if(contPosicionesRechazadas == 2) {
                return false
            }else{
                if( ((i+2)<sequence.count() ) && (sequence[i] >= sequence[i+2]) ){
                    return false
                }else{
                    i.inc()
                }
            }

        }
    }

    return true

}