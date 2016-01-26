class Corn extends Crop{
  Corn(int x,int y){
    super(x,y);
    type = "Corn";
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
    if (season == 1){
      money += 10;
    } else {
      money += 2;
    }
  }
}