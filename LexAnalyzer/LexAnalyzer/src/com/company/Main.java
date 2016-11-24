package com.company;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Main {

    /**
     *
     * @param args the command line arguments.  Pipe in the desired text file to be read.
     */
    public static void main(String[] args) {
        LexicalAnalyzer la = new LexicalAnalyzer();
        Recognizer rec = new Recognizer();

        try {
            String line;
            File file = new File(args[0]);
            BufferedReader br = new BufferedReader(new FileReader(file));
            while ((line = br.readLine()) != null) {
                System.out.println(line);                           //prints out algebra expression

                ArrayList<String> token = la.tokenize(line);        //sends expression to be tokenized
                System.out.print("Tokenized Form: ");
                for(String t : token){System.out.print(t+"\t");}    //prints out tokenized form

                //sends tokenized expression to the grammar recognizer if no error was found
                if(token.contains("ERROR")){
                    System.out.println("\nError Found. Cannot be sent to Grammar Recognizer\n");
                }
                else{
                    boolean x = rec.start(token);
                    if(x){System.out.println("\nStatement is Valid\n");}
                    else{System.out.println("\nStatement is Invalid\n");}
                }
            }
        } catch (
                IOException ie) {ie.printStackTrace();
        }
    }
}