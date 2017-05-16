/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/** 
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {

    	//destino dos mnem. codeTest tem tabela com possibilidades
    	//tem que retornar 3 numeros daquela tabelona dos slides (000 pra jump por exemplo)
    	//mnemnonic.length = new mnemnonic
    	if (mnemnonic.length == 4) {
    		if (mnemnonic[3].equals("%D")) {
    			return "010";
    		}
    		else {
    			return "100";
    		}
    		}
    	else if (mnemnonic.length == 3) {
    		if (mnemnonic[2].equals("%D")) {
    			return "010";
    		}
    		else if (mnemnonic[2].equals("%A")) {
    			return "100";
    		}
    		else {
    			return "001";
    			//quarta linha do codetest
    		}
    	}
    	else if (mnemnonic.length == 2) {
    		if (mnemnonic[1].equals("%D")) {
    			return "010";
    		}
    		else {
    			return "100";
    		}
    		}
    	// todos os jumps sao 000!
    	else {
    		return "000";
    	}
    }
    //jean why do you write in english so much stawp dudee
    //Comment vous vous sentiriez se j´écrivais comme ça, hein? Je blague rsrs

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	String[] validInputs = new String[] {"movw","addw","incw","nop","subw","rsubw","decw","notw","negw","andw","orw"};
    	int[] validInputSize = new int[]    {  3,      4,     2,     1,    4,     4,      2,    2,     2,     4,     4};
    	
    	int select = 0;
    	int count = 0;
    	String code = mnemnonic[0];
    	
    	String a = "0";
    	
    	for (String validate: validInputs){ //checks if the input is valid and prepare the selector for a switch case
    		if(validate.equals(code) && validInputSize[count] == mnemnonic.length){
    			count ++;
    			select = count;
    			break;
    		}
    		count++;
    	}
    	
    	String[] betterName = mnemnonic; //why not call it anything that can be correctly read the first time one do.
    	//yes! I know I could just change the argument name, but this is kind of a protest
    	
    	//for (int i = 1; i < betterName.length; i ++){ // checks if a == 1 and mark with input the pointer is.
    		//if(betterName[i].indexOf("(") != -1){
    			//a = "1";
    			//break;
    		//}
    	//}
    	
    	
    	
    	if (betterName.length == 2){
    		if (betterName[1].contains("(%A)") || betterName[1].contains("(%D)")){
    			System.out.println("Alo");
        		a = "1";
        	}
    	}
    	if (betterName.length == 3){
    		if (betterName[1].contains("(%A)") || betterName[1].contains("(%D)")){
    			System.out.println("Mudei");
    			a = "1";
    		}
    	}
    	if (betterName.length == 4){
    		if (betterName[1].contains("(%A)") || betterName[1].contains("(%D)") || betterName[2].contains("(%A)") || betterName[2].contains("(%D)")){
    			System.out.println("Mudei");
    			a = "1";
    		}
    	}
    	
   
    	switch (select){
    	case 1: //mov
    		if (betterName.length == 2){
    			if (betterName[1].contains("-1")){
    				return a + "111010";
    			}
    			if (betterName[1].contains("0")){
    				return a + "101010";
    			}
    			if (betterName[1].contains("1")){
    				return a + "111111";
    			}
    		}
    		if (betterName.length == 3){
    			if (betterName[1].contains("-1") || betterName[2].contains("-1")){
    				return a + "111010";
    			}
    			if (betterName[1].contains("0") || betterName[2].contains("0")){
    				return a + "101010";
    			}
    			if (betterName[1].contains("1") || betterName[2].contains("1")){
    				return a + "111111";
    			}
    		}
    			
    		if(betterName[1].contains("D")){
    			System.out.println(a + "001100");
    			return a + "001100";
    		}
    		else if (betterName[1].contains("A")){
    			System.out.println(a + "110000");
    			return a + "110000";
    		}
    			
    	case 2: //add
    		
    		return a + "000010";
    		
    		
    	case 3: //inc
    		
    		return betterName[1].indexOf("A") == -1 ? "0011111": a + "110111";
    		
    	
    	case 4: //nop
    		return a + "101010";
    		
    		
    	case 5: //sub
    		return a + "010011";
    		
    		
    	case 6: //rsub
    		return a + "000111";
    		
    	case 7: //dec
    		return a + (betterName[1].indexOf("A") != -1 ? "110010":"001110");
    		
    		
    	case 8: //not
    		return a + (betterName[1].indexOf("A") != -1 ? "110001":"001101");
    		
    		
    	case 9: //neg
    		return a + (betterName[1].indexOf("A") != -1 ? "110011":"001111");
    		
    		
    	case 10: //and
    		return a + "000000";
    		
    		
    	case 11: //or
    		return a + "010101";
    		
    	
    	default:
    		return a + "001100";
    	}
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {

    	String code = mnemnonic[0];
    	switch (code){
    	case "jmp":
    		return "111";
    	case "je":
    		return "010";
    	case "jne":
    		return "101";
    	case "jg":
    		return "001";
    	case "jge":
    		return "011";
    	case "jl":
    		return "100";
    	case "jle":
    		return "110";
    	default:
    		return "000";
    	}
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    //feito por sabrina
    public static String toBinary(String symbol) {

    	int temp = Integer.valueOf(symbol);
    	String binaryString = Integer.toBinaryString(temp);

    	while(binaryString.length() < 15) {
    		binaryString = "0" + binaryString;
		}

		return binaryString;
    		
    	//estava saindo com 16 bits entao mudei pra while mesmo...

    }

}
