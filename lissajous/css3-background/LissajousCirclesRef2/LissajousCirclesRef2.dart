#library('LissajousCirclesRef2');
#import('dart:dom');

main() {
  new LissajousCirclesRef2();
}

class LissajousCirclesRef2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 210;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var circleRadius = 70;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   LissajousCirclesRef2() {
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

        // render the first circle 
        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // render the second circle 
        context.arc(currentX+circleRadius, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // render the third circle 
        context.arc(currentY, currentX, circleRadius, 
                    0, Math.PI*2, true);

        // render the fourth circle 
        context.arc(currentY+circleRadius, currentX, circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

