 
 int x;
 int y;
 int m=1;
 int b=240;
 
 int separacion=20;
 
 int paddle1Y=0;
 int paddle1X=20;
 int paddle1H=30;
 int paddle1W=10;
 
 int paddle2Y=0;
 int paddle2X=420;
 int paddle2H=30;
 int paddle2W=10;
 
 int screenH=480;
 int screenW=640;
 
 
 
 boolean topex=false;
 
  void setup(){
    size(640, 480);
    
    paddle1X=separacion;      //<--- es redundante...
    paddle1Y= (screenH/2) - (paddle1H/2);
    
    paddle2X=screenW - paddle1W - separacion;
    paddle2Y=(screenH/2) - (paddle1H/2);
    
    x=0;
  }
  
  void draw(){
    
    clearScreen();
    
    y=m*x + b;
    
    drawPuck(x, y, 10);
    
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
    
    paddleOne(paddle1X, paddle1Y);
    paddleTwo(paddle2X, paddle2Y);
    
  }
  
  void recalcularB(){
    m=m*-1;
    b=y - m*x;
  }
  
  void paddleOne(int x, int y){
    drawRect(x, y, 10, 30, 0, 255, 0);
  }
  
  void paddleTwo(int x, int y){
    drawRect(x, y, 10, 30, 0, 255, 0);
  }
  
  void drawPuck(int x, int y, int size){
    drawRect(x, y, size, size, 0, 0, 255);
  }
  
  void drawRect(int x,int y, int sizex, int sizey, int r, int g, int b){
    fill(r,g,b);
    rect(x,y,sizex,sizey);
  }
  
  void clearScreen(){
    fill(255,255,255);
    
    rect(0,0,640,480);
  }
  
  void keyPressed(){
   println("key pressed: " + keyCode); 
   int deltaPos=50;
   
   if(keyCode==38){
     if(paddle1Y-50 >= 6){
       paddle1Y-=deltaPos;
     }
   }
   
   if(keyCode==40){
     if(paddle1Y + paddle1H < screenH - 55){
       paddle1Y+=deltaPos;
     }
   }
  }