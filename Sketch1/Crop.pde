abstract class Crop{
  int health,waterLevel,height,xcor,ycor;
  String type;

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
    health -= 1;
  }
  
  void loseWater(){
    if (waterLevel > 0){
    waterLevel -= 5;
    }
}  

  void addHeight(int amount){
    height += amount;
  }

  abstract void grow();
  abstract void display();
}