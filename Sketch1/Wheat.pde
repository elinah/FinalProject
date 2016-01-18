class Wheat extends Crop{
  Wheat(int x,int y){
    super(x,y);
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
    rect(xcor,ycor,50,50);
  }
}