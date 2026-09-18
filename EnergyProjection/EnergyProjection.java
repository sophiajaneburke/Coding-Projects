//Sophia Burke

//This program will prompt for current year, consumption (TWh), and IEA/EIA growth rates
//Then it prints a 5 year projection table using constant growth rates.
import java.util.Scanner;

public class EnergyProjection {
    public static void main(String[] args) {
        Scanner scnr = new Scanner(System.in);

        int currentYear;
        double currentConsumptionTWh;
        double ieaRatePct;
        double eiaRatePct;

        System.out.print("Enter the current year: ");
        currentYear = scnr.nextInt();

        System.out.print("Enter the current electricity consumption (TWh): ");
        currentConsumptionTWh = scnr.nextDouble();

        System.out.print("Enter the IEA projected growth rate (%): ");
        ieaRatePct = scnr.nextDouble();

        System.out.print("Enter the EIA projected growth rate (%): ");
        eiaRatePct = scnr.nextDouble();

        // Header for the table
        System.out.printf("%-6s %-22s %s%n", "Year", "IEA Projected Consumption  ", "EIA Projected Consumption");
        System.out.println("============================================================");

        // Series Starting Values
        double iea = currentConsumptionTWh;
        double eia = currentConsumptionTWh;

        // 5 Year Projection
        for (int y = 1; y <= 5; y++) {
            iea = iea + (iea * (ieaRatePct / 100.0));
            eia = eia + (eia * (eiaRatePct / 100.0));
            System.out.printf("%-6d $%,.2f                   $%,.2f%n", currentYear + y, iea, eia);
        }
    }
}
