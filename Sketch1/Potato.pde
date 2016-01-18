class Potato extends Crop{
  Potato(int x,int y){
    super(x,y);
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
    rect(xcor,ycor,50,50);
  }
}