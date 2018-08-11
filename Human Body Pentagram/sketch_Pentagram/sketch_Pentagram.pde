//Imagenes y Fuentes
PImage head, torso, leftArm, rightArm, leftLeg, rightLeg, paperTexture, 
       airSym, fireSym, earthSym, waterSym, spiritSym;
PFont txt;
//Posición del Fondo
int xBackground, yBackground = 0;
/*
Coordenadas (px) para los elementos del cuerpo, circunferencias y textos/símbolos
*/
int xHead=410,yHead=105;//Cabeza
int xTorso=400,yTorso=260;//Torso
int xArmL=435,yArmL=163,
    xArmR=100,yArmR=168;//Brazos
int xLegL=397,yLegL=336,
    xLegR=186,yLegR=336;//Piernas
int xEllipseA=400,yEllipseA=380,
    xEllipseB=400,yEllipseB=380;//Circunferencias
int xTxtSpirit=405,yTxtSpirit=57,
    xSymSpirit=399,ySymSpirit=32;//Texto y Symbolos Espíritu
int xTxtAir=70,yTxtAir=295,
    xSymAir=73,ySymAir=270;//Texto y Symbolos Aire
int xTxtFire=607,yTxtFire=660,
    xSymFire=620,ySymFire=636;//Texto y Symbolos Fuego
int xTxtEarth=200,yTxtEarth=665,
    xSymEarth=178,ySymEarth=642;//Texto y Symbolos Tierra
int xTxtWater=730,yTxtWater=295,
    xSymWater=724,ySymWater=270;//Texto y Symbolos Agua
int xTxtFooter=400,yTxtFooter=790;//Texto Pentagrama del Cuerpo Humano
/*
Medidas para las figuras circunferencias del pentagrama
*/
int widthEllipseA=630,heightEllipseA=630,widthEllipseB=735,heightEllipseB=735;

//Simbolos alrededor de la circunferencia
String [] symRotating = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
float pattern = TWO_PI/symRotating.length;
int radio = symRotating.length*10;
float i0=0.0;

void setup () {
  //Background
  size (800,830);
  paperTexture = loadImage("BACKGROUND.jpg");
  image(paperTexture,xBackground,yBackground);
}

void draw () {
  /*Trackear e imprimir coordenadas del lienzo con el puntero
 println (mouseX +"," + mouseY);*/
  for(int i=0;i<100;i++){
    float xBlur = random(width);
    float yBlur = random(height);
    color pixelBackground = paperTexture.get(int(xBlur),int(yBlur));
    fill(pixelBackground);
    noStroke();
    ellipse(xBlur,yBlur,10,10);
  }
   //Cabeza
  head=loadImage("HEAD.png"); 
  imageMode(CENTER);
  image(head,xHead,yHead);
  //Torso
  torso=loadImage("TORSO.png");
  imageMode(CENTER);
  image(torso,xTorso,yTorso);
  //Brazo Izquierdo
  leftArm=loadImage("LEFT-ARM.png");
  imageMode(CORNERS);
  image(leftArm,xArmL,yArmL);
  //Brazo Derecho
  rightArm=loadImage("RIGHT-ARM.png");
  imageMode(CORNERS);
  image(rightArm,xArmR,yArmR);
  //Pierna Izquierda
  leftLeg=loadImage("LEFT-LEG.png");
  imageMode(CORNERS);
  image(leftLeg,xLegL,yLegL);
  //Pierna Derecha
  rightLeg=loadImage("RIGHT-LEG.png");
  imageMode(CORNERS);
  image(rightLeg,xLegR,yLegR);
  
  //Circunferencias
  noFill();
  strokeWeight(6);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(xEllipseA,yEllipseA,widthEllipseA,heightEllipseA);
  ellipse(xEllipseB,yEllipseB,widthEllipseB,heightEllipseB);
  //Pentagrama
  strokeWeight(6);
  stroke(#000000);
  line(400,70,198,626);//de Cabeza a Pierna Derecha
  line(400,70,598,626);//de Cabeza a Pierna Izquierda
  line(107,274,696,274);//de Brazo Derecho a Brazo Izquierdo
  line(107,274,598,626);//de Brazo Derecho a Pierna Izquierda
  line(696,274,198,626);//de Brazo Izquierdo a Pierna Derecha
  //Texto y Símbolos
  txt=loadFont("Herculanum-18.vlw");
  /*5 Elementos*/
  textFont(txt,14);
  fill(0);
  text("spirit",xTxtSpirit,yTxtSpirit);
  text("air",xTxtAir,yTxtAir);
  text("fire",xTxtFire,yTxtFire);
  text("earth",xTxtEarth,yTxtEarth);
  text("water",xTxtWater,yTxtWater);
  textAlign(CENTER);
  
  spiritSym=loadImage("spirit.png");
  airSym=loadImage("air.png");
  fireSym=loadImage("fire.png");
  earthSym=loadImage("earth.png");
  waterSym=loadImage("water.png");
  imageMode(CENTER);
  image(spiritSym,xSymSpirit,ySymSpirit);
  image(airSym,xSymAir,ySymAir);
  image(fireSym,xSymFire,ySymFire);
  image(earthSym,xSymEarth,ySymEarth);
  image(waterSym,xSymWater,ySymWater);
  
  text("human body pentagram",xTxtFooter,yTxtFooter);
  /*Elipse con letras
  for (int i=0;i<symRotating.length;i++){
    float xPos = width/2+radio*cos(i*pattern);
    float yPos = height/2+radio*sin(i*pattern);
    pushMatrix();
    translate(xPos,yPos);
    rotate(i0+pattern*i);
    text(symRotating[i],0,0);
    popMatrix();
  }*/
} 
