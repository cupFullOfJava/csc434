package com.company;
import java.util.ArrayList;

/**
 * This recognizer takes a tokenized form of an expressions and checks to see if it is in the following grammar.
 * statement -> assign_stmt | expression
 * assign_stmt -> identifier assignment expression
 * expression -> (identifier | number) operator expression | (identifier | number)
 * Created by Jeremy Timothy Brown on 8/30/2016.
 */

public class Recognizer {

    public static final String[] lhsRule = {"statement", "assign_stmt", "expression"};
    public static final String[] rhsRule = {"NUMBER", "IDENTIFIER", "OPERATOR", "ASSIGNMENT"};

    public static boolean start(ArrayList<String> t){
        int liSize = t.size() - 1;

        //checks to see if list has only one string, and checks to see if true
        if(liSize == 0){
            if(t.get(liSize)==rhsRule[0] || t.get(liSize)==rhsRule[1]){
                return true;
            }
        }
        else if(liSize > 1){
            if(t.get(liSize)==rhsRule[0] || t.get(liSize)==rhsRule[1]){     //if last item in list is NUMBER or IDENTIFIER
                t.remove(liSize);                                   //removes last item in list
                t.add(lhsRule[2]);                                  //adds "expression" to end of list
                while(t.get(liSize-1) != rhsRule[3]) {              //while next to last item is not ASSIGNMENT
                    if (t.get(liSize - 1) == rhsRule[2]) {          //if next to last item is OPERATOR
                        if (t.get(liSize - 2) == rhsRule[0] || t.get(liSize - 2) == rhsRule[1]) {     //if item before next to last is NUMBER or IDENTIFIER
                            t.remove(liSize - 1);                   //removes next to last item
                            t.remove(liSize - 2);                   //removes item before next to last item
                            liSize = liSize - 2;                    //reduces list size counter
                            if (liSize == 0 && t.get(liSize) == "expression") {                      //if only item in list is true, this returns true
                                return true;
                            }
                        }
                        else{return false;}                         //if item before next to last is not NUMBER or IDENTIFIER, returns false
                        if(liSize==1){return false;}                //if two items in list, returns false
                    }
                    else{return false;}                             // if next to last item is not OPERATOR, returns false
                }
                //deals with assign_stmt
                if(liSize == 2){        //if three items in list
                    if(t.get(liSize-2)==rhsRule[1] && t.get(liSize-1)==rhsRule[3] &&t.get(liSize)==lhsRule[2]){     //returns true if conditions for assign_stmt are met
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
