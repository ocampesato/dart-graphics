#library('ConchoidRectanglesShear1');
#import('dart:dom');

main() {
  new ConchoidRectanglesShear1();
}

class ConchoidRectanglesShear1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 50;
   var basePointY   = 50;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 600;
   var rectHeight   = 300;
   var lineWidth    = 1;
   var Constant1    = 120;
   var Constant2    = 80;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   ConchoidRectanglesShear1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=0; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        radius   = Constant1+Constant2/
                          Math.cos(angle*Math.PI/180);
 
        offsetX  = radius*Math.cos(angle*Math.PI/180);
        offsetY  = radius*Math.sin(angle*Math.PI/180);
        currentX = basePointX+offsetX;
        currentY = basePointY-offsetY;

        // draw the circle 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("blue");
        } 

        context.transform(1,
                          1*angle/20*Math.PI/180,
                          angle*Math.PI/180,
                          1,0,0);

        // render the rectangle 
        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

