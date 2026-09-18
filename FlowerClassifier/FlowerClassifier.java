// Sophia Burke

import java.util.Scanner;

public class FlowerClassifier {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // asking the user for questions about the flower, if any criteria go unmet, we'll respond with unkown species
        System.out.print("Enter petal length (cm): ");
        double petalLength = scanner.nextDouble();

        System.out.print("Enter sepal length (cm): ");
        double sepalLength = scanner.nextDouble();

        
        System.out.print("Enter the petal color (red, yellow, purple): ");
        String color = scanner.next().trim().toLowerCase();

        String species = "Unknown Species";

        // deciding response for the probable kind of flower
        if (petalLength > 3.0 && sepalLength < 4.0 && color.equals("red")) {
            species = "Rose";
        } 
        else if ((petalLength >= 2.0 && petalLength <= 5.0)
                && (sepalLength >= 3.0 && sepalLength <= 6.0)
                && color.equals("yellow")) {
            species = "Tulip";
        } 
        else if ((petalLength >= 3.0 && petalLength <= 6.0)
                && (sepalLength >= 4.0 && sepalLength <= 7.0)
                && color.equals("purple")) {
            species = "Iris";
        } 
        else if ((petalLength < 3.0) && (sepalLength < 4.0) && color.equals("yellow")) {
            species = "Daisy";
        } 
        else {
            species = "Unknown species";
        }

        // output
        System.out.println("The flower is likely a " + species + ".");
        System.out.println();

        scanner.close();
    }
}
