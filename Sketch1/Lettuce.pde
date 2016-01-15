class Lettuce extends Crop{
  Lettuce(){
    super();
    type = "Lettuce";
    health = 100;
  }

  void grow(){
    addHeight(3);
  }
}