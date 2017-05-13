/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package vmtranslator;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.FileNotFoundException;
import java.io.IOException;

/** 
 * Traduz da linguagem vm para c�digos assembly.
 */
public class Code {	
	private BufferedWriter writer;
	private int counter;
    /** 
     * Abre o arquivo de entrada VM e se prepara para analis�-lo.
     * @param filename nome do arquivo VM que ser� feito o parser.
     * @throws IOException 
     */
    public Code(String filename) throws IOException {
    	counter = 0; //feito por sabrina
    	try{
            writer = new BufferedWriter(new FileWriter(filename));
        }catch (FileNotFoundException e){
            System.out.println(e.getMessage());
        }
    }

    /**
     * Grava no arquivo de saida as instru��es em Assembly para executar o comando aritm�tico.
     * @param  command comando aritm�tico a ser analisado.
     * @throws IOException 
     */
    public void writeArithmetic(String command) throws IOException {
	  //Feito por Sabrina
    	try{ 	
    		if(command.equals("add")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		//dec para ir pra posicao anterior do stack pointer
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		//salvar o A depois de ter destruido ele
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("addw (%A), %D, %D");
	    		writer.write("movw %D, (%A)");
	    	
	    	else if(command.equals("sub")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("subw (%A), %D, %D");
	    		writer.write("movw %D, (%A)");
	    		//copiei a logica do meu add e mudei o addw pra subw
	    	}
	    	else if(command.equals("neg")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("negw (%A)");
	    	}
	    	else if(command.equals("eq")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("subw (%A), %D, %D");
	    		writer.write("leaw $LOOP_EQ_"+counter+",%A");
	    		//writer.write("leaw $LOOP_"+Integer.toString(counter)+",%A"); acho q n precisa disso
	    		writer.write("je");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $0, (%A)");
	    		writer.write("leaw $LOOP_FIM_EQ"+counter+",%A");
	    		writer.write("JMP");
	    		writer.write("LOOP_EQ_"+counter+":");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $-1, (%A)");
	    		writer.write("$LOOP_FIM_EQ"+counter+":");
	    		counter += 1;
	    	}
	    	else if(command.equals("gt")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("subw (%A), %D, %D");
	    		writer.write("leaw $LOOP_GT_"+counter+",%A");
	    		writer.write("jg");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $0, (%A)");
	    		writer.write("leaw $LOOP_FIM_GT"+counter+",%A");
	    		writer.write("JMP");
	    		writer.write("LOOP_GT_"+counter+":");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $-1, (%A)");
	    		writer.write("$LOOP_FIM_GT"+counter+":");
	    		counter += 1;
	    	}
	    	else if(command.equals("lt")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("subw (%A), %D, %D");
	    		writer.write("leaw $LOOP_LT_"+counter+",%A");
	    		writer.write("jl");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $0, (%A)");
	    		writer.write("leaw $LOOP_FIM_LT"+counter+",%A");
	    		writer.write("JMP");
	    		writer.write("LOOP_LT_"+counter+":");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("movw $-1, (%A)");
	    		writer.write("$LOOP_FIM_LT"+counter+":");
	    		counter += 1;
	    	}
	    	else if(command.equals("and")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("andw (%A), %D, %D");
	    		writer.write("movw %D, (%A)");
	    		//copiei a logica do meu add e mudei o addw pra andw
	    	}
	    	else if(command.equals("or")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("movw %A, %D");
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw %D, (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A), %D");
	    		writer.write("decw %A");
	    		writer.write("orw (%A), %D, %D");
	    		writer.write("movw %D, (%A)");
	    		//copiei a logica do meu add e mudei o addw pra orw
	    	}
	    	else if(command.equals("not")){
	    		writer.write("leaw $SP, %A");
	    		writer.write("movw (%A), %A");
	    		writer.write("decw %A");
	    		writer.write("notw (%A)");
	    		//copiei a logica do meu neg e mudei o negw pra notw
	    	}
	    	
    		}
    		
    	catch (IOException e) {
        	System.out.println("writeArithmetic error");
        	} 
    	
	   }


    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memória a ser usado pelo comando.
     * @param  index índice do segkento de memória a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {
    	try {
	    	if (segment.equals("local")){
	    		segment = "1";
	    	}	    	
	    	if (segment.equals("argument")){
	    		segment = "2";
	    	}	    	
	    	if (segment.equals("this")){
	    		segment = "3";
	    	}	    	
	    	if (segment.equals("that")) {
	    		segment = "4";
	    	}	    	
	    	if(command.equals(CommandType.C_POP)){
	    		writer.write("leaw $0, %A");
	    		writer.write("movw (%A) , %D");
	    		writer.write("subw %D , $1 , %D");
	    		writer.write("movw %D , (%A)");
	    		writer.write("movw %D, %A");
	    		writer.write("movw (%A) , %D");
	    		writer.write("leaw $segment , %A");
	    		writer.write("movw (%A) , %A");
	    		for (int i = 0; i<index; i++){
	    			writer.write("incw %A");
	    		}	    		
	    	else if(command.equals(CommandType.C_PUSH)){
	    		writer.write("leaw $segment , %A");
	    		writer.write("movw (%A) , %A");
	    		for (int i = 0; i<index; i++){
	    			writer.write("incw %A");
	    		}	    		
	    		writer.write("movw (%A) , %D");
	    		writer.write("leaw $0 , %A");
	    		writer.write("movw (%A) , %A");
	    		writer.write("movw %D , (%A)");
	    		writer.write("incw %A");
	    		writer.write("movw %A , %D");
	    		writer.write("leaw $0 , %A");
	    		writer.write("movw %D , (%A)");
	    	}	    	
	    		writer.write("movw %D , (%A)");
	    	}
	    }
    	
    	catch (IOException e) {
    		System.out.println("writePushPop error");
    	}
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
     * Também prepara a chamada para a função Sys.init
     * O código deve ser colocado no início do arquivo de saída.
     */
    public void writeInit() {
    	try {
    		writer.write("leaw $256, %A");
    		writer.write("movw %A, %D");
    		writer.write("leaw $SP, %A");
    		writer.write("movw (%A), %A");
    		writer.write("movw %A, %D");
    	}
    	catch(IOException e){
    		
    		System.out.println("writeInit error")
    		
    	}

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

    	try {
    		writer.write(label + ":");}
    		        
    catch (IOException e) {
    	System.out.println("Error: Label");}
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {

        try {
        	
            writer.write("leaw %"+label+", %A");
            writer.write("jne");
            writer.write("nop");
            }
        catch (IOException e) {
        	
        }
            System.out.println("writeGoto error");
            
        }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {
    	
    	
    	try {
    		
    		writer.write("leaw" + " %" + label + ", %A");
    		writer.write("jne");
    		writer.write("nop");
    		}
    	
		 catch (IOException error) {
             System.out.println("Error: If");
    	}
}

    /**
     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
     * @param  functionName nome da função a ser "chamada" pelo call.
     * @param  numArgs número de argumentos a serem passados na função call.
     */
    public void writeCall(String functionName, Integer numArgs) {
    	/**
    	 * Curso: Elementos de Sistemas
    	 * Arquivo: Code.java
    	 */

    	package vmtranslator;

    	import java.io.BufferedWriter;
    	import java.io.FileWriter;
    	import java.io.FileNotFoundException;
    	import java.io.IOException;

    	/** 
    	 * Traduz da linguagem vm para c�digos assembly.
    	 */
    	public class Code {	
    		private BufferedWriter writer;
    		private int counter;
    	    /** 
    	     * Abre o arquivo de entrada VM e se prepara para analis�-lo.
    	     * @param filename nome do arquivo VM que ser� feito o parser.
    	     * @throws IOException 
    	     */
    	    public Code(String filename) throws IOException {
    	    	counter = 0; //feito por sabrina
    	    	try{
    	            writer = new BufferedWriter(new FileWriter(filename));
    	        }catch (FileNotFoundException e){
    	            System.out.println(e.getMessage());
    	        }
    	    }

    	    /**
    	     * Grava no arquivo de saida as instru��es em Assembly para executar o comando aritm�tico.
    	     * @param  command comando aritm�tico a ser analisado.
    	     * @throws IOException 
    	     */
    	    public void writeArithmetic(String command) throws IOException {
    		  //Feito por Sabrina
    	    	try{ 	
    	    		if(command.equals("add")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		//dec para ir pra posicao anterior do stack pointer
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		//salvar o A depois de ter destruido ele
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("addw (%A), %D, %D");
    		    		writer.write("movw %D, (%A)");
    		    	
    		    	else if(command.equals("sub")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("subw (%A), %D, %D");
    		    		writer.write("movw %D, (%A)");
    		    		//copiei a logica do meu add e mudei o addw pra subw
    		    	}
    		    	else if(command.equals("neg")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("negw (%A)");
    		    	}
    		    	else if(command.equals("eq")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("subw (%A), %D, %D");
    		    		writer.write("leaw $LOOP_EQ_"+counter+",%A");
    		    		//writer.write("leaw $LOOP_"+Integer.toString(counter)+",%A"); acho q n precisa disso
    		    		writer.write("je");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $0, (%A)");
    		    		writer.write("leaw $LOOP_FIM_EQ"+counter+",%A");
    		    		writer.write("JMP");
    		    		writer.write("LOOP_EQ_"+counter+":");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $-1, (%A)");
    		    		writer.write("$LOOP_FIM_EQ"+counter+":");
    		    		counter += 1;
    		    	}
    		    	else if(command.equals("gt")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("subw (%A), %D, %D");
    		    		writer.write("leaw $LOOP_GT_"+counter+",%A");
    		    		writer.write("jg");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $0, (%A)");
    		    		writer.write("leaw $LOOP_FIM_GT"+counter+",%A");
    		    		writer.write("JMP");
    		    		writer.write("LOOP_GT_"+counter+":");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $-1, (%A)");
    		    		writer.write("$LOOP_FIM_GT"+counter+":");
    		    		counter += 1;
    		    	}
    		    	else if(command.equals("lt")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("subw (%A), %D, %D");
    		    		writer.write("leaw $LOOP_LT_"+counter+",%A");
    		    		writer.write("jl");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $0, (%A)");
    		    		writer.write("leaw $LOOP_FIM_LT"+counter+",%A");
    		    		writer.write("JMP");
    		    		writer.write("LOOP_LT_"+counter+":");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("movw $-1, (%A)");
    		    		writer.write("$LOOP_FIM_LT"+counter+":");
    		    		counter += 1;
    		    	}
    		    	else if(command.equals("and")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("andw (%A), %D, %D");
    		    		writer.write("movw %D, (%A)");
    		    		//copiei a logica do meu add e mudei o addw pra andw
    		    	}
    		    	else if(command.equals("or")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("movw %A, %D");
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw %D, (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A), %D");
    		    		writer.write("decw %A");
    		    		writer.write("orw (%A), %D, %D");
    		    		writer.write("movw %D, (%A)");
    		    		//copiei a logica do meu add e mudei o addw pra orw
    		    	}
    		    	else if(command.equals("not")){
    		    		writer.write("leaw $SP, %A");
    		    		writer.write("movw (%A), %A");
    		    		writer.write("decw %A");
    		    		writer.write("notw (%A)");
    		    		//copiei a logica do meu neg e mudei o negw pra notw
    		    	}
    		    	
    	    		}
    	    		
    	    	catch (IOException e) {
    	        	System.out.println("writeArithmetic error");
    	        	} 
    	    	
    		   }


    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
    	     * @param  command comando de push ou pop a ser analisado.
    	     * @param  segment segmento de memória a ser usado pelo comando.
    	     * @param  index índice do segkento de memória a ser usado pelo comando.
    	     */
    	    public void writePushPop(Parser.CommandType command, String segment, Integer index) {
    	    	try {
    		    	if (segment.equals("local")){
    		    		segment = "1";
    		    	}	    	
    		    	if (segment.equals("argument")){
    		    		segment = "2";
    		    	}	    	
    		    	if (segment.equals("this")){
    		    		segment = "3";
    		    	}	    	
    		    	if (segment.equals("that")) {
    		    		segment = "4";
    		    	}	    	
    		    	if(command.equals(CommandType.C_POP)){
    		    		writer.write("leaw $0, %A");
    		    		writer.write("movw (%A) , %D");
    		    		writer.write("subw %D , $1 , %D");
    		    		writer.write("movw %D , (%A)");
    		    		writer.write("movw %D, %A");
    		    		writer.write("movw (%A) , %D");
    		    		writer.write("leaw $segment , %A");
    		    		writer.write("movw (%A) , %A");
    		    		for (int i = 0; i<index; i++){
    		    			writer.write("incw %A");
    		    		}	    		
    		    	else if(command.equals(CommandType.C_PUSH)){
    		    		writer.write("leaw $segment , %A");
    		    		writer.write("movw (%A) , %A");
    		    		for (int i = 0; i<index; i++){
    		    			writer.write("incw %A");
    		    		}	    		
    		    		writer.write("movw (%A) , %D");
    		    		writer.write("leaw $0 , %A");
    		    		writer.write("movw (%A) , %A");
    		    		writer.write("movw %D , (%A)");
    		    		writer.write("incw %A");
    		    		writer.write("movw %A , %D");
    		    		writer.write("leaw $0 , %A");
    		    		writer.write("movw %D , (%A)");
    		    	}	    	
    		    		writer.write("movw %D , (%A)");
    		    	}
    		    }    	
    	    	catch (IOException e) {
    	    		System.out.println("writePushPop error");
    	    	}
    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
    	     * Também prepara a chamada para a função Sys.init
    	     * O código deve ser colocado no início do arquivo de saída.
    	     */
    	    public void writeInit() {
    	    	try {
    	    		writer.write("leaw $256, %A");
    	    		writer.write("movw %A, %D");
    	    		writer.write("leaw $SP, %A");
    	    		writer.write("movw (%A), %A");
    	    		writer.write("movw %A, %D");
    	    	}
    	    	catch(IOException e){
    	    		
    	    		System.out.println("writeInit error")
    	    		
    	    	}

    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
    	     * @param  label define nome do label (marcador) a ser escrito.
    	     */
    	    public void writeLabel(String label) {

    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
    	     * Realiza um jump incondicional para o label informado.
    	     * @param  label define jump a ser realizado para um label (marcador).
    	     */
    	    public void writeGoto(String label) {

    	        try {
    	        	
    	            writer.write("leaw %"+label+", %A");
    	            writer.write("jne");
    	            writer.write("nop");
    	            }
    	        catch (IOException e) {
    	        	
    	        }
    	            System.out.println("writeGoto error");
    	            
    	        }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
    	     * Realiza um jump condicional para o label informado.
    	     * @param  label define jump a ser realizado para um label (marcador).
    	     */
    	    public void writeIf(String label) {

    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
    	     * @param  functionName nome da função a ser "chamada" pelo call.
    	     * @param  numArgs número de argumentos a serem passados na função call.
    	     */
    	    public void writeCall(String functionName, Integer numArgs) {
    	    	try{
    		    	 globalCounter += 1;
    		    	 writer.write("leaw $return" +functionName + globalCounter.toString() + ", %A"); 
    		         writer.write("movw %A,%D");
    		         writer.write("leaw $SP,%A");
    		         writer.write("movw (%A),%A");
    		         writer.write("movw %D,(%A)");
    		         writer.write('leaw $SP,%A');
    		         writer.write("incw (%A)");
    		    	writePushPop(Parser.CommandType.C_PUSH, 'LCL',0);
    		    	for(int i = 0;i<numargs;i++){
    		    		writePushPop(Parser.CommandType.C_Push,'ARG',i)
    		    	}
    		    	writePushPop(Parser.CommandType.C_PUSH, 'THAT',0);
    		    	writePushPop(Parser.CommandType.C_PUSH, 'THIS',0);
    		    	writer.write("leaw $SP,%A");
    		    	writer.write("movw (%A),%D");
    		    	writer.write("subw $5,%D,%D");
    		    	writer.write("subw $" +numArgs.toString()+",%D,%D");
    		    	writer.write("leaw $ARG,%A");
    		    	writer.write("movw %D,(%A)");
    		    	writer.write("leaw $SP,%A");
    		    	writer.write("movw %A,%D");
    		    	writer.write("leaw $LCL,%A");
    		    	writer.write("movw %D,(%A)");
    		    	writeGoto(functionName);
    		    	writeLabel(('return' + functionName + globalCounter.toString()));
    		    	}
    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
    	     */
    	    public void writeReturn() {

    	    }

    	    /**
    	     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
    	     * @param  functionName nome da função a ser criada.
    	     * @param  numLocals número de argumentos a serem passados na função call.
    	     */
    	    public void writeFunction(String functionName, Integer numLocals) {

    	    }

    	    /**
    	     * Armazena o nome do arquivo vm de origem.
    	     * Usado para definir os dados estáticos do código (por arquivo).
    	     * @param  filename nome do arquivo sendo tratado.
    	     */
    	    public void vmfile(String file) {

    	    vmfile(filename);
    	        
    	        try{
    	            writer = new BufferedWriter(new FileWriter("codeoutput.nasm"));
    	        }
    	        catch (FileNotFoundException e){
    	            System.out.println(e.getMessage());
    	        }
    	    }

    	}

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {
    	try {
	    	writer.write("leaw $LCL,%A");
	    	writer.write("movw (%A),%D");
	    	writer.write("leaw $R13,%A");
	    	writer.write("movw %D,(%A)");
	    	writer.write('leaw $5,%A');
	    	writer.write('movw %A,%D');
	    	writer.write('leaw $R13,%A);
	    	writer.write('subw (%A),%D,%D');
	    	writer.write('leaw $R15,%A');
	    	writer.write("movw %D,(%A)");
	    	writePushPop(Parser.CommandType.C_POP,'ARG',0);
	    	writer.write("leaw $ARG,%A");
	    	writer.write("movw (%A),%D");
	    	writer.write("movw (%A),%D");
	    	writer.write("addw %D,$1,%D");
	    	writer.write("leaw $SP,%A");
	    	writer.write("movw %D,(%A)");
	    	
	    	writer.write('leaw $1,%A');
	    	writer.write('movw %A,%D');
	    	writer.write('leaw $R13,%A);
	    	writer.write('subw (%A),%D,%D');
	    	writer.write('leaw $THAT,%A');
	    	writer.write("movw %D,(%A)");
	    	
	    	writer.write('leaw $2,%A');
	    	writer.write('movw %A,%D');
	    	writer.write('leaw $R13,%A);
	    	writer.write('subw (%A),%D,%D');
	    	writer.write('leaw $THIS,%A');
	    	writer.write("movw %D,(%A)");
	    	
	    	writer.write('leaw $3,%A');
	    	writer.write('movw %A,%D');
	    	writer.write('leaw $R13,%A);
	    	writer.write('subw (%A),%D,%D');
	    	writer.write('leaw $ARG,%A');
	    	writer.write("movw %D,(%A)");
	    	
	    	writer.write('leaw $4,%A');
	    	writer.write('movw %A,%D');
	    	writer.write('leaw $R13,%A);
	    	writer.write('subw (%A),%D,%D');
	    	writer.write('leaw $LCL,%A');
	    	writer.write("movw %D,(%A)");
	    	
	    	 writer.write("leaw $R15, %A");
	         writer.write("jmp");
	         writer.write("nop");
    	}
    	 catch (IOException e) {
             System.out.println("Error : Return");
         }
    }


    /**
     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
     * @param  functionName nome da função a ser criada.
     * @param  numLocals número de argumentos a serem passados na função call.
     */
    public void writeFunction(String functionName, Integer numLocals) {
    	try {
    	writeLabel(functionName);
    	for(int i=0;i<numLocals;i++){
    		writePushPop(Parser.CommandType.C_PUSH,'constant',0);
    		}
    	}
    	 catch (IOException e) {
             System.out.println("Error: Function");
         }
    }	

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estáticos do código (por arquivo).
     * @param  filename nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

    vmfile(filename);
        
        try{
            writer = new BufferedWriter(new FileWriter("codeoutput.nasm"));
        }
        catch (FileNotFoundException e){
            System.out.println(e.getMessage());
        }
    }

}
