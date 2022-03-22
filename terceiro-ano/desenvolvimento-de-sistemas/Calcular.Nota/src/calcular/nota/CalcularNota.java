
package calcular.nota;
import java.util.Scanner;

public class CalcularNota {

  
    public static void main(String[] args) {
        Scanner t = new Scanner(System.in);
        int respostaUsuario = 0;
        
        do{
             System.out.println("Bem vindo a calculadora!");
              System.out.println("digite a primeira nota média");
              int nota1 = t.nextInt();
              Limpar();
              
              System.out.println("digite a segunda nota média");
              int nota2 = t.nextInt();
              Limpar();
              
              System.out.println("digite a terceira nota média");
              int nota3 = t.nextInt();
              Limpar();
              
              System.out.println("digite a quarta nota média");
              int nota4 = t.nextInt();
              Limpar();
              
              
             int media = (nota1 + nota2 + nota3 + nota4)/4;
             
             System.out.printf("Sua média é: %d \n", media);
             System.out.println("Deseja calcular novamente a média? 0-sim 1-não");
             respostaUsuario = t.nextInt();
              
              
        }while(respostaUsuario == 0);
       
        
        t.close();
    }
    
    public static void Limpar() {
		
		for (int i = 0; i < 50; ++i) System.out.println ();
	}
    
}

