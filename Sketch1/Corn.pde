class Corn extends Crop{
  Corn(){
    super();
    type = "Corn";
    health = 100;
  }

  void grow(){
    addHeight(3);
  }
  
  void display(){
    fill(25);
    rect(50,50,50,50);
  }
}