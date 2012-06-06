/* @m1: #2bbbff;
@m2:  #0091d5;
@m3: #006ea2;
@m4: #00354d;
@m5: #001d2b;
*/
@m1: #2bbbff;
@m2:  #0091d5;
@m3: #006ea2;
@m4: #00354d;
@m5: #001d2b;

#tpr-sec {
  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.1;}
  [zoom >= 11]{polygon-opacity:0;}
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
  
  [ptr_secondary_r >= 33]{
    polygon-fill:@m5;line-color:darken(@m5,10);  
  }
  [ptr_secondary_r >= 28][ptr_secondary_r < 33]{
    polygon-fill:@m4;line-color:darken(@m4,10);  
  }
  [ptr_secondary_r >= 23][ptr_secondary_r < 28]{
    polygon-fill:@m3;line-color:darken(@m3,10);  
  }
  [ptr_secondary_r >= 18][ptr_secondary_r < 23]{
    polygon-fill:@m2;line-color:darken(@m2,10);
   }
   [ptr_secondary_r >= 12][ptr_secondary_r < 18]{
    polygon-fill:@m1;line-color:darken(@m1,10);
   }

}
