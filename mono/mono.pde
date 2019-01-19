int n_corps = 2;
float escala = 1.342*pow(10,-9);
//Gravitational constraint
float G = 6.647*pow(10,-1);

//Star
Corp star;
float wstar= 1.99*pow(10,10);
float posxstar;
float posystar;
float widthstar = 10;
float heightstar = 10;
float speedXstar = 0;
float speedYstar = 0;

//Planet
Corp planet;
float wplanet = 5.972*pow(10,4);
float posxplanet = 150;
float posyplanet = 50*sqrt(7);
float widthplanet = 20;
float heightplanet = 20;
float speedXplanet;
float speedYplanet;
//Tiempo
float timeinterval;
float lasttimecheck;

Universe U;
int i,j;
float delta;
PVector totalForce;
PVector acceleration;
PVector fij;

void setup(){
  size(800, 800);
  background(255);
  star = new Corp(wstar,0,0,speedXstar,speedYstar);
  planet = new Corp(wplanet,posxplanet,posyplanet,speedXplanet,speedYplanet);
  totalForce = new PVector();
  acceleration = new PVector();
  fij = new PVector();
  totalForce.x = 0;
  totalForce.y = 0;
  acceleration.x = 0;
  acceleration.y = 0;
  lasttimecheck = millis();
  timeinterval = 1;
  delta =0.01;
  speedXplanet = -1000;
  speedYplanet = -1000;
}

void Gravitation(){
  
  if(millis() > (lasttimecheck + timeinterval) && (planet.position.mag() <= 200)){
    
    fij = forceBetween(planet, star);
    //Force between planet -> star
    totalForce.x = totalForce.x + fij.x;
    totalForce.y = totalForce.y + fij.y;
    //Force between star -> planet
    fij = forceBetween(star, planet);
    totalForce.x = totalForce.x + fij.x;
    totalForce.y = totalForce.y + fij.y;
    
    //translate(planet.position.x,planet.position.y);
    PVector.div(totalForce ,planet.mass, acceleration);
    println("BEFORE: ","Force: ", totalForce,"Accel: ",acceleration, "Speed: ",planet.speed, "Pos: ",planet.position);
    //Draw planet
    stroke(0);
    fill(255,255,0);
    ellipse(planet.position.x,planet.position.y,widthplanet,heightplanet);
    //Update speed
    planet.speed.x = planet.speed.x + acceleration.x * delta;
    planet.speed.y = planet.speed.y + acceleration.y * delta;
    //Update position
    planet.position.x = planet.position.x + planet.speed.x * delta;
    planet.position.y = planet.position.y + planet.speed.y * delta;
    println("AFTER: ","Force: ", totalForce,"Accel: ",acceleration, "Speed: ",planet.speed, "Pos: ",planet.position);
    //Restart sums
    totalForce.x = 0;
    totalForce.y = 0;
    acceleration.x = 0;
    acceleration.y = 0;  
}
      
      
}


PVector forceBetween(Corp ci, Corp cj){
  PVector rij = new PVector();
  rij.x = ci.position.x - cj.position.x;
  rij.y = ci.position.y - cj.position.y;
  println("vector diferencia ri - rj: ",rij);
  float rijMag = rij.mag();
  println("magnitud de rij: ",rijMag);
  PVector UnitaryVector = rij.normalize();
  println("vector unitario: ",UnitaryVector);
  PVector Fij = UnitaryVector.mult(- G * ci.mass * cj.mass).div(rijMag);
  return Fij;
  
}

void draw(){
  background(255);
  translate(400,400);
  stroke(0);
  fill(255,0,0);
  ellipse(0,0,widthstar,heightstar);
  Gravitation();
  
}
