import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioInput in;
//minim is the audio library allowing for us to play and pull the music in

Blob b;
PImage moon;
boolean lerping = true;

int linesX = 40; // number of lines in x direction
int linesY = 26; // number of lines in y direction

boolean repel = true;
boolean autopilot = false;
boolean controls = true;
boolean voice = false;
int coef = 1;
int mode = 0;
//float magnitude = 0;
//float maxMagnitude = 848.5281374;

float cen = width;
float cent = height;

color c;
PVector distance;
PFont sourcecode;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;

class Node {
  float xpos, ypos, speed, anchorx, anchory;
  Node (float x, float y, float s) {
    anchorx = x;
    anchory = y;
    ypos = y;
    xpos = x;
    speed = s;
  }
}

Node[][] Nodes = new Node[linesX][linesY]; // create matrix of Nodes

class Fish {
  float xpos, ypos, speed;
  Fish () {
    ypos = random(800*0.25, 800*0.75);
    xpos = random(1000*0.25, 1000*0.75);
  }
  void update() {
    //increase movement w/ volume of song
    if (lerping) {
      xpos = lerp(xpos + random(sum/20) - sum/40, xpos, 0.5);
      ypos = lerp(ypos + random(sum/20) - sum/40, ypos, 0.5);
    } else {
      xpos = xpos + random(sum/20) - sum/40;
      ypos = ypos + random(sum/20) - sum/40;
    }
    if (ypos > height*0.75) {
      ypos = height*0.75;
    } else if (xpos > width*0.75) {
      xpos = width*0.75;
    } else if (xpos < width*0.25) {
      xpos = width*0.25;
    } else if (ypos < height*0.25) {
      ypos = height*0.25;
    }
  }
}

Fish jimmy = new Fish(); //create Jimmy


void setup() {
  fullScreen();
  noSmooth();
  colorMode(255);
  
  b = new Blob(100, 100);
  
  moon = loadImage("super-moon.png");
  
  
//sets the screen size and color for moon and denotes the Blob class 
  stepsX = (width) / linesX;
  stepsY = (height) / linesY;
  // initialize nodes
  for (int i = 0; i < linesX; i++) {
    for (int j = 0; j < linesY; j++) {
      Nodes[i][j] = new Node((i+0.5)*stepsX, (j+0.5)*stepsY, 2);
    }
  }
// tells minim to locate the song file and play it
  minim = new Minim(this);
  song = minim.loadFile("Tobu - Higher.mp3");
 
  in = minim.getLineIn(Minim.MONO, 1024);
 // song.play(73*1000+500);
  factor = float(width)/song.bufferSize();
  textAlign(LEFT);
}

//enacts a "command" for when a key is pressing, in our case ESC closes the window
void keyPressed() {
  switch(key) {
  case ' ':
    repel = !repel;
    break;
  case 'm':
    mode += 1;
    if (mode > 1) {
      mode = 0;
    }
    break;
  case 'a':
    autopilot = !autopilot;
    break;
  case 's':
  //  saveFrame("wavepttrn-####.jpg");
    break;
  case 'h':
    controls = !controls;
    break;
  case 'v':
    voice = !voice;
    if (!voice) {
      song.play();
    } else {
      song.pause();
    }
    break;
  }
}

void draw(){
  background(0,9); 
   loadPixels();
   for (int x = 0; x < width; x++) {
     for (int y = 0; y < height; y++) {
       int index = x + y * width;
       float d = dist(x, y, 900, 500);
       float col = b.r / d;
       pixels[index] = color(col);
     }
   }
   updatePixels();
   
   b.show();
   
   {
  //background(0,9);
  image(moon, 500, 150);
 
 {
   
// ellipseMode(RADIUS);
//  fill (255,255,204);
 // ellipse(300, 300, 300, 300);
 //filter( BLUR, 2 );
 

 // ellipseMode(CENTER);
  fill (0);
  //ellipse(870, 460, 270, 270);
  
  fill(0,9);
  rect(0,0,width,height);
  fill(255); 
  noStroke();
  ellipse(random(width),random(height), 5.5, 5.5);
 
}
  // creates sound waves that change in frequency and amplitude
  for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    
    float x1 = map( i, 0, song.bufferSize(), 0, width );
    float x2 = map( i+1, 0, song.bufferSize(), 0, width );
    line( x1, 50 + song.left.get(i)*50, x2, 50 + song.left.get(i+1)*50 );
    line( x1, 150 + song.right.get(i)*50, x2, 150 + song.right.get(i+1)*50 );
  }
   
}
}
