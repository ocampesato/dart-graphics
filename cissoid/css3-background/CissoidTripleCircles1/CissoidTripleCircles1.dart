#library('CissoidTripleCircles1');
#import('dart:dom');

main() {
  new CissoidTripleCircles1();
}

class CissoidTripleCircles1 {
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
   var circleRadius = 60;
   var lineWidth    = 1;
   var sine         = 0;
   var cosine       = 0;
   var factor       = 1;
   var Constant     = 200;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;

   CissoidTripleCircles1() {
     var doc = window.document;
     HTMLCanvasElement canvas = doc.getElementById("canvas");
     context = canvas.getContext("2d");
     
     drawGraphics();
   }
   
   void drawGraphics() {
     context.clearRect(0, 0, maxWidth, maxHeight);

     for(angle=0; angle<maxAngle; angle+=deltaAngle) {
        // compute circle coordinates 
        sine     = Math.sin(factor*angle*Math.PI/180);
        cosine   = Math.cos(factor*angle*Math.PI/180);
        radius   = Constant*sine*sine/cosine;
 
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

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

