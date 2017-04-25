/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {

    /**
     * Cria a tabela de símbolos.
     */
    private Hashtable<String, Integer> symbol_table = new Hashtable<String, Integer>();


    public SymbolTable() {

    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {

    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public boolean contains(String symbol) {
        return symbol_table.contains(symbol);
    }

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public int getAddress(String symbol) {
        int index = 0;
        List keys = new ArrayList(symbol_table.keySet());
        for (int i = 0; i < keys.size(); i++) {
            String actual_key = (String) keys.get(i);
            if (symbol == actual_key){
                index = i;
            }
        }
        return index;
        }




}
