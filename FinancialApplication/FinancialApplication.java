// Name: Sophia Burke

import java.util.Scanner;

public class FinancialApplication {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);


        System.out.print("Enter the loan amount: ");
        double loanAmount = input.nextDouble();

        System.out.print("Enter the annual interest rate in percent: ");
        double annualRatePercent = input.nextDouble();

        System.out.print("Enter the number of years: ");
        int years = input.nextInt();

        // Convert to monthly rate and months
        double monthlyInterestRate = (annualRatePercent / 100.0) / 12.0;
        int numberOfMonths = years * 12;

        // Calculate monthly payment
        double monthlyPayment = loanAmount * monthlyInterestRate /
                (1.0 - Math.pow(1.0 + monthlyInterestRate, -numberOfMonths));
        // Two digits after the decimal point
        System.out.printf("The monthly payment is: $%.2f%n", monthlyPayment);

        input.close();
    }
}
