class Potato extends Crop{
  Potato(int x,int y){
    super(x,y);
    type = "Potato";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105 && season == 3){
      addHeight(2);
    }else if (waterLevel > 25 && height <105){
      addHeight(5);
    }
  }
  
  void addMoney(){
    if (season == 2){
      money += 10;
    } else {
      money += 2;
    }
  }
}