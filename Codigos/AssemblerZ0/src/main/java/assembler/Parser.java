/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.File;
import java.net.URI;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    private List<String> lines;
    private SymbolTable symbolTable;

    /** 
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) {
        symbolTable = new SymbolTable();
        try {
            URI uri = this.getClass().getResource(file).toURI();
            lines = Files.readAllLines(Paths.get(uri),
                    Charset.defaultCharset());

            int i = 0;
            for (String line : lines) {

                // nao é comentario ou nao é label
                if (line.indexOf(';') != 0 || line.contains(":")){
                    i += 1;
                } else if (line.contains(":")){
                    if (!symbolTable.contains(line)) {
                        symbolTable.addEntry(line, i);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public boolean advance() {
        return false;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        return null;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
        if(command[0] == "l" && command[1] == "E" && command[2] == "a") {
            return A_COMMAND;
        }
        else if (command[0] == "a" && command[1] == "d" && command[2] == "d") {
            return C_COMMAND;
        }
        else if (command[0] == "s" && command[1] == "u" && command[2] == "b") {
            return C_COMMAND;            
        }
        else if (command[0] == "r" && command[1] == "s" && command[2] == "u" && command[3] == "b") {
            return C_COMMAND;
        }
        else if (command[0] == "i" && command[1] == "n" && command[2] == "c") {
            return C_COMMAND;            
        }
        else if (command[0] == "d" && command[1] == "e" && command[2] == "c") {
            return C_COMMAND;            
        }
        else if (command[0] == "n" && command[1] == "o" && command[2] == "t") {
            return C_COMMAND;            
        }
        else if (command[0] == "n" && command[1] == "e" && command[2] == "g") {
            return C_COMMAND;            
        }
        else if (command[0] == "a" && command[1] == "n" && command[2] == "d") {
            return C_COMMAND;            
        }
        else if (command[0] == "o" && command[1] == "r") {
            return C_COMMAND;            
        }
        else if (command[0] == "n" && command[1] == "o" && command[2] == "p") {
            return C_COMMAND;            
        }
        else if (command[0] == "s" && command[1] == "u" && command[2] == "b") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "m" && command[2] == "p") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "e") {
            return C_COMMAND;            
        }
        else if (command[0] == "j"0 && command[1] == "n" && command[2] == "e") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "g") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "g" && command[2] == "e") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "l") {
            return C_COMMAND;            
        }
        else if (command[0] == "j" && command[1] == "l" && command[2] == "e") {
            return C_COMMAND;            
        }
        else if (command[0] == "m" && command[1] == "o" && command[2] == "v") {
            return C_COMMAND;
        }
        else {
            return L_COMMAND;
        }
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {

    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        return "";
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        return null;

    }

}
