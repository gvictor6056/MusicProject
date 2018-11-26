
// create an array named "stars",
// it will be filled with 50lements made with the Star() class.
Star[] stars = new Star[50];

// create a variable "speed", it'll be useful to control the speed of stars.
float speed;

void setup() {
size(600,600);
 //fullScreen();
 
  // fill the array with a for loop;
  // running 100 times, it creates a new star using the Star() class.
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  //link the value of the speed variable to the mouse position.
  speed = map(mouseX, 0, width, 0, 10);

  background(0);
  // shift the entire composition,
  // moving its center from the top left corner to the center of the canvas.
  translate(width/2, height/2);
  // draw each star, running the "update" method to update its position and
  // the "show" method to show it on the canvas.
  for (int i = 0; i < stars.length;i++) {
    stars[i].update();
    stars[i].show();
  }
}
