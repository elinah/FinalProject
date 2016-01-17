abstract class Crop{
  int health,waterLevel,height;
  String type;

  Crop(){
    waterLevel = 100;
    height = 0;
  }

  void water(){
    waterLevel = 100;
  }
  
  int getWater(){
    return waterLevel;
  }
  
  String toString(){
    return type + " Height: " + height + " Water:" + waterLevel;
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