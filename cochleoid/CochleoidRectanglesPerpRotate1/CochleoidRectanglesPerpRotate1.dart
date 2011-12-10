#library('CochleoidRectanglesPerpRotate1');
#import('dart:dom');

main() {
  new CochleoidRectanglesPerpRotate1();
}

class CochleoidRectanglesPerpRotate1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 330;
   var basePointY   = 320;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 200;
   var rectHeight   = 100;
   var lineWidth    = 1;
   var Constant     = 20000;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   CochleoidRectanglesPerpRotate1() {
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

        if(angle % rectWidth == 0) {
           context.rotate(angle/20*Math.PI/180);
        }

        // draw first rectangle 
        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        // draw second rectangle 
        context.fillRect(currentX+(rectWidth-rectHeight)/2, 
                         currentY-(rectWidth-rectHeight)/2, 
                         rectHeight, rectWidth);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

