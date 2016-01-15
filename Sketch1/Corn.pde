class Corn extends Crop{
  Corn(){
    super();
    type = "Corn";
    health = 100;
  }

  void grow(){
    addHeight(3);
  }
}