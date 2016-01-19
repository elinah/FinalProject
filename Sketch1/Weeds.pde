public class Weeds{
  int health,xcor,ycor;

  Weeds(int x,int y){
     health = 1;
     xcor = x;
     ycor = y;
  }

  void die(){
    health = 0;
  }
  
  int getHealth(){
     return health;
    }

  void killCrop(Crop c){
    c.loseHealth();
  }
  
  void display(PImage p){
    fill(150);
    image(p,xcor,ycor,50,50);
  }
}