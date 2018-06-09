// A rectangular box
class Box1 {

  // We need to keep track of a Body and a width and height
  Body body;
  float r;
 
  // Constructor
  Box1(float r_, float x, float y) {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
  
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = random(0.1,1);
    fd.friction = 1;
    fd.restitution = 0.00;

    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setAngularVelocity(00);
  }
  

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done1() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    // Is it off the bottom of the screen?
    if (pos.y > height+r) {
      killBody();
      return true;
    }
    if (pos.y < height+r) {
      return false;
    }
    return false;
  }

  void attract(float x,float y) {
    // From BoxWrap2D example
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    // First find the vector going from this body to the specified point
    worldTarget.subLocal(bodyVec);
    Vec2 dir = worldTarget.sub(bodyVec);
    dir.normalize();
    float distance = dir.length();
    distance = constrain(distance,10,20);
    // Then, scale the vector to the specified force
    worldTarget.normalize();
    worldTarget.mulLocal((float) 100);
    // Now apply it to the body's center of mass.
    body.applyForce(worldTarget, bodyVec);
  }


 void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    ellipse(0,0,5,5);
    popMatrix();
    Vec2 vel = body.getLinearVelocity(); 
    body.setLinearVelocity(new Vec2(random(-5,5),random(-5,5)));
 
    if (vel.x > 30) {
      vel.x = 30;
    }
   if (vel.y > 30) {
      vel.y = 30;
    }
   if (vel.x < -30) {
      vel.x = -30;
    }
   if (vel.y < -30) {
      vel.y = -30;
    }  
     //Vec2 wind = new Vec2(20000,0);
     //     if (pos.x < width/2) {
     //applyForce(wind);
     //}   
    }
}
