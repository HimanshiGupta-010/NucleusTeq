import java.io.*;

public class EmployeeManagementApp 
{
    public static void main(String args[]) 
    {
        String filename = "employees.txt";

        // Create a file if it doesn't exist
        try 
        {
            File file = new File(filename);

            if(file.createNewFile()) 
            {
                System.out.println("File created: " + file.getName());
            } 
            else 
            {
                System.out.println("File already exists.");
            }
        } 
        catch (IOException e) 
        {
            System.out.println("An error occurred while creating the file.");
            e.printStackTrace();
        }
        // Add employees to the file
        addEmployeeToFile(filename, "Himanshi Gupta", "Software Engineer", 50000);
        addEmployeeToFile(filename, "Sneha Bhate", "Web Developer", 75000);
        addEmployeeToFile(filename, "Ayushi Vishwakarma", "Framework Engineer", 60000);

        // Display all employees
        System.out.println("All employees:");
        displayAllEmployees(filename);

        // Update an employee's salary
        updateEmployeeSalary(filename, "Himanshi Gupta", 55000);

        // Display all employees again
        System.out.println("All employees after salary update:");
        displayAllEmployees(filename);
    }

    // method to add an employee to the file
    public static void addEmployeeToFile(String filename, String name, String title, double salary) 
    {
        try 
        {
            FileWriter writer = new FileWriter(filename, true);
            writer.write(name + "," + title + "," + salary + "\n");
            writer.close();
            System.out.println("Employee added to file: " + name);
        } 
        catch(IOException e) 
        {
            System.out.println("An error occurred while adding employee to file.");
            e.printStackTrace();
        }
    }
    // method to display all employees in the file
    public static void displayAllEmployees(String filename) {
        try 
        {
            File file = new File(filename);
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
        
            while ((line = reader.readLine()) != null) 
            {
                String[] data = line.split(",");
                String name = data[0];
                String title = data[1];
                double salary = Double.parseDouble(data[2]);
                System.out.println(name + " - " + title + " - $" + salary);
            }
            
            reader.close();
        } 
        catch(IOException e) 
        {
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();
        }
    }
    
    // method to update an employee's salary in the file
    
    public static void updateEmployeeSalary(String filename, String name, double newSalary) 
    {
        try 
        {
            File file = new File(filename);
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            StringBuilder stringBuilder = new StringBuilder();
            boolean found = false;
        
            while ((line = reader.readLine()) != null) 
            {
                String[] data = line.split(",");
                if (data[0].equals(name)) 
                {
                    found = true;
                    stringBuilder.append(name + "," + data[1] + "," + newSalary + "\n");
                    System.out.println("Salary updated for employee: " + name);
                } 
                else 
                {
                    stringBuilder.append(line + "\n");
                }
            }
            reader.close();
            if (!found) {
                System.out.println("Employee not found.");
                return;
            }
            FileWriter writer = new FileWriter(file);
            writer.write(stringBuilder.toString());
            writer.close();
        } catch (IOException e) {
            System.out.println("An error occurred while updating employee salary.");
            e.printStackTrace();
        }
    }
}