#library('LissajousTripleCirclesTube1');
#import('dart:dom');

main() {
  new LissajousTripleCirclesTube1();
}

class LissajousTripleCirclesTube1 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 240;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var circleRadius = 80;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var index        = 720;
   var factor       = 1;

   static final stripWidth = 45;
   static final factorValues = const [1.0, 0.5];

   LissajousTripleCirclesTube1() {
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

        index = ((angle/stripWidth)).floor();
        factor = factorValues[index%2];

        // draw first circle 
        context.arc(currentX, currentY, factor*circleRadius, 
                    0, Math.PI*2, true);

        // draw second circle 
        context.arc(currentX+factor*circleRadius, currentY, 
                    factor*circleRadius, 0, Math.PI*2, true);

        // draw second circle 
        context.arc(currentX+circleRadius/2, currentY-circleRadius/2, 
                    factor*circleRadius, 0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

