#library('CochleoidRectanglesShear1');
#import('dart:dom');

main() {
  new CochleoidRectanglesShear1();
}

class CochleoidRectanglesShear1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = -150;
   var basePointY   = 100;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 600;
   var rectHeight   = 200;
   var lineWidth    = 1;
   var Constant     = 20000;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   CochleoidRectanglesShear1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=1; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        radius = Constant*
                  Math.sin(angle*Math.PI/180)/angle;
 
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

