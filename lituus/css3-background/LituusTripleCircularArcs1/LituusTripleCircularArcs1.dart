#library('LituusTripleCircularArcs1');
#import('dart:dom');

main() {
  new LituusTripleCircularArcs1();
}

class LituusTripleCircularArcs1 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 300;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 60;
   var lineWidth    = 1;
   var Constant     = 200;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   LituusTripleCircularArcs1() {
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

        // draw first circle 
        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // draw second circle 
        context.arc(currentX+circleRadius, currentY, circleRadius, 
                    0, Math.PI*2, true);

        // draw third circle 
        context.arc(currentX+circleRadius/2, currentY-circleRadius/2, circleRadius, 
                    0, Math.PI*2, true);

        context.moveTo(currentX+circleRadius, currentY); 
        context.arcTo(currentX+circleRadius+2*radius/2, currentY, 
                      currentX+circleRadius+3*radius/2, currentY+1*radius/2, 
                      2*radius);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

