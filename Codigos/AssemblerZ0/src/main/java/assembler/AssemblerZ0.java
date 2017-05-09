/**
 * Curso: Elementos de Sistemas
 * Arquivo: AssemblerZ0.java
 */
package assembler;
import java.io.BufferedReader;
import java.io.FileReader;

import org.w3c.dom.Text;

import assembler.Parser.CommandType;
/**
 * Classe principal que orquestra execução do Assembler.
 * Opções:
 *   <arquivo nasm>      primeiro parametro é o nome do arquivo nasm a ser aberto 
 *   -f <arquivo mif>    parametro indica onde será salvo o arquivo gerado .mif
 */
class AssemblerZ0 {
	public static Parser parser;
	public static Code  code;
	public static SymbolTable symbol_table;
	public int linha;
	
    public static void main(String[] args) {
    	parser = new Parser("teste.txt");
    	int linha = 0 ;
    	code = new Code();
    	
    	
    	symbol_table = parser.getSymbolTable();
    	
    	while(parser.advance()){
    		CommandType L_COMMAND;
			CommandType C_COMMAND;
			CommandType A_COMMAND;
			
			if (parser.commandType("teste.txt") == L_COMMAND){
    			symbol_table.addEntry(parser.symbol(""),linha);
    		}

    		else if (parser.commandType("teste.txt") == C_COMMAND){
    			linha++;
    			bw.write("111" + code.comp(parser.instruction(parser.command())) + code.dest(parser.instruction(parser.command())));

    	}
    		else if (parser.commandType("teste.txt") == A_COMMAND){
    			linha++;
    			if (parser.isNum()){
    				code.toBinary();
    			}
    			else{
    				//converter usando tabela	
    				code.toBinary();

    			}
    			
			}	
    	}
	}
}