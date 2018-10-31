import ddf.minim.*;

Minim minim;

AudioPLayer groove;
AudioRenderer radar, vortex, iso;
AudioRenderer[] visuals;

int select;

void setup()
{
  size(512, 512, P3D);
  
   minim = new Minim(this);
   song = minim.loadFile("song.mp3", 1024);
   song.loop();
   
   vortex = new VortexRenderer(song);
   radar = new RadarRenderer(song);
   iso = new IsometricRenderer(song);
   
   visuals = new AudioRenderer[] {radar, vortex, iso};
   
   select = 0;
   song.addListener(visuals[select]);
   visuals[select].setup();
   
}

  void draw()
   {
      visuals[select].draw();
   }
   
   void keyPressed() {
     song.removeListener(visuals[select]);
     select++;
     select %= visuals.length;
     song.addListener(visuals[select]);
     visuals{select}.setup();
     
   }
   
   void stop()
   {
     song.close();
     minim.stop();
     super.stop();
   }
