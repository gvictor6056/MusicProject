  int savedTime;
  double totalTime = .5;
  float speed;
  Star[] stars = new Star[150];
  
  void setup() {
    fullScreen();
    background(0);
    savedTime = millis();
    
    for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
  }  
    
  }
  
 void draw() {
   int passedTime = millis() - savedTime;
   if(passedTime > totalTime) {
     println("5 seconds have passed!");
     background(random(255));
     savedTime = millis();
//     Star[] stars = new Star[0];
     
      { 
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
 for (int i = 0; i < stars.length; i++) {
   stars[i].update();
    stars[i].show();
}
      }     
     
   }
 }
