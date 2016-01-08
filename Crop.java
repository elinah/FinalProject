public abstract class Crop{
    int health,waterLevel,height;
    String type;

    public Crop(type){
	this.type = type;
	waterLevel = 0;
    }

    public void water(){
	waterLevel = 100;
    }

    public void loseHealth(){
	health-=1;
    }

    public abstract void grow(){}
}