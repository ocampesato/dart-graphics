#library('LissajousRectanglesScale1');
#import('dart:dom');

main() {
  new LissajousRectanglesScale1();
}

class LissajousRectanglesScale1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 150;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var rectWidth    = 150;
   var rectHeight   = 80;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   LissajousRectanglesScale1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=0; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        offsetX  = A*Math.sin(B*angle*Math.PI/180);
        offsetY  = C*Math.cos(D*angle*Math.PI/180);
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

