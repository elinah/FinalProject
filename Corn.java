public class Corn extends Crop{
    public Corn(){
	super();
	type = "Corn";
	health = 100;
    }

    public void grow(){
	addHeight(3);
    }
}