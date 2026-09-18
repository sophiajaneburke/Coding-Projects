//Sophia Burke

import java.util.Scanner;

//Assumptions: 2 cups/person, 8 cups/box, $12.75/box.

public class CoffeeBreakCalculator {
    public static void main(String[] args) {
        Scanner scnr = new Scanner(System.in);

        final int CUPS_PER_PERSON = 2;
        final int CUPS_PER_BOX = 8;
        final double BOX_COST = 12.75;

        //Asks for the number of people
        System.out.println(); //blank line for formatting
        System.out.print("Enter the number of people attending the coffee break: ");

        int people = scnr.nextInt();

        int totalCups = people * CUPS_PER_PERSON;
        int boxesNeeded = (int) Math.ceil(totalCups / (double) CUPS_PER_BOX);
        double totalCost = boxesNeeded * BOX_COST;

        //Prints out
        //1. Number of people 2. Number of coffee boxes needed 3.Total cost
        System.out.printf("Number of people: %d%n", people);
        System.out.printf("Number of coffee boxes needed: %d%n", boxesNeeded);
        System.out.printf("Total cost: $%,.2f%n", totalCost);
        System.out.println();
    }
}

