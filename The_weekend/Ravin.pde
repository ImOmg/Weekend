void rave()
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
 
  
  fft.forward(ap.mix);
  
  //save the old values
  lowValueY = lowValueX;
  midValueY = midValueX;
  highValueY = highValueX;
  
  //Reset values
  lowValueX = 0;
  midValueX = 0;
  highValueX = 0;
  
  

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

  float oldBandValue = fft.getBand(0);
  float doubleH = 2;
  
  //rects
  for(int i = 1; i < fft.specSize(); i++)
  {  
    float bandValue = fft.getBand(i)*(1 + (i/50));
    
    fill(15+lowValueX, 150+midValueX, 100+highValueX, 255-i);
    noStroke();
    
    //bottom right rect
    rect(width/2,height/2,(oldBandValue*doubleH), (bandValue*doubleH));
    
    //top right
    rect(width/2,height/2,(oldBandValue*doubleH), -(bandValue*doubleH));
    
    //top left
    rect(width/2,height/2,-(oldBandValue*doubleH), -(bandValue*doubleH));
    
    //bottom left
    rect(width/2,height/2,-(oldBandValue*doubleH), (bandValue*doubleH));
    
  
    oldBandValue = bandValue;
  }
  
}
