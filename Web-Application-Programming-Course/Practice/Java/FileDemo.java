import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;

public class FileDemo {
    public static void main(String[] args) {
        // File f = new File("testing_file_creation.txt");
        // try {
        //     f.createNewFile();
        //     f.canWrite("This is a test");
        // }
        try {
            FileOutputStream fout = new FileOutputStream("testing_file_creation.txt",false);

            for (int i = 0; i < 10; i++){
                fout.write('H');
                fout.write('a');
                fout.write('i');
                fout.write('d');
                fout.write('e');
                fout.write('r');
                fout.write(10);
            }

            fout.write(':');
            fout.write(')');

            fout.close();

            System.out.println("success...");
        }
        catch (FileNotFoundException e) {
            System.err.println("File not found");
        }
        catch (IOException e) {
            System.err.println("Error: could not create file");
        }
    }
}