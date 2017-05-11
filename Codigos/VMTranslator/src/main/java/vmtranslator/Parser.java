/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package vmtranslator;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem de máquina virtual a pilha,
 * analisa, e oferece acesso aos comandos.
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    /** Enumerator para os tipos de comandos de Linguagem de Máquina Virtua a Pilha. */
    public enum CommandType {
        C_ARITHMETIC,      // comandos aritméticos
        C_PUSH,            // comandos de push
        C_POP,             // comandos de pop
        C_LABEL,           // 
        C_GOTO,            // 
        C_IF,              // 
        C_FUNCTION,        // 
        C_RETURN,          // 
        C_CALL             // 
    }

	BufferedReader br;
	String currentCommand;
    /** 
     * Abre o arquivo de entrada VM e se prepara para analisá-lo.
     * @param file arquivo VM que será feito o parser.
     */
    public Parser(String file) {
		
       //String line = null;
    	try {
    		FileReader fileReader = new FileReader(file);
     		
     		br =new BufferedReader(fileReader);
     	
     		//bufferedReader.close();
     	}
     	catch(FileNotFoundException ex){
     		System.out.println("Unable to open file '" + file + "'"); 
     	}
         catch(IOException ex) {
         	System.out.println("Error reading file '" + file + "'");  
         }
    }

    /**
     * Carrega um comando e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
        currentCommand = "";
    	while(currentCommand!=null){
    			
    	try {
			currentCommand = br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	if (currentCommand != null && !currentCommand.trim().isEmpty() && currentCommand.charAt(0) != ';'){
        return true;
      }}

      return false;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        return currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  C_PUSH para push, por exemplo push constant 1
     *  C_POP para pop, por exemplo pop constant 2
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
		String word = command.split(" ")[0];

		if (word.equals("push")) {
			return CommandType.C_PUSH;
		} else if (word.equals("pop")) {
			return CommandType.C_POP;
		} else if (word.equals("label")) {
			return CommandType.C_LABEL;
		} else if (word.equals("goto")) {
			return CommandType.C_GOTO;
		} else if (word.equals("function")) {
			return CommandType.C_FUNCTION;
		} else if (word.equals("if-goto")) {
			return CommandType.C_IF;
		} else if (word.equals("return")) {
			return CommandType.C_RETURN;
		} else if (word.equals("call")) {
			return CommandType.C_CALL;
		}

		return CommandType.C_ARITHMETIC;
    }
    

    /**
     * Retorna o primeiro argumento de um comando push ou pop passada no argumento.
     * Se for um comando aritmético, retorna o próprio texto do comando 
     * Deve ser chamado somente quando commandType() é diferente de C_RETURN.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String arg1(String command) {
		if (commandType(command) == CommandType.C_ARITHMETIC) {
			return command;
		}

		try {
			return command.split(" ")[1];
		} catch(NullPointerException e) {
			return null;
		}
		
    }

    /**
     * Retorna o segundo argumento de um comando push ou pop passada no argumento.
     * Deve ser chamado somente quando commandType() é C_PUSH, C_POP, C_FUNCTION, ou C_CALL.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public Integer arg2(String command) {
		

		try {
			return Integer.parseInt(command.split(" ")[2]);
		} catch(NullPointerException e) {
			return null;
		}
    }

}
