class Timer{
  float m;
float circleX;
boolean change;
boolean hasMoved;
float timeStart;
float timeElapsed;

Timer() {
  timeStart = millis();
}

void update(){
  m = millis();
  timeElapsed = millis() - timeStart;
  
  if(mouseX != pmouseX && mouseY != pmouseY){
    change = true;
    
  }
  
  if(change == true){
    timeStart = millis();
    hasMoved = true;
     change = false;
  } if(timeElapsed <= 3000 && hasMoved){
      timer();
    }
   println(m, circleX, timeElapsed, change); 
}

void timer(){
  
 stroke(255);
 strokeWeight(3);
  fill(255);
  line(20, height-20, 480, height -20);
  
  
  circleX = map(m, 0, 192000, 20, 480);
  
  if(m >= 192000){
   circleX = 480; 
  }
  stroke(255, 0, 100);
  
  line(20, height-20, circleX, height-20);
  strokeWeight(2);
  circle(circleX, height-20, 20);
}


}
