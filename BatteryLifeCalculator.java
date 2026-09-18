
import java.util.Scanner;

public class BatteryLifeCalculator {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Welcome to Sophia's battery life calculator  program.");

        System.out.print("What is your Battery Capacity in milliamp-hours?): ");
        double batteryCapacity = input.nextDouble();

        System.out.print("Okay, what is your Average Drain Rate in milliamps?: ");
        double avgDrainRate = input.nextDouble();

        System.out.print("What is your average screen-on time per day (hours): ");
        double avgScreenTime = input.nextDouble();

        // Calculations
        double batteryLifeHours = batteryCapacity / avgDrainRate;
        double batteryLifeDays = batteryLifeHours / avgScreenTime;

        System.out.printf("Estimated battery life: %.2f hours%n", batteryLifeHours);
        System.out.printf("That is approximately %.2f days of usage based on %.2f hours/day.%n", 
                          batteryLifeDays, avgScreenTime);

        input.close();
    }
}
