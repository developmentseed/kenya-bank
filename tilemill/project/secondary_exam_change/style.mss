@b1: #F7F7F7;
@b2: #D9D9D9;
@b3: #BDBDBD;
@b4: #969696;
@b5: #636363;
@b6: #252525;

@m1: #2bbbff;
@m2:  #0091d5;
@m3: #006ea2;
@m4: #00354d;
@m5: #001d2b;

#sec_exam_change {
 [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
 [zoom = 9]{polygon-opacity:0.4;}
 [zoom = 10]{polygon-opacity:0.1;}  
 [zoom >= 11]{polygon-opacity:0;}
 line-width:0.25;
 line-opacity: 0.8;
 line-gamma:1;
 
 [percent_change_0610 >= 6][percent_change_0610 <= 10]{polygon-fill:@m3;line-color:darken(@m3,10);}
 [percent_change_0610 >= 3][percent_change_0610 < 6]{polygon-fill:@m2;line-color:darken(@m2,10);}
 [percent_change_0610 >= 0][percent_change_0610 < 3]{polygon-fill:@m1;line-color:darken(@m1,10); }
 [percent_change_0610 < 0][percent_change_0610 > -10]{polygon-fill:@b3;line-color:darken(@b3,10);}
 [percent_change_0610 <= -10]{polygon-fill:@b4;line-color:darken(@b4,10);}
}
