
//minim is the audio library allowing for us to play and pull the music in
import ddf.minim.*;
Minim minim;

//all of the songs that we have
AudioPlayer song;
boolean play;
int button_X = 40, button_Y = 40, button_sz = 20;
AudioInput in;
//number of stars
Star[] stars = new Star[150];
float speed;
color c;
float buttonH = 50;
float buttonW = 200;

boolean voice = false;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;
//only runs once
void setup() {
  fullScreen();
  noSmooth();
 
  for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
  }  
 
  
// tells minim to locate the song file and play it
  minim = new Minim(this);
  song = minim.loadFile("Tobu - Higher.mp3");
   song.play();
   song.rewind();
  factor = float(width)/song.bufferSize();
  textAlign(LEFT);
}

void draw(){  
  
  rect(button_X, button_Y, button_sz, button_sz);
  
  noCursor();
   
 { 
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
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
  // creates sound waves that change in frequency and amplitude
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
 
  last_sum = sum;
    {
     
  // black background
 
fill(random(0,255), random(0,255), random(0,255));
 
 ellipse(width /2, height /2, 500, 500);
noStroke();
    }
 {
  ellipseMode(CENTER);
  
  fill (0);
 ellipse(width /2 -50,height /2 -50, 460, 450);

 noStroke();
 }
   strokeWeight(2);
 } 
 
