class Lettuce extends Crop{
  Lettuce(int x,int y){
    super(x,y);
    type = "Lettuce";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105 && season == 3){
      addHeight(1);
    }else if (waterLevel > 25 && height <105){
      addHeight(3);
    }
  }
  
  void addMoney(boolean b, int i){
    if (b){
      if (season == 3){
        money += (10 - (0.25 * i));
      } else {
        money += (2 - (0.25 * i));
      }
    } else {
      if (season == 3){
        money += 10;
      } else {
        money += 2;
      }
    }
  }
}