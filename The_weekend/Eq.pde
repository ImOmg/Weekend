class Eq{
  
  void update() {

    background(0);

    float halfH = height/2;
    
    float colorGap = 255 / (float) ab.size()*2.05;
    float[] buff = new float[1024];
    for (int i = 0; i < ab.size(); i ++) {
      buff[i] = lerp(buff[i], ab.get(i), 0.4f);
      stroke(i * colorGap, 255, 255);
      line(i, halfH, i, halfH + buff[i] * halfH);
    }
  }

}
