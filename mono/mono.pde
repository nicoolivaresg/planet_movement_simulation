int widthw = 800;
int heightw = 800;
float posx_star = 0;
float posy_star = 0;
float widthstar = 10;
float heightstar = 10;
int weightstar = 10000000; //Unidad: Kg
int weigthplanet = 10000;

void setup(){
  size(800, 800);
  background(255);
  posx_star = widthw/2;
  posy_star = heightw/2;
  
}



void draw(){
    ellipse(posx_star,posy_star,widthstar,heightstar);
   
}
