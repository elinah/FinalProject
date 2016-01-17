class Potato extends Crop{
  Potato(){
    super();
    type = "Potato";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105){
    addHeight(5);
    }
  }
  
  void display(){
    fill(100);
    rect(50,50,50,50);
  }
}