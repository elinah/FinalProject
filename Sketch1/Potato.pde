class Potato extends Crop{
  Potato(){
    super();
    type = "Potato";
    health = 100;
  }

  void grow(){
    addHeight(5);
  }
}