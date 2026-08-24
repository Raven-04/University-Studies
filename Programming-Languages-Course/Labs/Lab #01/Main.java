import java.util.Arrays;

public interface Comparator {
    int compare(double a, double b);
}

public class AscendingOrder implements Comparator {
    @Override
    public int compare(double a, double b) {
        return Double.compare(a, b);
    }
}

public class DescendingOrder implements Comparator {
    @Override
    public int compare(double a, double b) {
        return Double.compare(b, a);
    }
}

public class Main {
    public static void main(String[] args) {
        double A[] = {6.5, 1.1, 3.8, -8.4, 3.1, -5.8};

        System.out.println("Original array: " + Arrays.toString(A));

        SelectionSort(A, null);
        System.out.println("Sorted array (Ascending): " + Arrays.toString(A));

        SelectionSort(A, new DescendingOrder());
        System.out.println("Sorted array (Descending): " + Arrays.toString(A));
    }

    public static void SelectionSort(double A[], Comparator comp) {
        
        if (comp == null) {
            comp = new AscendingOrder();
        }
        
        for (int i = 0; i < A.length - 1; i++) {
            int min_i = i;

            for (int j = i + 1; j < A.length; j++) {
                if (comp.compare(A[j], A[min_i]) < 0) {
                    min_i = j;
                }
            }
            
            double temp = A[i];
            A[i] = A[min_i];
            A[min_i] = temp;
        }
    }
}