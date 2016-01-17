class Lettuce extends Crop{
  Lettuce(){
    super();
    type = "Lettuce";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105){
    addHeight(3);
    }
  }
  void display(){
    fill(75);
    rect(50,50,50,50);
  }
}