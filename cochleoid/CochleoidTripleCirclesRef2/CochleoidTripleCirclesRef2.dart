#library('CochleoidTripleCirclesRef2');
#import('dart:dom');

main() {
  new CochleoidTripleCirclesRef2();
}

class CochleoidTripleCirclesRef2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 600; 
   var basePointX   = 280;
   var basePointY   = 350;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 60;
   var lineWidth    = 1;
   var Constant     = 20000;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   CochleoidTripleCirclesRef2() {
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

        // render the first pair of circles
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("blue");
        } 

        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        context.arc(currentY, currentX, circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();

        // render second pair of circles 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("yellow");
        } 

        context.arc(currentX+circleRadius, currentY, circleRadius, 
                    0, Math.PI*2, true);

        context.arc(currentY+circleRadius, currentX, circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();

        // render third pair of circles
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("yellow");
        } else {
           context.setFillColor("blue");
        } 

        context.arc(currentX+circleRadius/2, currentY-circleRadius/2, 
                    circleRadius, 0, Math.PI*2, true);

        context.arc(currentY+circleRadius/2, currentX-circleRadius/2, 
                    circleRadius, 0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

