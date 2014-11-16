 // Graphing sketch
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and moves a ball trough the secrren according to value. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 16 nov 2014
 // by Juan Álvarez based on a project by Tom Igoe
 // This example code is in the public domain.
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 float xPos = 50;         // horizontal position of the graph
 
 
 void setup () {
 // set the window size:
 size(800, 600);        
 
 // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[0], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 // set inital background:
 background(0);
 }
 void draw () {
  // everything happens in the serialEvent()
 }
 
 void serialEvent (Serial myPort) {
   background(0); 
 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // convert to a number and map to the screen width (we use 50 as a safety distance):
 float inByte = float(inString); 
 inByte = map(inByte, 0, 1023, 50, width-50);
 
 //set the x coordinate according to this number
 xPos= inByte;
 
 // draw the ball:
  fill(255,0,0);
   ellipse(xPos,height/2,50,50);
 
  }
 }
