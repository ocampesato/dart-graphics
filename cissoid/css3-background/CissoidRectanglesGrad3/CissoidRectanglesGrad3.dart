#library('CissoidRectanglesGrad3');
#import('dart:dom');

main() {
  new CissoidRectanglesGrad3();
}

class CissoidRectanglesGrad3{
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 250;
   var basePointY   = 200;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var radius       = 0;
   var rectWidth    = 100;
   var rectHeight   = 50;
   var lineWidth    = 1;
   var sine         = 0;
   var cosine       = 0;
   var factor       = 1;
   var Constant     = 200;
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

   CissoidRectanglesGrad3() {
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

        v = ((angle/stripWidth) % hexValues.length).floor();

        index = ((angle/stripWidth)).floor();
        if( index % 3 == 0) {
           context.fillStyle = '#${hexValues[v]}${hexValues[0]}${hexValues[0]}';
        } else if( index % 3 == 1) {
           context.fillStyle = '#${hexValues[v]}${hexValues[v]}${hexValues[0]}';
        } else {
           context.fillStyle = '#${hexValues[0]}${hexValues[0]}${hexValues[v]}';
        }

        context.fillRect(currentX, currentY, 
                         rectWidth, rectHeight);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}


