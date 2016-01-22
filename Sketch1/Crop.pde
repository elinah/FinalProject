abstract class Crop{
  int health,waterLevel,height,xcor,ycor;
  String type;
  boolean updatePicture = false;

  Crop(int x, int y){
    waterLevel = 100;
    height = 0;
    xcor = x;
    ycor = y;
  }

  void water(){
    waterLevel = 100;
  }
  
  int getWater(){
    return waterLevel;
  }
  
  String toString(){
    return type + " Height: " + height + " Water:" + waterLevel + " (" + xcor + "," + ycor + ")";
  }

  void loseHealth(){
    health -= 2;
  }
  
  void loseWater(){
    if (waterLevel > 0){
    waterLevel -= 5;
    }
}  

  void addHeight(int amount){
    height += amount;
  }
  
  void display(PImage p){
    noTint();
    image(p, xcor, ycor, 50, 50);
  }
  
  void die(){
    noStroke();
    fill(128,89,50);
    rect(xcor, ycor, 50, 50);
  }
  
  abstract void grow();
}