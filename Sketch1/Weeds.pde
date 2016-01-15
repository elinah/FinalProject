public class Weeds{
  int health;

  Weeds(){
    health=1;
  }

  void die(){
    health=0;
  }

  void killCrop(Crop c){
    c.loseHealth();
  }
  
  void display(){
    fill(150);
    rect(50,50,50,50);
  }
}