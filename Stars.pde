//create a "Star" class
class Star {
  // variables specify the x and y of each star
  float x;
  float y;
  // this z variable wil be used in a formula to modify the stars position
  float z;

  // avariable to store the previous value of the z variable
  // (the value of the z variable at the previous frame).
  float pz;

  Star() {
    //place values in the variables
    x = random(-width/2, width/2);
    // note: height and width are the same: the canvas is a square.
    y = random(-height/2, height/2);
    // note: the z value can't exceed the width/2 (and height/2) value,
    // beacuse use "z" as divisor of the "x" and "y",
    // whose values are also between "0" and "width/2".
    z = random(width/2);
    //set the previous position of "z" in the same position of "z",
    //stars are not moving during the first frame.
    pz = z;
  }

  void update() {
    
    //here you take the variable z and divide it to get the new x,y coordinates of the star, the speed value is bigger= z decreses
    z = z - speed;
    // when the "z" value equals to 1, I'm sure the star have passed the
    // borders of the canvas( probably it's already far away from the borders),
    // so i can place it on more time in the canvas, with new x, y and z values.
    // Note: in this way I also avoid a potential division by 0.
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255,255,255);
  
  
 //GREEN
  fill(0,9);
  
  fill(0,250,9); 
 
  //PURPLE
   fill(0,9);
  
  fill(250,0,250); 

  //BLUE
  
  fill(0,9);
 
 
 
    noStroke();

    // map will give new star positions
    // the division x / z get a number between 0 and a very high number,
    // map this number (proportionally to a range of 0 - 1), inside a range of 0 - width/2.
    //this makes sure the new coordinates "sx" and "sy" move faster at each frame
    // and which they finish their travel outside of the canvas (they finish when "z" is less than a).

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    //the z value to increase the star size between a range from 0 to 16.
    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);

    //use the "pz" valute to get the previous position of the stars,
    //to draw a line from the previous position to the new (current) one.
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(255);
    line(px, py, sx, sy);

  }
}
