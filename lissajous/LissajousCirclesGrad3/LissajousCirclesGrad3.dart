#library('LissajousCirclesGrad3');
#import('dart:dom');

main() {
  new LissajousCirclesGrad3();
}

class LissajousCirclesGrad3 {
   CanvasRenderingContext2D context;

   var maxWidth     = 800; 
   var maxHeight    = 500; 
   var basePointX   = 300;
   var basePointY   = 180;
   var currentX     = 0;
   var currentY     = 0;
   var offsetX      = 0;
   var offsetY      = 0;
   var circleRadius = 40;
   var lineWidth    = 1;
   var A            = 200;
   var B            = 2;
   var C            = 100;
   var D            = 5;
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

   LissajousCirclesGrad3() {
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

        v = ((angle/stripWidth) % hexValues.length).floor();

        index = ((angle/stripWidth)).floor();
        if( index % 3 == 0) {
           context.fillStyle = '#${hexValues[v]}${hexValues[0]}${hexValues[0]}';
        } else if( index % 3 == 1) {
           context.fillStyle = '#${hexValues[v]}${hexValues[v]}${hexValues[0]}';
        } else {
           context.fillStyle = '#${hexValues[0]}${hexValues[0]}${hexValues[v]}';
        }

        context.arc(currentX, currentY, circleRadius, 
                    0, Math.PI*2, true);

        context.fill();
        context.closePath();
        context.stroke();
     }
   }
}

