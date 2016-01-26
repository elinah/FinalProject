class Wheat extends Crop{
  Wheat(int x,int y){
    super(x,y);
    type = "Wheat";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105 && season == 3){
      addHeight(2);
    }else if (waterLevel > 25 && height <105){
      addHeight(4);
    }
  }
  
  void addMoney(){
    money += 5;
  }
}