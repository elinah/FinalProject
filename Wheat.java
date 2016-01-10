public class Wheat extends Crop{
    public Wheat(){
	super();
	type = "Wheat";
	health = 100;
    }

    public void grow(){
	addHeight(4);
    }
}
