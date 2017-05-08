/**
 * Curso: Elementos de Sistemas
 * Arquivo: AssemblerZ0.java
 */

package assembler;

/**
 * Classe principal que orquestra execução do Assembler.
 * Opções:
 *   <arquivo nasm>      primeiro parametro é o nome do arquivo nasm a ser aberto 
 *   -f <arquivo mif>    parametro indica onde será salvo o arquivo gerado .mif
 */
class AssemblerZ0 {
	public Paser parser;
	public Code  code;
	public SymbolTable symbol;
	public int linha;


    public static void main(String[] args) {
    	parser = new Paser();
    	linha = 0 
    	code = new Code();
    	symbol = new SymbolTable();
    	while(parser.advance()){
    		if (parser.CommandType == Parser.CommandType.L_Command){
    			symbol.addEntry(parser.simbol(),linha);
    		}

    		else if (parser.CommandType == Parser.CommandType.C_Command){
    			linha++
    			System.out.println("111" + code.comp(array) + code.dest(array))

    	}
    
    		else if (parser.CommandType == Parser.CommandType.A_Command){
    			linha++
    			if (paser.isNum()){
    				code.tobinary()
    			}
    			else{

    			}
    			
			}	
    	}
	}
}