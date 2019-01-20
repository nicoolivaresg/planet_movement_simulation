float x,y;
float angulo;
float timeinterval;
float lasttimecheck;

void setup(){
  size(800,800);
  background(255);
  
  x = 0;
  y = -200;
  
  
  
  timeinterval = 5000;
  lasttimecheck = millis();
  
  angulo = radians(0);
}


void draw(){
  background(255);
  translate(400,400);
  stroke(0);
  fill(255,0,0);
  ellipse(0,0,10,10);
  if(millis() > lasttimecheck + timeinterval){
      stroke(0);
      fill(255,255,0);
      ellipse(x,y,20,20);
      x = 200 * cos(angulo);
      y = 200 * sin(angulo);
      angulo = angulo + radians(5); 
  }
  
  
  
  //Gravitation();
  
}
