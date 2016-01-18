class Tomato extends Crop{
  Tomato(int x,int y){
    super(x,y);
    type = "Tomato";
    health = 100;
  }

  void grow(){
    if (waterLevel > 25 && height < 105){
      addHeight(5);
    }
  }
  
  void display(){
    fill(50);
    rect(xcor,ycor,50,50);
  }
}