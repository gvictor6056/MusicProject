import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;



float buttonX;
float buttonY;
float buttonW;
float buttonH;

Minim minim;
AudioPlayer player;
ArrayList<Songs> s;
int k;

String filename;

boolean isSelected = false;

void setup() {

  s = new ArrayList();

  textSize(24);

  frame.setResizable(false);

  background(255);

  size(600, 600);

  fill(0);
  stroke(0);
  noFill();

  buttonW = 200;
  buttonH = 50;
  buttonX = width - width/2 - buttonW/2;
  buttonY = height/2 - buttonH/2;

  // Minim stuff
  minim = new Minim(this);
}

void draw() {

  background(255);
  fill(0);

  rectMode(CORNER);

  rect(buttonX, buttonY, buttonW, buttonH);

  fill(255);

  textAlign(LEFT);
  text("Import File", buttonX+35, buttonY+30);

  if (isSelected) {
    s.get(k).waveform();
  }
}

void mouseClicked() {
  if (mouseX>buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH) {
    selectInput("Import music file", "fileSelected");
  }
}

/* Taken from Processing.org */
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or user hit cancel");
  } 
  else {
    filename = selection.getAbsolutePath();
    s.add(new Songs(player, filename, "Filename"));
    isSelected = true;
  }
}

// stop minim and the player.
void stop() {
  player.close();
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
