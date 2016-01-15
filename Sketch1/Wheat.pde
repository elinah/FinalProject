class Wheat extends Crop{
  Wheat(){
    super();
    type = "Wheat";
    health = 100;
  }

  void grow(){
    addHeight(4);
  }
}