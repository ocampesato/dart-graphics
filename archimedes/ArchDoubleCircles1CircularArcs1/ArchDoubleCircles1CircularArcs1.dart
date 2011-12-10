#library('ArchDoubleCircles1CircularArcs1');
#import('dart:dom');

main() {
  new ArchDoubleCircles1CircularArcs1();
}

class ArchDoubleCircles1CircularArcs1 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 200;
   var basePointY   = 220;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 40;
   var lineWidth    = 1;
   var Constant     = 0.25;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   ArchDoubleCircles1CircularArcs1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=0; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        radius   = Constant*angle;
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

        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        context.arc(currentX+circleRadius, currentY, circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();

        // render the circular arc
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("yellow");
        } 

        context.moveTo(currentX+circleRadius, currentY); 
        context.arcTo(currentX+circleRadius+2*radius/2, currentY, 
                      currentX+circleRadius+3*radius/2, currentY-1*radius/2, 
                      2*radius);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

