TwC twitter;
ArrayList searchResult;
import ddf.minim.*;

Minim minim;
AudioSample santos;
AudioSample calderon;
AudioSample pinera;

void setup() {
  size(512, 200, P2D);
  minim = new Minim(this);  
  santos = minim.loadSample("santos.mp3", 2048);
  calderon = minim.loadSample("Calderon.mp3", 2048);
  pinera = minim.loadSample("piñera.mp3", 2048);
  
  twitter = new TwC("ajzGg9NXNoB0ESX2IVV4QQ",//OAuthConsumerKey 
                    "ngsX2u3gA4yrpuJSLhmShCntx7nB5nTKl0eCOL8tXEQ", //OAuthConsumerKeySecret
                     "76812360-lDILGeXSskuhR1BVd6Ta3J3uLJneFt6ESChp6Q9OG", //AccessToken
                     "P15bYAf45pMnld4ulYn8A1NdoaX5K0yd28eEwvewRg" //AccessTokenSecret
                    );
  
  
   twitter.connect();
 //twitter.send("hello world! from #processing");
//  twitter.getTimeline();
  
}


void draw() {
  background(0);
  stroke(255);
  
  //busqueda
  searchResult = twitter.search("#inseguridad");
  for (int i=0; i<searchResult.size(); i++) {  
        Tweet t = (Tweet)searchResult.get(i);	
        String user = t.getFromUser();
        String msg = t.getText();
        Date d = t.getCreatedAt();	
        println(msg);
        santos.trigger();
        
  }
  searchResult = twitter.search("#narcotrafico");
  for (int i=0; i<searchResult.size(); i++) {	
        Tweet t = (Tweet)searchResult.get(i);	
        String user = t.getFromUser();
        String msg = t.getText();
        Date d = t.getCreatedAt();	
        println(msg);
        calderon.trigger();
  
  }
searchResult = twitter.search("#violencia");
  for (int i=0; i<searchResult.size(); i++) {	
        Tweet t = (Tweet)searchResult.get(i);	
        String user = t.getFromUser();
        String msg = t.getText();
        Date d = t.getCreatedAt();	
        println(msg);
        pinera.trigger();
  
  }
  
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

  



/*void keyPressed()
{
  if ( key == 'k' ) santos.trigger();
  if ( key == 'j' ) calderon.trigger();
  if ( key == 'h' ) pinera.trigger();
}
*/
void stop()
{
  // always close Minim audio classes when you are done with them
  santos.close();
  calderon.close();
  pinera.close();
  
  minim.stop();
  
  super.stop();
}
