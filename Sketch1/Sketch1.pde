PImage img1, img2;
PShape wateringCan, weedRemover;

color rectColor;
color rectHighlight;
//0 = start, 1 = corn, 2 = lettuce, 3 = potato, 4 = tomato, 5 = wheat
boolean[] over = new boolean[6];
boolean[] free = {true, true, true, true};
int[][] fieldcor = {{220,250},{370,250},{220,350},{370,350}};
boolean[] wasOver = {true, true, true, true, true, true};
Crop[] field = new Crop[4];
boolean startExists = true;

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
  rectColor = color(255);
  rectHighlight = color(204);
  shape(wateringCan);
  shape(weedRemover);
}

void draw(){
 for(int i = 0;i < 4;i++){
   if (field[i] != null && frameCount % 100 == 0){
     field[i].loseWater();
     field[i].grow();
     System.out.println(field[i]);
   }
 }
 update(0, 145, 215, 450, 500);
 if (!wasOver[0] && over[0] && startExists){
   stroke(0);
   fill(rectHighlight);
   rect(145, 450, 70, 50);
   textSize(30);
   fill(0);
   text("Start", 145, 480);
   wasOver[0] = true;
 } else if (wasOver[0] && !over[0] && startExists){
   stroke(0);
   fill(rectColor);
   rect(145, 450, 70, 50);
   textSize(30);
   fill(0);
   text("Start", 145, 480);
   wasOver[0] = false;
 }
 update(1, 0, 140, 0, 120);
 if (!wasOver[1] && over[1] && !startExists){
   stroke(0);
   fill(rectHighlight);
   rect(0,0,140,120);
   textSize(20);
   fill(0);
   text("Corn",10,30);
   wasOver[1] = true;
 } else if (wasOver[1] && !over[1] && !startExists){
   stroke(0);
   fill(rectColor);
   rect(0,0,140,120);
   textSize(20);
   fill(0);
   text("Corn",10,30);
   wasOver[1] = false;
 }
 update(2, 0, 140, 121, 240);
 if (!wasOver[2] && over[2] && !startExists){
   stroke(0);
   fill(rectHighlight);
   rect(0,120,140,120);
   textSize(20);
   fill(0);
   text("Lettuce",10,150);
   wasOver[2] = true;
 } else if (wasOver[2] && !over[2] && !startExists){
   stroke(0);
   fill(rectColor);
   rect(0,120,140,120);
   textSize(20);
   fill(0);
   text("Lettuce",10,150);
   wasOver[2] = false;
 }
 update(3, 0, 140, 241, 360);
 if (!wasOver[3] && over[3] && !startExists){
   stroke(0);
   fill(rectHighlight);
   rect(0,240,140,120);
   textSize(20);
   fill(0);
   text("Potato",10,270);
   wasOver[3] = true;
 } else if (wasOver[3] && !over[3] && !startExists){
   stroke(0);
   fill(rectColor);
   rect(0,240,140,120);
   textSize(20);
   fill(0);
   text("Potato",10,270);
   wasOver[3] = false;
 }
 update(4, 0, 140, 361, 480);
 if (!wasOver[4] && over[4] && !startExists){
   stroke(0);
   fill(rectHighlight);
   rect(0,360,140,120);
   textSize(20);
   fill(0);
   text("Tomato",10,390);
   wasOver[4] = true;
 } else if (wasOver[4] && !over[4] && !startExists){
   stroke(0);
   fill(rectColor);
   rect(0,360,140,120);
   textSize(20);
   fill(0);
   text("Tomato",10,390);
   wasOver[4] = false;
 }
 update(5, 0, 140, 481, 600);
 if (!wasOver[5] && over[5] && !startExists){
   stroke(0);
   fill(rectHighlight);
   rect(0,480,140,120);
   textSize(20);
   fill(0);
   text("Wheat",10,510);
   wasOver[5] = true;
 } else if (wasOver[5] && !over[5] && !startExists){
   stroke(0);
   fill(rectColor);
   rect(0,480,140,120);
   textSize(20);
   fill(0);
   text("Wheat",10,510);
   wasOver[5] = false;
 }
}

void update(int index, int x1, int x2, int y1, int y2){
 if (mouseX >= x1 && mouseX <= x2 && 
     mouseY >= y1 && mouseY <= y2){
   over[index] = true;
 } else {
   over[index] = false;
 }
}

int freeField(){
 for(int i = 0;i < 4;i++){
   if(field[i] == null){
     return i;
   }
 }
 return -1;
}

void mousePressed(){
//0 = start, 1 = corn, 2 = lettuce, 3 = potato, 4 = tomato, 5 = wheat
 if (over[0] && startExists){
   startExists = false;
   fill(255);
   noStroke();
   rect(145, 450, 80, 60);
 }
 int f = freeField();
 System.out.println(f);
 if (f != -1 && !startExists){
   if (over[1]){
     Corn c = new Corn(fieldcor[f][0],fieldcor[f][1]);
     field[f] = c;
     c.display();
   }
   else if (over[2]){
     Lettuce l = new Lettuce(fieldcor[f][0],fieldcor[f][1]);
     field[f] = l;
     l.display();
   }
   else if (over[3]){
     Potato p = new Potato(fieldcor[f][0],fieldcor[f][1]);
     field[f] = p;
     p.display();
   }
   else if (over[4]){
     Tomato t = new Tomato(fieldcor[f][0],fieldcor[f][1]);
     field[f] = t;
     t.display();
   }
   else if (over[5]){
     Wheat w = new Wheat(fieldcor[f][0],fieldcor[f][1]);
     field[f] = w;
     w.display();
   }
 }
}