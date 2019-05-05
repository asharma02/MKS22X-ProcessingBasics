int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
  bg = color(255,255,0); //inner triangles colors
  fg = color(0, 0, 255); //fg = outer triangle color
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    fill(fg); //using outer trangle color
    triangle(v1x, v1y, v2x, v2y, v3x, v3y); //nkae this triagle
    fill(bg); //use inner triagnle color now
    if(levels>0){ //if mouse is clicked
      float new1x = (v1x+v2x)/2; //determine midpoints
      float new1y = (v1y+v2y)/2;
      float new2x = (v2x+v3x)/2;
      float new2y = (v2y+v3y)/2;
      float new3x = (v1x+v3x)/2;
      float new3y = (v1y+v3y)/2;
      triangle(new1x, new1y, new2x, new2y, new3x, new3y); //make new triangle
      gasket(levels-1, v1x, v1y, new1x, new1y, new3x, new3y); //reset level and recusrivly run for each of the three smaller outer traingles made
      gasket(levels-1, v2x, v2y, new2x, new2y, new1x, new1y);
      gasket(levels-1, v3x, v3y, new3x, new3y, new2x, new2y);
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
