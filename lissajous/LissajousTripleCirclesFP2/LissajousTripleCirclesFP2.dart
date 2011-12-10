#library('LissajousTripleCirclesFP2');
#import('dart:dom');

main() {
  new LissajousTripleCirclesFP2();
}

class LissajousTripleCirclesFP2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 220;
   var fixedPointX  = 700;
   var fixedPointY  = 100;
   var fixedPointX2 = 700;
   var fixedPointY2 = 400;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var circleRadius = 60;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var angleModulus = 3;

   LissajousTripleCirclesFP2() {
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

        // render the circle 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("blue");
        } 

        // render first circle 
        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // render second circle 
        context.arc(currentX+circleRadius, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // render third circle 
        context.arc(currentX+circleRadius/2, currentY-circleRadius/2, circleRadius, 
                    0, Math.PI*2, true);

        if(angle % angleModulus == 0) {
           // render first line segment 
           context.moveTo(fixedPointX, fixedPointY);
           context.lineTo(currentX, currentY);

           // render second line segment 
           context.moveTo(fixedPointX2, fixedPointY2);
           context.lineTo(currentX, currentY);
        }

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

