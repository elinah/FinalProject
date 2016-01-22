PImage img1, img2, corn, lettuce, potato, tomato, wheat, weeds, stage1, stage2;

color rectColor;
color rectHighlight;
//0 = start, 1 = corn, 2 = lettuce, 3 = potato, 4 = tomato, 5 = wheat, 6 = watering can,
//7 = weed remover, 8-11 = field 1-4 (respectively), 12 = harvest
boolean[] over = new boolean[13];
boolean[] free = {true, true, true, true};
int[][] fieldcor = {{220,250},{370,250},{220,350},{370,350}};
int[][] fieldarea = {{145,200},{295,200},{145,300},{295,300}};
boolean[] wasOver = {true, true, true, true, true, true, true, true, true, true, true, true, true};
Crop[] field = new Crop[4];
Weeds[] weed = new Weeds[4];
PImage[] pictures = new PImage[4];
boolean startExists = true, wateringCanPressed = false, weedRemoverPressed = false, harvestPressed = false;

void setup(){
  size(640,600);
  background(255);
  fill(128,89,50);
  rect(145,200,150,100);
  rect(295,200,150,100);
  rect(145,300,150,100);
  rect(295,300,150,100);
  img1 = loadImage("watering-can.png");
  image(img1,300,50,200,100);
  img2 = loadImage("weed-remover.png");
  image(img2,150,50,100,100);
  stage1 = loadImage("stage1.png");
  stage2 = loadImage("stage2.png");
  corn = loadImage("corn.png");
  lettuce = loadImage("lettuce.png");
  potato = loadImage("potato.png");
  tomato = loadImage("tomato.png");
  wheat = loadImage("wheat.png");
  weeds = loadImage("weeds.png");
  rectColor = color(255);
  rectHighlight = color(204);
}
void draw(){
  if (!startExists && frameCount % 500 == 0){
     int i = int(random(0,3));
     if (weed[i] == null){
       weed[i] = new Weeds(fieldcor[i][0] - 50, fieldcor[i][1]);
       weed[i].display(weeds);
     }
   }
 for(int i = 0;i < 4;i++){
   if (field[i] != null && frameCount % 100 == 0){
     field[i].loseWater();
     field[i].grow();
     if (weed[i] != null && field[i].health > 0){
       weed[i].killCrop(field[i]);
     }
     System.out.println(field[i]);
   }
   if (field[i] != null && field[i].health == 0){
     field[i].die();
     field[i] = null;
   } else if (field[i] != null && !field[i].updatePicture && field[i].height >= 34 && field[i].height <= 66){
     stroke(0);
     fill(128,89,50);
     rect(fieldarea[i][0],fieldarea[i][1],150,100);
     field[i].display(stage2);
     field[i].updatePicture = true;
   } else if (field[i] != null && field[i].updatePicture && field[i].height >= 67){
     stroke(0);
     fill(128,89,50);
     rect(fieldarea[i][0],fieldarea[i][1],150,100);
     field[i].display(pictures[i]);
     field[i].updatePicture = false;
   } else if (field[i] != null && field[i].height >= 100){
     field[i].harvestable = true;
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
 if (!startExists && !wateringCanPressed && !weedRemoverPressed && !harvestPressed){
   update(1, 0, 140, 0, 120);
   if (!wasOver[1] && over[1]){
     stroke(0);
     fill(rectHighlight);
     rect(0,0,140,120);
     textSize(20);
     fill(0);
     text("Corn",10,30);
     wasOver[1] = true;
   } else if (wasOver[1] && !over[1]){
     stroke(0);
     fill(rectColor);
     rect(0,0,140,120);
     textSize(20);
     fill(0);
     text("Corn",10,30);
     wasOver[1] = false;
   }
   update(2, 0, 140, 121, 240);
   if (!wasOver[2] && over[2]){
     stroke(0);
     fill(rectHighlight);
     rect(0,120,140,120);
     textSize(20);
     fill(0);
     text("Lettuce",10,150);
     wasOver[2] = true;
   } else if (wasOver[2] && !over[2]){
     stroke(0);
     fill(rectColor);
     rect(0,120,140,120);
     textSize(20);
     fill(0);
     text("Lettuce",10,150);
     wasOver[2] = false;
   }
   update(3, 0, 140, 241, 360);
   if (!wasOver[3] && over[3]){
     stroke(0);
     fill(rectHighlight);
     rect(0,240,140,120);
     textSize(20);
     fill(0);
     text("Potato",10,270);
     wasOver[3] = true;
   } else if (wasOver[3] && !over[3]){
     stroke(0);
     fill(rectColor);
     rect(0,240,140,120);
     textSize(20);
     fill(0);
     text("Potato",10,270);
     wasOver[3] = false;
   }
   update(4, 0, 140, 361, 480);
   if (!wasOver[4] && over[4]){
     stroke(0);
     fill(rectHighlight);
     rect(0,360,140,120);
     textSize(20);
     fill(0);
     text("Tomato",10,390);
     wasOver[4] = true;
   } else if (wasOver[4] && !over[4]){
     stroke(0);
     fill(rectColor);
     rect(0,360,140,120);
     textSize(20);
     fill(0);
     text("Tomato",10,390);
     wasOver[4] = false;
   }
   update(5, 0, 140, 481, 600);
   if (!wasOver[5] && over[5]){
     stroke(0);
     fill(rectHighlight);
     rect(0,480,140,120);
     textSize(20);
     fill(0);
     text("Wheat",10,510);
     wasOver[5] = true;
   } else if (wasOver[5] && !over[5]){
     stroke(0);
     fill(rectColor);
     rect(0,480,140,120);
     textSize(20);
     fill(0);
     text("Wheat",10,510);
     wasOver[5] = false;
   }
 }
 if (!startExists){
   update(6, 300, 500, 50, 150);
   if (!wasOver[6] && !weedRemoverPressed && !harvestPressed && (over[6] || wateringCanPressed)){
     tint(180);
     image(img1,300,50,200,100);
     wasOver[6] = true;
   } else if (wasOver[6] && !weedRemoverPressed && !harvestPressed && !over[6] && !wateringCanPressed){
     noTint();
     image(img1,300,50,200,100);
     wasOver[6] = false;
   }
   update(7, 150, 250, 50, 150);
   if (!wasOver[7] && !wateringCanPressed && !harvestPressed && (over[7] || weedRemoverPressed)){
     tint(180);
     image(img2,150,50,100,100);
     wasOver[7] = true;
   } else if (wasOver[7] && !wateringCanPressed && !harvestPressed && !over[7] && !weedRemoverPressed){
     noTint();
     image(img2,150,50,100,100);
     wasOver[7] = false;
   } 
   update(12, 145, 450, 120, 50);
   if (!wasOver[12] && !wateringCanPressed && !weedRemoverPressed && (over[12] || harvestPressed)){
     stroke(0);
     fill(rectHighlight);
     rect(145, 450, 120, 50);
     textSize(30);
     fill(0);
     text("Harvest!", 145, 480);
     wasOver[12] = true;
   } else if (wasOver[12] && !wateringCanPressed && !weedRemoverPressed && !over[12] && !harvestPressed){
     stroke(0);
     fill(rectColor);
     rect(145, 450, 120, 50);
     textSize(30);
     fill(0);
     text("Harvest!", 145, 480);
     wasOver[12] = false;
   }
   if (wateringCanPressed || weedRemoverPressed || harvestPressed){
     update(8, 145, 295, 200, 300);
     if (!wasOver[8] && over[8]){
       stroke(0);
       fill(164,116,68);
       rect(145,200,150,100);
       if (field[0] != null){
         if (field[0].height <= 33){
           field[0].display(stage1);
         } else if (field[0].height <= 66){
           field[0].display(stage2);
         } else {
           field[0].display(pictures[0]);
         }
       }
       if (weed[0] != null){
         weed[0].display(weeds);
       }
       wasOver[8] = true;
     } else if (wasOver[8] && !over[8]){
       stroke(0);
       fill(128,89,50);
       rect(145,200,150,100);
       if (field[0] != null){
         if (field[0].height <= 33){
           field[0].display(stage1);
         } else if (field[0].height <= 66){
           field[0].display(stage2);
         } else {
           field[0].display(pictures[0]);
         }
       }
       if (weed[0] != null){
         weed[0].display(weeds);
       }
       wasOver[8] = false;
     }
     update(9, 296, 445, 200, 300);
     if (!wasOver[9] && over[9]){
       stroke(0);
       fill(164,116,68);
       rect(295,200,150,100);
       if (field[1] != null){
         if (field[1].height <= 33){
           field[1].display(stage1);
         } else if (field[1].height <= 66){
           field[1].display(stage2);
         } else {
           field[1].display(pictures[1]);
         }
       }
       if (weed[1] != null){
         weed[1].display(weeds);
       }
       wasOver[9] = true;
     } else if (wasOver[9] && !over[9]){
       stroke(0);
       fill(128,89,50);
       rect(295,200,150,100);
       if (field[1] != null){
         if (field[1].height <= 33){
           field[1].display(stage1);
         } else if (field[1].height <= 66){
           field[1].display(stage2);
         } else {
           field[1].display(pictures[1]);
         }
       }
       if (weed[1] != null){
         weed[1].display(weeds);
       }
       wasOver[9] = false;
     }
     update(10, 145, 295, 301, 400);
     if (!wasOver[10] && over[10]){
       stroke(0);
       fill(164,116,68);
       rect(145,300,150,100);
       if (field[2] != null){
         if (field[2].height <= 33){
           field[2].display(stage1);
         } else if (field[2].height <= 66){
           field[2].display(stage2);
         } else {
           field[2].display(pictures[2]);
         }
       }
       if (weed[2] != null){
         weed[2].display(weeds);
       }
       wasOver[10] = true;
     } else if (wasOver[10] && !over[10]){
       stroke(0);
       fill(128,89,50);
       rect(145,300,150,100);
       if (field[2] != null){
         if (field[2].height <= 33){
           field[2].display(stage1);
         } else if (field[2].height <= 66){
           field[2].display(stage2);
         } else {
           field[2].display(pictures[2]);
         }
       }
       if (weed[2] != null){
         weed[2].display(weeds);
       }
       wasOver[10] = false;
     }
     update(11, 296, 445, 301, 400);
     if (!wasOver[11] && over[11]){
       stroke(0);
       fill(164,116,68);
       rect(295,300,150,100);
       if (field[3] != null){
         if (field[3].height <= 33){
           field[3].display(stage1);
         } else if (field[3].height <= 66){
           field[3].display(stage2);
         } else {
           field[3].display(pictures[3]);
         }
       }
       if (weed[3] != null){
         weed[3].display(weeds);
       }
       wasOver[11] = true;
     } else if (wasOver[11] && !over[11]){
       stroke(0);
       fill(128,89,50);
       rect(295,300,150,100);
       if (field[3] != null){
         if (field[3].height <= 33){
           field[3].display(stage1);
         } else if (field[3].height <= 66){
           field[3].display(stage2);
         } else {
           field[3].display(pictures[3]);
         }
       }
       if (weed[3] != null){
         weed[3].display(weeds);
       }
       wasOver[11] = false;
     }
   }
   stroke(0);
   fill(255);
   rect(500,0,140,600);
   line(500,150,640,150);
   line(500,300,640,300);
   line(500,450,640,450);
   textSize(20);
   fill(0);
   text("Field 1:",505,17);
   text("Field 2:",505,167);
   text("Field 3:",505,317);
   text("Field 4:",505,467);
   textSize(15);
   for(int i = 0;i < 4;i++){
     if (field[i] != null){
       text(field[i].type,505,37+(i*150));
       text("Water Level: " + field[i].getWater(),505,52+(i*150));
       text("Height: " + field[i].height,505,67+(i*150));
       text("Health: " + field[i].health,505,82+(i*150));
     }
   }
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

int freeWeed(){
  for(int i = 0;i < 4;i++){
    if(weed[i] == null){
      return i;
    }
  }
  return -1;
 }

void mousePressed(){
 if (over[0] && startExists){
   startExists = false;
   fill(255);
   noStroke();
   rect(145, 450, 80, 60);
 } else if (over[6] && !startExists && !weedRemoverPressed && !harvestPressed){
   wateringCanPressed = !wateringCanPressed;
 } else if (over[7] && !startExists && !wateringCanPressed && !harvestPressed){
   weedRemoverPressed = !weedRemoverPressed;
 } else if (over[12] && !startExists && !wateringCanPressed && !weedRemoverPressed){
   harvestPressed = !harvestPressed;
 } else if (!startExists && wateringCanPressed){
   if (over[8] && field[0] != null){
     field[0].waterLevel = 100;
   } else if (over[9] && field[1] != null){
     field[1].waterLevel = 100;
   } else if (over[10] && field[2] != null){
     field[2].waterLevel = 100;
   } else if (over[11] && field[3] != null){
     field[3].waterLevel = 100;
   }
 } else if (!startExists && weedRemoverPressed){
   if (over[8] && weed[0] != null){
     weed[0] = null;
     wasOver[8] = !wasOver[8]; 
   } else if (over[9] && weed[1] != null){
     weed[1] = null;
     wasOver[9] = !wasOver[9];
   } else if (over[10] && weed[2] != null){
     weed[2] = null;
     wasOver[10] = !wasOver[10];
   } else if (over[11] && weed[3] != null){
     weed[3] = null;
     wasOver[11] = !wasOver[11];
   }
 } else if (!startExists){
   int f = freeField();
   if (f != -1){
     if (over[1]){
       Corn c = new Corn(fieldcor[f][0],fieldcor[f][1]);
       field[f] = c;
       c.display(stage1);
       pictures[f] = corn;
     }
     else if (over[2]){
       Lettuce l = new Lettuce(fieldcor[f][0],fieldcor[f][1]);
       field[f] = l;
       l.display(stage1);
       pictures[f] = lettuce;
     }
     else if (over[3]){
       Potato p = new Potato(fieldcor[f][0],fieldcor[f][1]);
       field[f] = p;
       p.display(stage1);
       pictures[f] = potato;
     }
     else if (over[4]){
       Tomato t = new Tomato(fieldcor[f][0],fieldcor[f][1]);
       field[f] = t;
       t.display(stage1);
       pictures[f] = tomato;
     }
     else if (over[5]){
       Wheat w = new Wheat(fieldcor[f][0],fieldcor[f][1]);
       field[f] = w;
       w.display(stage1);
       pictures[f] = wheat;
     }
   }
 }
}