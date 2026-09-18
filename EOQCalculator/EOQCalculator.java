//Sophia Burke

import java.util.Scanner;

public class EOQCalculator {
    public static void main(String[] args) {
        Scanner scnr = new Scanner(System.in);

        double D; // Variable for Annual demand in (units/year)
        double S; // Variable for Ordering cost in ($/order)
        double H; // Variable for the holding cost in ($/unit/year)

        System.out.println(); //blank line for formatting
        System.out.print("Enter the annual demand (units): ");
        D = scnr.nextDouble();

        System.out.print("Enter the ordering cost ($ per order): ");
        S = scnr.nextDouble();

        System.out.print("Enter the holding cost ($ per unit per year): ");
        H = scnr.nextDouble();
        System.out.println(); //blank line for formatting

        double EOQ = Math.sqrt((2.0 * D * S) / H);
        double N = D / EOQ;
        double totalOrderingCost = N * S;
        double totalHoldingCost = (EOQ / 2.0) * H;
        double totalAnnualInventoryCost = totalOrderingCost + totalHoldingCost;

        System.out.printf("Economic Order Quantity (EOQ): %.2f units%n", EOQ);
        System.out.println(); //blank line
        System.out.printf("Number of orders per year: %.2f%n", N);

        // Total Cost to Order = N * S
        // N = Number of Orders per Year
        // Total Holding Cost = ((EOQ / 2) * H)
        // Total Annual Inventory Cost = ordering + holding
        System.out.println(); 
        System.out.println("Costs:");
        System.out.println("------");
        System.out.printf("Total ordering cost: $%.2f%n", totalOrderingCost);
        System.out.printf("Total holding cost: $%.2f%n", totalHoldingCost);
        System.out.printf("Total annual inventory cost: $%.2f%n", totalAnnualInventoryCost);
        System.out.println(); 
    }
}
