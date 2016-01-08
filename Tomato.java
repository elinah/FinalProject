public class Tomato extends Crop{
    public Tomato(){
	super();
	type = "Tomato";
	health = 100;
    }

    public void grow(){
	addHeight(5);
    }
}


    