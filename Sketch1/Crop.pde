abstract class Crop{
  int health,waterLevel,height;
  String type;

  Crop(){
    waterLevel = 0;
    height = 0;
  }

  void water(){
    waterLevel = 100;
  }

  void loseHealth(){
    health -= 1;
  }

  void addHeight(int amount){
    height += amount;
  }

  abstract void grow();
  abstract void display();
}