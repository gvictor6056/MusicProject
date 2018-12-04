
//minim is the audio library allowing for us to play and pull the music in
import ddf.minim.*;
Minim minim;

//all of the songs that we have
AudioPlayer song;
//setting a true/false value for whether or not the song is playing
boolean play;
//the parameters for the button
int button_X = 40, button_Y = 40, button_sz = 20;
AudioInput in;
//number of stars & speed is declaring the variable for the speed of the stars
Star[] stars = new Star[150];
float speed;
//creating a filler variable for the color of the lines, then sets the height and 
//width variable for the button
color c;
float buttonH = 50;
float buttonW = 200;

boolean voice = false;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;
//only runs once, noSmooth makes the lines of the wave jagged and more rigged
void setup() {
  fullScreen();
  noSmooth();
 //resets the stars position randomly after they pass below the bottom of the window
  for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
  }  
 
  
// tells minim to locate the song file and play it, tells the song to play and rewind when necessary
  minim = new Minim(this);
  song = minim.loadFile("Tobu - Higher.mp3");
   song.play();
   song.rewind();
  factor = float(width)/song.bufferSize();
  textAlign(LEFT);
}
//continuously executes the line of the code contained in its block until the program is stopped, noCursor just makes the cursor disappear
void draw(){  
  
  rect(button_X, button_Y, button_sz, button_sz);
  
  noCursor();
   
   //links the value of the speed variable with the location of the mouse
 { 
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  //moving the center of the screen from the top left corner to the center of the canvas
  translate(width/2, height/2);
  //draw each star, running the update method to its position and show method to show it on the canvas
 for (int i = 0; i < stars.length; i++) {
   stars[i].update();
    stars[i].show();
}
 } 
 {
   translate(-width /2, -height /2); 
   c = color(170 + wave/2, wave*5, 255,255);
  fill(random(0,255), random(0,255), random(0,255));
   stroke(random(0,255), random(0,255), random(0,255));
   strokeWeight(2);
   
  sum = 0; 
  // creates sound waves that change in frequency and amplitude, initally makes it so the array "i" is less than htat of the songs buffer size
  //and locks the line on the left and right halves of the screen at exactly center of the screen
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    if (voice) {
      line(i*factor, height/2 + in.left.get(i)*last_sum + 1, i*factor+1, height/2 + in.left.get(i+1)*last_sum + 2);
      sum += abs(in.left.get(i));
    } else {
     line(i*factor, height/2 + song.left.get(i)*last_sum + 1, i*factor+1, height/2 + song.left.get(i+1)*last_sum + .05);
     sum += abs(song.left.get(i));    
    
    }
  }
 }
 //makes the two sections of the wave equal
  last_sum = sum;
    {
     
  
 //randomizes the color for the moon
fill(random(0,255), random(0,255), random(0,255));
 
 //draws the moon shape, and noStroke gives it no outline
 ellipse(width /2, height /2, 500, 500);
noStroke();
    }
 {
   //puts the moon in the center, and fills in the color white, noStroke then gets ride of the outline
  ellipseMode(CENTER);
  
  fill (0);
 ellipse(width /2 -50,height /2 -50, 460, 450);

 noStroke();
 }
   strokeWeight(2);
 } 
 
