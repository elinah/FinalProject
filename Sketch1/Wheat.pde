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
  
  void addMoney(boolean b, int i){
    if (b  && (5 - (0.25 * i)) >= 0){
      money += (5 - (0.25 * i));
    } else {
      money += 5;
    }
  }
}