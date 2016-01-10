public abstract class Crop{
    int health,waterLevel,height;
    String type;

    public Crop(){
	waterLevel = 0;
	height = 0;
    }

    public void water(){
	waterLevel = 100;
    }

    public void loseHealth(){
	health -= 1;
    }

    public void addHeight(int amount){
	height += amount;
    }

    public abstract void grow();
}