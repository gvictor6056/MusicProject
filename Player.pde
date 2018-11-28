import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioInput in;
//minim is the audio library allowing for us to play and pull the music in

Star[] stars = new Star[400];
float speed;

boolean lerping = true;

int linesX = 40; // number of lines in x direction
int linesY = 26; // number of lines in y direction


boolean voice = false;
color c;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;

void setup() {
  fullScreen();
  noSmooth();
  colorMode(255);
 
  for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
  }  
 
  
// tells minim to locate the song file and play it
  minim = new Minim(this);
  song = minim.loadFile("Shawn James Ain't No Sunshine.mp3");
   song.play();
  factor = float(width)/song.bufferSize();
  textAlign(LEFT);
}

void draw(){ 
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
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    if (voice) {
      line(i*factor, height/2 + in.left.get(i)*last_sum + 1, i*factor+1, height/2 + in.left.get(i+1)*last_sum + 2);
      sum += abs(in.left.get(i));
    } else {
     line(i*factor, height/2 + song.left.get(i)*last_sum + 1, i*factor+1, height/2 + song.left.get(i+1)*last_sum + .05);
     sum += abs(song.left.get(i));
     stroke(random(255));
     strokeWeight(3);
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
 }
   
   fill(255);
   strokeWeight(2);
}
}
