/**
 * Curso: Elementos de Sistemas
 * Arquivo: AssemblerZ0.java
 */
package assembler;
import java.io.BufferedReader;
/**
 * Classe principal que orquestra execução do Assembler.
 * Opções:
 *   <arquivo nasm>      primeiro parametro é o nome do arquivo nasm a ser aberto 
 *   -f <arquivo mif>    parametro indica onde será salvo o arquivo gerado .mif
 */
class AssemblerZ0 {
	public Paser parser;
	public Code  code;
	public symbol_table;
	public int linha;
	
    public static void main(String[] args) {
    	parser = new Paser();
    	linha = 0 ;
    	code = new Code();
    	FileReader arq = new FileReader(<arquivo nasm>);
    	
    	symbol_table = parser.getSymbolTable(arq);
    	
    	while(parser.advance()){
    		if (parser.CommandType() == Parser.CommandType.L_Command){
    			symbol.addEntry(parser.Simbol(),linha);
    		}

    		else if (parser.CommandType() == Parser.CommandType.C_Command){
    			linha++;
    			arq.write("111" + code.Comp(parser.Instruction(parser.Command)) + code.Dest(parser.Instruction(parser.Command)));

    	}
    		else if (parser.CommandType() == Parser.CommandType.A_Command){
    			linha++
    			if (paser.isNum()){
    				code.tobinary();
    			}
    			else{
    				//converter usando tabela	
    				code.tobinary();

    			}
    			
			}	
    	}
	}
}