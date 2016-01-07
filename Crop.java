public abstract class Crop{
    int health;
    int waterLevel;
    String type;

    public Crop(type){
	this.type = type;
	waterLevel = 0;
    }
    public void water{
	waterLevel = 100;
    }
}