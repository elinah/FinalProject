public class Potato extends Crop{
    public Potato(){
	super();
	type = "Potato";
	health = 100;
    }

    public void grow(){
	addHeight(5);
    }
}
