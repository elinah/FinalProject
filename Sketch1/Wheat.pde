class Wheat extends Crop{
  Wheat(){
    super();
    type = "Wheat";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105){
    addHeight(4);
    }
  }
  
  void display(){
    fill(125);
    rect(50,50,50,50);
  }
}