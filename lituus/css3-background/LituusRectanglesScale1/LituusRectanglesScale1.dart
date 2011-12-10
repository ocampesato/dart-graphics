#library('LituusRectanglesScale1');
#import('dart:dom');

main() {
  new LituusRectanglesScale1();
}

class LituusRectanglesScale1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 200;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 150;
   var rectHeight   = 80;
   var lineWidth    = 1;
   var Constant     = 200;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   LituusRectanglesScale1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=1; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        radius   = Constant*Constant/angle;
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

      //if(angle % rectWidth == 0) {
      //   context.rotate(angle/20*Math.PI/180);
      //}   

        if(angle % rectWidth == 0) {
           context.scale(0.9+angle/maxAngle, 1+angle/maxAngle);
         //context.scale(1.1-angle/maxAngle, 0.8-angle/maxAngle);
        }

        // render the rectangle 
        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

