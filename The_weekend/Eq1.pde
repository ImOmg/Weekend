class Eq1{
  
  float lerpav;
  float average;
  
  void update(){
    background(0);
    
    float sum = 0;
    float[] buff = new float[1024];
   for(int i = 0; i < ab.size(); i++){
      buff[i] = lerp(buff[i], ab.get(i), 0.6f);
     sum += abs(ab.get(i));
   }
   average = sum / (float) ab.size(); 
   lerpav = lerp(lerpav, average, 0.5f);
   
   //stroke(lerpav*1100, 255, 255);
   for(int i = 0; i < width; i += 50){
     buff[i] = lerp(buff[i], ab.get(i), 0.6f);
     fill((lerpav*i)*2.7f, 255, 255);
     noStroke();
     rect(i+12.5, height-lerpav * 2000 * buff[i], 24, 1000 * buff[i]);
     println(i);
     
   }
   
   println(lerpav);
  }
}
