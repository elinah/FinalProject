public class Weeds{
    int health;

    public Weeds(){
	health=1;
    }

    public void die(){
	health=0;
    }

    public void killCrop(Crop c){
	c.loseHealth();
    }
}