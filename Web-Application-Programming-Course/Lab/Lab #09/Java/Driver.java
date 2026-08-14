import java.io.IOException;
import java.util.ArrayList;

public class Driver {

	public static void main(String[] args) throws IOException {
		Sherlock holmes = new Sherlock("Holmes",22);
		
		ArrayList<String> cl = new ArrayList<String>();
		cl.add("Suitcase");
		cl.add("Map");
		cl.add("Pink Scarf");
		
		Case c = new Case("A study in pink", "Lestrade", cl);
		
		byte[] by = c.serializeCase();
		
		holmes.sleep(by);
		holmes.wake();	
	}
}