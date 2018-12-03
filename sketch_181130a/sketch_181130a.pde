//minim is the audio library allowing for us to play and pull the music in
import ddf.minim.*;
Minim minim;

//all of the songs that we have
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioInput in;

//number of stars & speed is declaring the varible for the speed of the stars
Star[] stars = new Star[100];
float speed;


// number of lines in x & y direction, float magitude is the wave,boolean is declaring the variable for the if statement involving line, line 21 are the parameteres for the line movement
int linesX = 40; 
int linesY = 26; 
float magnitude;
boolean voice = false;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;


//only runs once, full screen makes the screen full screen, noSmooth is for making the lines of the wave jagged
void setup() {
  fullScreen();
  noSmooth();
  
//once the stars position is equal to >0 it is reset randomly back to the top of the screen, the for loop takes into account the full length of 
//the star rather than resetting it as soon as it hits the bottom
  for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
}  
 
  
//tells minim to locate the song file and play it, then song1,2,3 play each of the mp3 files, .play plays the whole song, .rewind rewinds current song and plays the new song
//keep the wavelength within the screen 
  minim = new Minim(this);
  song1 = minim.loadFile("Shawn James- Aint No Sunshine - Bill Withers Cover.mp3");
  song1.play();
  song1.rewind();
  factor = float(width)/song1.bufferSize();
  
  minim = new Minim(this);
  song2 = minim.loadFile("Jack Garratt - The Love Youre Given.mp3");
  song2.play();
  song2.rewind();
  factor = float(width)/song2.bufferSize();
 
  
  minim = new Minim(this);
  song3 = minim.loadFile("Tobu - Higher.mp3");
  song3.play();
  song3.rewind();
  factor = float(width)/song3.bufferSize();  
}

//continuously executes the line of the code contained in its block unit the program is stopped, noCursor just makes the cursor diappeared
void draw(){ 
  noCursor();
 
//link the value of the speed variable to the mouse position
{ 
  speed = map(mouseX, 0, width, 0, 20);
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

//moving the center of the screen from the top left corner to the center of the canvas
   translate(-width /2, -height /2); 
   sum = 0; 
   
// creates sound waves that change in frequency and amplitude, initially makes it so the array "i" is less than that of the songs buffer size or its bass. The "if" and "else" statements 
//lock the line on the left and right side of the screen at exactly the middle y value of the entire screen. It brings in factor just putting all of the parameters of the line in one place
  for (int i = 0; i < song1.bufferSize() - 1; i++)
  {
    if (voice) {
      line(i*factor, height/2 + in.left.get(i)*last_sum + 1, i*factor+1, height/2 + in.left.get(i+1)*last_sum + 2);
      sum += abs(in.left.get(i));
    } else {
     line(i*factor, height/2 + song1.left.get(i)*last_sum + 1, i*factor+1, height/2 + song1.left.get(i+1)*last_sum + .05);
     sum += abs(song1.left.get(i));
    }
  }
}

//makes both wavelength equal 
  last_sum = sum;
    {
     
//randomizes the color for the moon
  fill(random(0,255), random(0,255), random(0,255));

//draws the moon shape, and noStroke gives it no outline
  ellipse(width /2, height /2, 500, 500);
  noStroke();
}

 {
//puts the moon the in the center, and fills it the color white, and noStroke makes it have no outline, the next ellipse statement is for the black circle on top of the white
// that makes the cresent shape
  ellipseMode(CENTER);
  fill (0);
  ellipse(width /2 -50,height /2 -50, 460, 450);
  noStroke();
 }
{
//makes the thickness of all lines to 2
   strokeWeight(2); 
}
}
