public class Lettuce extends Crop{
    public Lettuce(){
	super();
	type = "Lettuce";
	health = 100;
    }

    public void grow(){
	addHeight(3);
    }
}
