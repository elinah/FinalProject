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
}