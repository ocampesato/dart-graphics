#library('ConchoidTripleCirclesFP2');
#import('dart:dom');

main() {
  new ConchoidTripleCirclesFP2();
}

class ConchoidTripleCirclesFP2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 200;
   var basePointY   = 220;
   var fixedPointX  = 700;
   var fixedPointY  = 100;
   var fixedPointX2 = 700;
   var fixedPointY2 = 400;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 60;
   var lineWidth    = 1;
   var Constant1    = 120;
   var Constant2    = 80;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var angleModulus = 3;

   ConchoidTripleCirclesFP2() {
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

