#library('LissajousRectanglesPerpRotate1');
#import('dart:dom');

main() {
  new LissajousRectanglesPerpRotate1();
}

class LissajousRectanglesPerpRotate1{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 120;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var rectWidth    = 200;
   var rectHeight   = 100;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   LissajousRectanglesPerpRotate1() {
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

