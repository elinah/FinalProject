class Tomato extends Crop{
  Tomato(){
    super();
    type = "Tomato";
    health = 100;
  }

  void grow(){
    addHeight(5);
  }
  
  void display(){
    fill(50);
    rect(50,50,50,50);
  }
}