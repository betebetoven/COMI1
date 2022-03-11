package com.company;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.nio.charset.StandardCharsets;

import analizadores.Analizador_sintactico;
import analizadores.analizador_lexico;
//import com.*;


public class Main {

    public static void main(String[] args) {
        try {
            //String j;
            //j.getBytes(StandardCharsets.UTF_8)

            analizador_lexico lexico = new analizador_lexico(new BufferedReader(new FileReader("./entrada.txt")));
            System.out.println("ahora va al sintactico");
            //for (int i = 0; i<100;i++)
            //System.out.println(lexico.next_token());

            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            sintactico.parse();
        } catch (Exception e) {
        }
	// write your code here
    }
   /* public void generatelexer(String path)
    {




    }*/
}
