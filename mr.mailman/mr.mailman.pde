import tramontana.library.*;

import netP5.*;
import oscP5.*;
import websockets.*;

WebsocketServer ws;

int now;
int i;

Tramontana iphone;

OscP5 osc;

float flash;
float max_so;
float ave_so;


void setup() {
  size(600, 600);
  osc = new OscP5(this, 1200); 
  osc.plug(this, "near", "/ZIGSIM/ZZ/proximitymonitor");
  osc.plug(this, "sound", "/ZIGSIM/ZZ/miclevel");
  //ws= new WebsocketServer(this, 8080, "");
  now = millis();
  iphone = new Tramontana(this, "10.28.20.70");
  //iphone = new Tramontana(this, "169.254.10.136");
  //iphone = new Tramontana(this,"192.168.1.100");
  background(50);
  i = 0;
}

public void near(int x) {
  flash = map(x, 0, 1, 0, 255);
}

public void sound(float a, float b) {
  max_so = map(a, -50, 0, height, 0);
  ave_so = map(b, -50, 0, height, 0);
}

void draw() {
  //background(flash);
  println(max_so, "and average is ", ave_so);
    
    //override prvious data
    noStroke();
    fill(50);
    rect(i,0,1,height);
    
    //red for maximum sound
    stroke(255,0,0);
    point(i,max_so);
    
    //green for averate sound
    stroke(0,255,0);
    point(i,ave_so);
    i = i+1;
  if (i > width) {
    i = 0;
  } 
  


  //if ((millis()>now+5000)){

  if (flash > 200) {
  //iphone.pulseFlashLight(1, 3, 1);
  iphone.setFlashLight(1);
  }
  else {
    iphone.setFlashLight(0);
  }
}
