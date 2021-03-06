import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup() {
  size(500, 500,P3D);
  minim = new Minim(this);
  ap = minim.loadFile("weekend.mp3", 1024);
  ap.play();
  ab = ap.mix;
  colorMode(HSB);
  eq1 = false;
  eq2 = false;
  eq3 = false;
  
  eq = new Eq();
  pq1 = new Eq1();
  junkie = new Junkie();
  timer = new Timer();
  fft = new FFT(ap.bufferSize(), ap.sampleRate());

}
Eq eq;
Eq1 pq1;
Junkie junkie;
Timer timer;
FFT fft;

Minim minim;
AudioPlayer ap;
AudioBuffer ab;


boolean eq1;
boolean eq2;
boolean eq3;
boolean eq4;
boolean eq5;

void draw() {
  if(keyPressed){
   if(key == '1'){
    eq1 = true; 
   } else {eq1 = false;}
   
   if(key == '2'){
    eq2 = true; 
   } else {eq2 = false;}
  }
  
  if(key == '3'){
   eq3 = true; 
  } else {eq3 = false;}
  
  if(key == '4'){
   eq4 = true; 
  } else {eq4 = false;}
  
  if(key == '5'){
   eq5 = true; 
  } else {eq5 = false;}
  
  if(eq1 == false && eq2 == false){
    background(0);
    fill(255);
    textAlign(CENTER);
    text("Use the numpad to change visualisers!", width/2, height/2);
  }
  if(eq1 == true){
    eq.update();
  }
  
  if(eq2 == true){
   junkie.update(); 
  }
  
  if(eq3 == true){
   pq1.update(); 
  }
  if(eq4 == true){
    boxy(); 
  }
  if(eq5 == true){
    rave(); 
  }
  
  println(eq1, eq2);
  
  timer.update();
  }
  
 
