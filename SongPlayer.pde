import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioInput in;
ArrayList<Songs> s;
int k;

String file;

boolean isChosen = false;


//intergrating the star class into the main code using an array which allows
// for customization of the number of stars
Star[] stars = new Star[400];
float speed;
// The location and size of the buttons used
float buttonX;
float buttonY;
float buttonW;
float buttonH;

boolean lerping = true;

int linesX = 40; // number of lines in x direction
int linesY = 26; // number of lines in y direction
float magnitude;


boolean voice = false;
color c;
float value;
float stepsX, stepsY, radius, intensity, movement, last_sum, scale, factor, wave, sum;

void setup() {
  fullScreen();
  noSmooth();
  
  s = new ArrayList();
  textSize(24);
  frame.setResizable(false);
  
  fill(0);
  stroke(0);
  noFill();
  
  buttonW = 200;
  buttonH = 50;
  buttonX = width - width/3 - buttonW/2;
  buttonY = height/2 - buttonH/2;
  
  minim = new Minim(this);
}
 {
 //this for loop resets the stars location based on the 
  for (int i = 0; i < stars.length; i++) {
     stars[i] = new Star(); 
  }
 }
 
  void draw(){ 
  
  rectMode(CORNER);

  rect(buttonX, buttonY, buttonW, buttonH);

  fill(255);

  textAlign(LEFT);
  text("Import File", buttonX+35, buttonY+30);

  if (isChosen) {
    s.get(k).waveform();
  }
}

void mouseClicked() {
  if (mouseX>buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH) {
    selectInput("Import music file", "fileSelected");
  }
}


void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or user hit cancel");
  } 
  else {
    file = selection.getAbsolutePath();
    s.add(new Songs(song, file, "Filename"));
    isChosen = true;
  }
}

// stop minim and the player.
void stop() {
  song.close();
  minim.stop();
  super.stop();
}

class Songs {
  AudioPlayer song; 
  String directory;
  String songName;
  Songs(AudioPlayer song, String directory, String songName) {

    song=minim.loadFile(directory);    

    this.song=song;
    this.songName=songName;
    song.play();
  }



  void waveform() {
    for (int j = 1; j < song.bufferSize() - 1; j++)
    {
      if (j>0) {

        line(j, 214  + song.left.get(j)*50, j+1, 214 + song.left.get(j+1)*50);
        //waves from the left.
        stroke( 35, 30, 30 );  //this is the colour of the first line (red)
        line(j, 214 + song.right.get(j)*50, j+1, 214 + song.right.get(j+1)*50);
        //waves from the right.
        stroke(255, 255, 70);
      }
    }
  }
}

 { 
   //tracks the location of the mouse altering the speed of the stars
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
//determines line thickness 
   strokeWeight(2);
}
