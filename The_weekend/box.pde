void boxy()
{

  float specSLow = 0.03; 
  float specSMid = 0.125;  
  float specSHigh = 0.20;   
  
  // new values
  float lowValueX = 0;
  float midValueX = 0;
  float highValueX = 0;
  
  //the old values
  float lowValueY = lowValueX;
  float midValueY = midValueX;
  float highValueY = highValueX;
    
  float valueDecline = 25;

  
  float lerpedAverage = 0;
  float[] lerpedBuffer = new float[1024];
  
  
  fft.forward(ap.mix);
  
  //save the old values
  lowValueY = lowValueX;
  midValueY = midValueX;
  highValueY = highValueX;
  
  //Reset values
  lowValueX = 0;
  midValueX = 0;
  highValueX = 0;
  
  
//Calculate the new values
  for(int i = 0; i < fft.specSize()*specSLow; i++)
  {
    lowValueX += fft.getBand(i);
  }
  
  for(int i = (int)(fft.specSize()*specSLow); i < fft.specSize()*specSMid; i++)
  {
    midValueX += fft.getBand(i);
  }
  
  for(int i = (int)(fft.specSize()*specSMid); i < fft.specSize()*specSHigh; i++)
  {
    highValueX += fft.getBand(i);
  }
  
  
//Slow down the descent
  if (lowValueY > lowValueX) {
    lowValueX = lowValueY - valueDecline;
  }
  
  if (midValueY > midValueX) {
    midValueX = midValueY - valueDecline;
  }
  
  if (highValueY > highValueX) {
    highValueX = highValueY - valueDecline;
  }
  
  
  background(lowValueX/100, midValueX/100, highValueX/100);


  //This makes the animation go faster for higher pitched sounds
  float globalValue = 0.66 * lowValueX + 0.8 * midValueX + 1 * highValueX;
  float oldBandValue = fft.getBand(0);
  float dist = -25;
  //double height
  float doubleH = 2;
  float colorGap = 255 / (float) ab.size()*2.05;
  
  //lines
  for(int i = 1; i < fft.specSize(); i++)
  {
    
    float bandValue = fft.getBand(i)*(1 + (i/50));
    
    //color
    stroke((i*colorGap)+180, 205,255);
    strokeWeight(1 + (globalValue/180));
    
    //bottom left line
    line(0, height-(oldBandValue*doubleH), dist*(i-1), 0, height-(bandValue*doubleH), dist*i);
    line((oldBandValue*doubleH), height, dist*(i-1), (bandValue*doubleH), height, dist*i);
    
    //bottom right
    line(width, height-(oldBandValue*doubleH), dist*(i-1), width, height-(bandValue*doubleH), dist*i);
    line(width-(oldBandValue*doubleH), height, dist*(i-1), width-(bandValue*doubleH), height, dist*i);
    
    //top left
    line(0, (oldBandValue*doubleH), dist*(i-1), 0, (bandValue*doubleH), dist*i);
    line((oldBandValue*doubleH), 0, dist*(i-1), (bandValue*doubleH), 0, dist*i);
  
    //top right 
    line(width, (oldBandValue*doubleH), dist*(i-1), width, (bandValue*doubleH), dist*i);
    line(width-(oldBandValue*doubleH), 0, dist*(i-1), width-(bandValue*doubleH), 0, dist*i); 
    
    //fill(15+lowValueX, 150+midValueX, 100+highValueX, 255-i);
    //noStroke();
    //circle(width/2,height/2,(oldBandValue*doubleH));
  
    oldBandValue = bandValue;
  }
  
  //circle
   float sum = 0;
   for(int i = 0;i<ab.size();i++)
   {
     sum += abs(ab.get(i)); 
     lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.1f);
   }
  
   stroke((colorGap)+220, (colorGap)*lowValueX,255);
   fill(0);
   float average = sum / (float) ab.size();
   lerpedAverage = lerp(lerpedAverage, average, 0.1f);
   circle(width/2, height/2, lerpedAverage * 1000);
}
