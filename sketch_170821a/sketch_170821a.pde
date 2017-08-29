 
 int x;
 int y;
 int m=1;
 int b=240;
 boolean topex=false;
 
  void setup(){
    size(640, 480);
    
    x=0;
  }
  
  void draw(){
    
    clearScreen();
    
    y=m*x + b;
    
    drawRect(x, y, 10);
    
    if(x == 640){
      topex=true;
      
      recalcularB();
    }
    
    if(x == 0){
      topex=false;
      
      recalcularB();
    }
    
    if(y==480){
      
      recalcularB();
    }
    
    if(y==0){
      recalcularB();
    }
    
    
    
    if(topex){
      x--;
    }
    else{
      x++;
    }
  }
  
  void recalcularB(){
    m=m*-1;
    b=y - m*x;
  }
  
  void drawRect(int x,int y, int size){
    fill(0,0,255);
    
    rect(x,y,size,size);
  }
  
  void clearScreen(){
    fill(255,255,255);
    
    rect(0,0,640,480);
  }