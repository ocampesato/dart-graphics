#library('ConchoidDoubleCircles1CircularArcs2');
#import('dart:dom');

main() {
  new ConchoidDoubleCircles1CircularArcs2();
}

class ConchoidDoubleCircles1CircularArcs2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 600; 
   var basePointX   = 200;
   var basePointY   = 320;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 40;
   var lineWidth    = 1;
   var Constant1    = 120;
   var Constant2    = 80;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   ConchoidDoubleCircles1CircularArcs2() {
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
        context.arcTo(currentX+circleRadius+2*radius/2+angle/10, currentY+angle/10, 
                      currentX+circleRadius+3*radius/2+angle/10, currentY-1*radius/2+angle/10, 
                      angle/20*circleRadius);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

