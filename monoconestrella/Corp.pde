class Corp{
  float mass;
  PVector position;
  PVector speed;
  
  //Constructor
  public Corp(float mass, float posx, float posy, float speedX, float speedY){
    this.mass = mass;
    this.position = new PVector(posx,posy);
    this.speed = new PVector(speedX,speedY);

  }
}
