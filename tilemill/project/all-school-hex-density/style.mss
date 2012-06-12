/* Colors */

@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;

/* Layers */  
#hex {  
  line-width:0.5;  
  polygon-opacity:0.6;  
  line-opacity: 0.6;  
  [prim_cnt=0]{polygon-opacity:0;line-opacity:0;} 
  [prim_cnt > 0][prim_cnt <= 10]{polygon-fill:@m1;line-color:darken(@m1,10);}  
  [prim_cnt > 10][prim_cnt <= 50]{polygon-fill:@m2;line-color:darken(@m2,10);}
  [prim_cnt > 50][prim_cnt <= 100]{polygon-fill:@m3;line-color:darken(@m3,10);}  
  [prim_cnt > 100][prim_cnt <= 200]{polygon-fill:@m4;line-color:darken(@m4,10);}  
  [prim_cnt > 200]{polygon-fill:@m5;line-color:darken(@m5,10);}  
  [zoom = 10]{polygon-opacity:0.3; line-opacity:0.3;}
  [zoom >= 11]{polygon-opacity:0.1; line-opacity:0.1;}  
}  

