//minim is the audio library allowing for us to play and pull the music in
import ddf.minim.*;
Minim minim;

//all of the songs that we have
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioInput in;

//number of stars
Star[] stars = new Star[150];
float speed;

boolean lerping = true;
// number of lines in x & y direction
int linesX = 40; 
int linesY = 26; 
float magnitude;


boolean voice = false;
color c;
float value;
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
  song1 = minim.loadFile("Shawn James- Aint No Sunshine - Bill Withers Cover.mp3");
   song1.play();
   song1.rewind();
  factor = float(width)/song1.bufferSize();
  textAlign(LEFT);
  
   minim = new Minim(this);
  song2 = minim.loadFile("Jack Garratt - The Love Youre Given.mp3");
   song2.play();
   song2.rewind();
  factor = float(width)/song2.bufferSize();
  textAlign(LEFT);
  
  
    minim = new Minim(this);
  song3 = minim.loadFile("Tobu - Higher.mp3");
   song3.play();
   song3.rewind();
  factor = float(width)/song3.bufferSize();
  textAlign(LEFT);  
  
}

void draw(){ 
  background(frameCount%255,255,30); 
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
  sum = 0; 
  // creates sound waves that change in frequency and amplitude
  for (int i = 0; i < song1.bufferSize() - 1; i++)
  {
    if (voice) {
      line(i*factor, height/2 + in.left.get(i)*last_sum + 1, i*factor+1, height/2 + in.left.get(i+1)*last_sum + 2);
      sum += abs(in.left.get(i));
    } else {
     line(i*factor, height/2 + song1.left.get(i)*last_sum + 1, i*factor+1, height/2 + song1.left.get(i+1)*last_sum + .05);
     sum += abs(song1.left.get(i));
     
     float temp= random(0, 100);
   {
     if (temp > 50)
     //red
      fill(255, 0, 0);
  else
  //blue
    fill(0,0,255);
   }
     
     
    }
  }
  last_sum = sum;
    {
     
  // black background
 
 fill (255);
 
 ellipse(width /2, height /2, 500, 500);

    }
 {
  ellipseMode(CENTER);
  
  fill (0);
 ellipse(width /2 -50,height /2 -50, 460, 450);

 noStroke();
 }
   
//   fill(255);
   strokeWeight(2);
  
}
 }
