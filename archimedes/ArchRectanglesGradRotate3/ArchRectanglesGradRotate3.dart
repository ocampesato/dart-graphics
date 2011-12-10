#library('ArchRectanglesGradRotate3');
#import('dart:dom');

main() {
  new ArchRectanglesGradRotate3();
}

class ArchRectanglesGradRotate3{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 400;
   var basePointY   = 100;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 200;
   var rectHeight   = 100;
   var lineWidth    = 1;
   var Constant     = 0.25;
   var angle        = 0;
   var deltaAngle   = 1;
   var maxAngle     = 720;
   var index        = 0;
   var v            = 0;

   static final hexValues = const [0x0, 0x1, 0x2, 0x3,
                                   0x4, 0x5, 0x6, 0x7,
                                   0x8, 0x9, 0xA, 0xB,
                                   0xC, 0xD, 0xE, 0xF];

 //static final stripWidth = Math.floor(maxAngle/hexValues.length);
   static final stripWidth = 45;

   ArchRectanglesGradRotate3() {
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

        // render the rectangle 
        context.beginPath();
        context.lineWidth = lineWidth;

        v = ((angle/stripWidth) % hexValues.length).floor();

        index = ((angle/stripWidth)).floor();
        if( index % 3 == 0) {
           context.fillStyle = '#${hexValues[v]}${hexValues[0]}${hexValues[0]}';
        } else if( index % 3 == 1) {
           context.fillStyle = '#${hexValues[v]}${hexValues[v]}${hexValues[0]}';
        } else {
           context.fillStyle = '#${hexValues[0]}${hexValues[0]}${hexValues[v]}';
        }

        if(angle % rectWidth == 0) {
           context.rotate(angle/20*Math.PI/180);
        }

        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}


