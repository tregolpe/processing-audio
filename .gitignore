import ddf.minim.*;

Minim minim;
AudioSample santos;
AudioSample calderon;
AudioSample pinera;

void setup()
{
  size(512, 200, P2D);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  santos = minim.loadSample("santos.mp3", 2048);
  calderon = minim.loadSample("Calderon.mp3", 2048);
  pinera = minim.loadSample("piñera.mp3", 2048);
}

void draw()
{
  background(0);
  stroke(255);
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  for (int i = 0; i < santos.bufferSize() - 1; i++)  {
    line(i, 100 - santos.left.get(i)*50, i+1, 100 - santos.left.get(i+1)*50);
  
   }
  for (int i = 0; i < calderon.bufferSize() - 1; i++)
{
   line(i, 100 - calderon.left.get(i)*50, i+1, 100 - calderon.left.get(i+1)*50);
   }
  
   for (int i = 0; i < pinera.bufferSize() - 1; i++)
{
   line(i, 100 - pinera.left.get(i)*50, i+1, 100 - pinera.left.get(i+1)*50);
   }
}


void keyPressed()
{
  if ( key == 'k' ) santos.trigger();
  if ( key == 'j' ) calderon.trigger();
  if ( key == 'h' ) pinera.trigger();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  santos.close();
  calderon.close();
  pinera.close();
  
  minim.stop();
  
  super.stop();
}
