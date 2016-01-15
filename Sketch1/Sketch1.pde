PImage img1, img2;
PShape wateringCan, weedRemover;

int rectX, rectY;
int rectSize = 50;
color rectColor;
color rectHighlight;
Tomato t = new Tomato();
//0 = start, 1 = corn, 2 = lettuce, 3 = potato, 4 = tomato, 5 = wheat
boolean[] over = new boolean[6];

void setup(){
  size(600,600);
  background(255);
  fill(128,89,50);
  rect(145,200,300,200);
  line(295,200,295,400);
  line(145,300,445,300);
  img1 = loadImage("watering-can.png");
  wateringCan = createShape(RECT,300,50,200,100);
  wateringCan.setTexture(img1);
  img2 = loadImage("weed-remover.png");
  weedRemover = createShape(RECT,150,50,100,100);
  weedRemover.setTexture(img2);
  rectX = 145;
  rectY = 450;
  rectColor = color(255);
  rectHighlight = color(204);
}

void draw(){
    shape(wateringCan);
    shape(weedRemover);
    update(0, rectX, rectX+rectSize+20, rectY, rectY+rectSize);
      if (over[0]){    
        fill(rectHighlight);
      } else {
        fill(rectColor);
      }
    stroke(0);
    rect(rectX, rectY, rectSize+20, rectSize);
    textSize(30);
    fill(0);
    text("Start", rectX, rectY+30);
}

void update(int index, int x1, int x2, int y1, int y2){
  if (mouseX >= x1 && mouseX <= x2 && 
      mouseY >= y1 && mouseY <= y2){
    over[index] = true;
  } else {
    over[index] = false;
  }
}

/*void moreDraw(){
  update(4, 0, 140, 361, 479);
  if (over[4]){    
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
}*/

void mousePressed(){
  if (over[0]){
    fill(255);
    rect(0,0,140,600);
    line(0,120,140,120);
    line(0,240,140,240);
    line(0,360,140,360);
    line(0,480,140,480);
    textSize(20);
    fill(0);
    text("Corn",10,30);
    text("Lettuce",10,150);
    text("Potato",10,270);
    text("Tomato",10,390);
    text("Wheat",10,510);
    fill(255);
    noStroke();
    rect(145, 450, rectSize+30, rectSize+10);
    noLoop();
  }
  if (over[4]){
    t.display();
  }
}