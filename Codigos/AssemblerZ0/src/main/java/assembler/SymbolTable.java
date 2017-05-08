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
    	symbol_table.put("R0", 0);
    	symbol_table.put("R1", 1);
    	symbol_table.put("R2", 2);
    	symbol_table.put("R3", 3);
    	symbol_table.put("R4", 4);
    	symbol_table.put("R5", 5);
    	symbol_table.put("R6", 6);
    	symbol_table.put("R7", 7);
    	symbol_table.put("R8", 8);
    	symbol_table.put("R9", 9);
    	symbol_table.put("R10", 10);
    	symbol_table.put("R11", 11);
    	symbol_table.put("R12", 12);
    	symbol_table.put("R13", 13);
    	symbol_table.put("R14", 14);
    	symbol_table.put("R15", 15);
    	
    	symbol_table.put("SCREEN", 16384);
    	symbol_table.put("KBD", 24576);
    	symbol_table.put("SP", 0);
    	symbol_table.put("LCL", 1);
    	symbol_table.put("ARG", 2);
    	symbol_table.put("THIS", 3);
    	symbol_table.put("THAT", 4);
    	

    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
    	
    	symbol_table.put(symbol, address);
    	

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
