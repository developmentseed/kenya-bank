@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;

#literacy {  
  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.2;}  
  [zoom >= 11]{polygon-opacity:0.1;}
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
 
 [average_lit_2005_06 >= 0][average_lit_2005_06 < 30]{polygon-fill: @m1;line-color:darken(@m1,10);}
 [average_lit_2005_06 >= 30][average_lit_2005_06 < 66.59911]{polygon-fill: @m2;line-color:darken(@m2,10);} 
 [average_lit_2005_06 >= 66.59911] [average_lit_2005_06 < 81.75644 ]{polygon-fill: @m3;line-color:darken(@m3,10);}
 [average_lit_2005_06 >= 81.75644][average_lit_2005_06 < 87.05281]{polygon-fill: @m4;line-color:darken(@m4,10);}
 [average_lit_2005_06 >= 87.05281]{polygon-fill: @m5;line-color:darken(@m5,10);}

}
