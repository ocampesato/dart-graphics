#library('ArchTripleCirclesTube2');
#import('dart:dom');

main() {
  new ArchTripleCirclesTube2();
}

class ArchTripleCirclesTube2 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 280;
   var basePointY   = 240;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var circleRadius = 80;
   var lineWidth    = 1;
   var Constant     = 0.25;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var index        = 720;
   var factor       = 1;

   static final stripWidth = 45;
   static final factorValues = const [1.0, 0.5];

   ArchTripleCirclesTube2() {
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

        index = ((angle/stripWidth)).floor();
        factor = factorValues[index%2];

        // draw first circle 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("blue");
        } 

        context.arc(currentX, currentY, factor*circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();

        // draw second circle 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("red");
        } else {
           context.setFillColor("yellow");
        } 

        context.arc(currentX+circleRadius, currentY, 
                    factor*circleRadius, 0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();

        // draw third circle 
        context.beginPath();
        context.lineWidth = lineWidth;

        if(angle/deltaAngle % 2 == 0) {
           context.setFillColor("yellow");
        } else {
           context.setFillColor("blue");
        } 

        context.arc(currentX+circleRadius/2, currentY-circleRadius/2, 
                    factor*circleRadius, 0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

