/**
 * Curso: Elementos de Sistemas
 * Arquivo: AssemblerZ0.java
 */
package assembler;

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
    	parser = new Parser("src/test/resources/testComp.nasm");
    	int linha = 0 ;
    	code = new Code();
    	
    	symbol_table = parser.getSymbolTable();
    	
    	while(parser.advance()){
    		//CommandType L_COMMAND;
			//CommandType C_COMMAND;
			//CommandType A_COMMAND;
			//if (parser.commandType("teste.txt") == CommandType.L_COMMAND){
    		//	symbol_table.addEntry(parser.symbol(""),linha);
    		//}

    		if (parser.commandType(parser.command()) == CommandType.C_COMMAND){
    			linha++;
    			System.out.println("111" + Code.comp(parser.instruction(parser.command())) + Code.dest(parser.instruction(parser.command())));
    	    }
    		else if (parser.commandType(parser.command()) == CommandType.A_COMMAND){
    			linha++;
    			System.out.println(parser.instruction(parser.command()));
    			//Code.toBinary(parser.symbol(""));
    			   			
			}	
    	}
	}
}