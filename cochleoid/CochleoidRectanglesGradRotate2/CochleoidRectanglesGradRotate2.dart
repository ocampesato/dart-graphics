#library('CochleoidRectanglesGradRotate2');
#import('dart:dom');

main() {
  new CochleoidRectanglesGradRotate2();
}

class CochleoidRectanglesGradRotate2{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 280;
   var fixedPointX  = 700;
   var fixedPointY  = 100;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 200;
   var rectHeight   = 100;
   var lineWidth    = 1;
   var Constant     = 20000;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var v            = 0;

   static final hexValues = const [0x0, 0x1, 0x2, 0x3,
                                   0x4, 0x5, 0x6, 0x7,
                                   0x8, 0x9, 0xA, 0xB,
                                   0xC, 0xD, 0xE, 0xF];

 //static final stripWidth = Math.floor(maxAngle/hexValues.length);
   static final stripWidth = 45;

   CochleoidRectanglesGradRotate2() {
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

        // render the rectangle 
        context.beginPath();
        context.lineWidth = lineWidth;

        v =  ((angle/stripWidth) % hexValues.length).floor();
        context.fillStyle = '#${hexValues[v]}${hexValues[0]}${hexValues[0]}';

        if(angle % rectWidth == 0) {
           context.rotate(angle/20*Math.PI/180);
        }

        // render rectangle 
        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        // render line segment 
        context.moveTo(fixedPointX, fixedPointY);
        context.lineTo(currentX, currentY);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

