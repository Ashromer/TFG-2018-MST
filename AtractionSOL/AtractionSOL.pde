import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.Vec2;

// A reference to our box2d world
Box2DProcessing box2d;

Circle c;
SubAttractor a;

PImage img;
// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<Circle> circles;
ArrayList<SubAttractor> SA;
// A list for all of our rectangles
ArrayList<Box> boxes;
ArrayList<Box1> boxes1;
void setup() {
  size(1750,850);
  smooth();
  
  img = loadImage("fondo.jpg");
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  
  
  // Create ArrayLists  
  boxes = new ArrayList<Box>();
  boxes1 = new ArrayList<Box1>();
  boundaries = new ArrayList<Boundary>();
  circles = new ArrayList<Circle>(); 
  SA = new ArrayList<SubAttractor>();
  


  circles.add(new Circle(42,1075,404));
  circles.add(new Circle(42,783,438)); 
  circles.add(new Circle(55,width/1.8,height/1.8)); 
  // Add a bunch of fixed boundaries
  //SOL
  //Arriba3 
  boundaries.add(new Boundary(PI/10,770,255,230,10));  
  boundaries.add(new Boundary(PI/16,855,125,10,180));
  boundaries.add(new Boundary(PI/7,705,65,230,10)); 
  boundaries.add(new Boundary(PI/3,820,25,10,45));
  boundaries.add(new Boundary(PI/7,630,215,10,150));
  boundaries.add(new Boundary(PI/70,600,130,10,40));
  //Arriba2
  boundaries.add(new Boundary(PI/11,1600,280,300,10));
  boundaries.add(new Boundary(-PI/7,1370,280,200,10));
  boundaries.add(new Boundary(PI/2.5,1330,100,300,10));
  //Arriba1
  boundaries.add(new Boundary(PI/2.8,1230,100,295,10));
  boundaries.add(new Boundary(-PI/.98,1070,220,190,10));
  boundaries.add(new Boundary(-PI/2.3,950,70,300,10));
  //Abajo2
  boundaries.add(new Boundary(0,1640,780,10,180));
  boundaries.add(new Boundary(PI/80,1395,700,-width/3.5,10));
  boundaries.add(new Boundary(0,width/1.53,780,10,150));
  //Abajo3
  boundaries.add(new Boundary(.15,width/1.7,800,10,170));
  boundaries.add(new Boundary(PI/30,780,750,width/3.6,10));
  boundaries.add(new Boundary(.1,540,830,10,100));
  //Abajo4
  boundaries.add(new Boundary(.1,470,830,10,100));
  boundaries.add(new Boundary(PI/30,220,810,width/3.5,10));
  //IzquierdaAbajo
  boundaries.add(new Boundary(-PI/12,110,550,250,10));
  boundaries.add(new Boundary(.1,235,640,10,120));
  boundaries.add(new Boundary(PI/25,120,710,250,10));
  //IzquierdaCentro
  boundaries.add(new Boundary(PI/1.11,80,435,217,10));  
  boundaries.add(new Boundary(PI/.97,300,453,248,10));
  boundaries.add(new Boundary(PI/.83,500,380,200,10));  
  boundaries.add(new Boundary(PI/7,542,266,10,150));
  boundaries.add(new Boundary(PI/3,490,187,10,45));
  boundaries.add(new Boundary(PI/.87,400,220,180,10));  
  boundaries.add(new Boundary(PI/.97,295,265,50,10));
  boundaries.add(new Boundary(-PI/12,105,224,350,10));
  //izquierda arriba
  boundaries.add(new Boundary(PI/.87,389,155,190,10));  
  boundaries.add(new Boundary(PI/.97,287,195,55,10));
  boundaries.add(new Boundary(-PI/12,105,154,350,10));
  boundaries.add(new Boundary(PI/7,440,23,10,200));
  //quioscos y metros (izqu-derecha)
  boundaries.add(new Boundary(0,340,630,60,35));  
  boundaries.add(new Boundary(PI/4,483,465,45,25)); 
  boundaries.add(new Boundary(PI/5.8,578,400,45,25)); 
  boundaries.add(new Boundary(PI/9,738,320,45,25)); 
  boundaries.add(new Boundary(PI/11,850,290,45,25)); 
  boundaries.add(new Boundary(-PI/9,1100,291,60,35)); 
  boundaries.add(new Boundary(-PI/11,1260,345,60,35)); 
  boundaries.add(new Boundary(0,1295,510,135,55)); 
  boundaries.add(new Boundary(-PI/2.2,925,390,55,40)); 
  //carretera
  boundaries.add(new Boundary(PI/25,150,764,275,40)); 
  boundaries.add(new Boundary(PI/12,445,708,175,40)); 
  boundaries.add(new Boundary(PI/25,667,665,325,40));
  boundaries.add(new Boundary(PI/25,1040,620,245,40));
  boundaries.add(new Boundary(-PI/65,1335,615,190,40));
  boundaries.add(new Boundary(-PI/65,1630,630,250,40));
}



void draw() {
  background(255);
  image(img, 5, -95, img.width/2.45, img.height/2.45);
  // We must always step through time!
  box2d.step();

  if (random(1) < 0.05) {
    Box p = new Box(random(4,9), random(840,920),10);
    boxes.add(p);
  }
  if (random(1) < 0.001) {
    Box p = new Box(random(4,9), random(width/1.64,width/1.6),height-10);
    boxes.add(p);
  }
   // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
  
   if (random(1) < 0.05) {
    Box1 p = new Box1(random(2.5,6), random(840,920),10);
    boxes1.add(p);
  }
  if (random(1) < 0.001) {
    Box1 p = new Box1(random(2.5,6), random(width/1.64,width/1.6),height-10);
    boxes1.add(p);
  }
   // Display all the boxes
  for (Box1 b: boxes1) {
    b.display();
  }  
    for (Box b: boxes) {
     b.attract(width/1.8,height/1.8);
    }
  // Display all the boundaries
  for (Boundary wall: boundaries) { 
    wall.display();
  } 
    for (Circle Fuente: circles) {
    Fuente.display();
  }
  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  } 
  for (int i = boxes1.size()-1; i >= 0; i--) {
    Box1 b = boxes1.get(i);
    if (b.done1()) {
      boxes1.remove(i);
    }
  } 
  
  fill(0);
  text("Click mouse to attract boxes",20,20);
  text(mouseX,20,30);
  text(mouseY,20,40);
}
void mousePressed() {
  Box p = new Box(random(2.5,6),mouseX, mouseY);
    boxes.add(p);
}
void mouseDragged() {
   Box p = new Box(random(2.5,6),mouseX, mouseY);
    boxes.add(p);
}
public void keyPressed() {
  if (key == ' ') {
  Box1 p = new Box1(random(2.5,6),mouseX, mouseY);
    boxes1.add(p);
}
}
