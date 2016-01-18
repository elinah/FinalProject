class Lettuce extends Crop{
  Lettuce(int x,int y){
    super(x,y);
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
    rect(xcor,ycor,50,50);
  }
}