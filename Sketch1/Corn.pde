class Corn extends Crop{
  Corn(int x,int y){
    super(x,y);
    type = "Corn";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105){
      addHeight(3);
    }
  }
}