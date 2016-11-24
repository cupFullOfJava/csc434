package com.company;

import java.util.ArrayList;

/**
 * Lexical Analyzer to tokenize problem statements
 * Created by Jeremy Timothy Brown on 8/27/2016.
 */
public class LexicalAnalyzer {

    private static final String NUMS = "0123456789";
    public static final String LWRCASE = "abcdefghijklmnopqrstuvwxyz";
    public static final String OPERATORS = "+-*/";
    public static final String ASSIGN = "=";

    //= {previous state, cur after number, cur after identifier, cur after operator, cur after assignment, cur after start, cur after error}
    public static final String[] START_LIST = {"NUMBER", "IDENTIFIER", "OPERATOR", "ASSIGNMENT", "START", "ERROR"};
    public static final String[] NUMBER_LIST = {"NUMBER", "ERROR", "OPERATOR", "ASSIGNMENT", "START", "ERROR"};
    public static final String[] IDENTIFIER_LIST = {"IDENTIFIER", "IDENTIFIER", "OPERATOR", "ASSIGNMENT", "START", "ERROR"};
    public static final String[] OPERATOR_LIST = {"NUMBER", "IDENTIFIER", "ERROR", "ASSIGNMENT", "START", "ERROR"};
    public static final String[] ASSIGNMENT_LIST = {"NUMBER", "IDENTIFIER", "OPERATOR", "ERROR", "START", "ERROR"};
    public static final String[] ERROR_LIST = {"ERROR", "ERROR", "ERROR", "ERROR", "ERROR", "ERROR"};

    /**
     * This method runs through the expression char by char.
     * It assigns a token to each one and then returns an ArrayList with the states.
     * @param t String the expressions to be tokenized
     */
    public static ArrayList tokenize(String t) {
        String curState;
        String[] curList = START_LIST;

        ArrayList<String> token = new ArrayList<>();

        for (int i = 0; i < t.length(); i++) {
            char curChar = t.charAt(i);

            if (NUMS.indexOf(curChar) != -1){curState = curList[0];}
            else if (LWRCASE.indexOf(curChar) != -1) {curState = curList[1];}
            else if (OPERATORS.indexOf(curChar) != -1) {curState = curList[2];}
            else if (ASSIGN.indexOf(curChar) != -1) {curState = curList[3];}
            else if (Character.isWhitespace(curChar)) {curState = curList[4];}
            else {curState = curList[5];}

            if (curState.equals("START")){curList = START_LIST;}
            else if (curState.equals("NUMBER")){curList = NUMBER_LIST;}
            else if (curState.equals("IDENTIFIER")){curList = IDENTIFIER_LIST;}
            else if (curState.equals("OPERATOR")){curList = OPERATOR_LIST;}
            else if (curState.equals("ASSIGNMENT")){curList = ASSIGNMENT_LIST;}
            else if (curState.equals("ERROR")){curList = ERROR_LIST;}

            if (curState != "START") {
                token.add(curState);
                if(curState.equals("ERROR")){break;}
            }

            //fixes problem with repeating IDENTIFIER and NUMBER tokens in list
            if(token.size()-1 > 0){
                String curItem = token.get(0);
                for(int j = 1; token.size() > j; j++){
                    if(curItem.compareTo(token.get(j)) == 0){
                        token.remove(j);
                    }
                    else{
                        curItem = token.get(j);
                    }
                }
            }
        }
        return token;
    }
}