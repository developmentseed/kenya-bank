@b1: #F7F7F7;
@b2: #D9D9D9;
@b3: #BDBDBD;
@b4: #969696;
@b5: #636363;
@b6: #252525;


@m1: #2bbbff;
@m2: #0091d5;
@m3: #006ea2;
@m4: #00354d;
@m5: #001d2b;
#primary_results_10 {
 [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.1;}  
  [zoom >= 11]{polygon-opacity:0;}
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
 
 [percent_pass10 >= 90]{
    //polygon-fill:#fbf36a;
    polygon-fill: @m5;line-color:darken(@m5,10);  
    }
  [percent_pass10 >= 80][percent_pass10 < 90]{
      //polygon-fill:#fff5e5;
    polygon-fill: @m4;line-color:darken(@m4,10);  
   }
 [percent_pass10 >= 70][percent_pass10 < 80]{
      //polygon-fill:#fff5e5;
    polygon-fill: @m3;line-color:darken(@m3,10);  
   }
 [percent_pass10 >= 60][percent_pass10 < 70]{
      //polygon-fill:#fff5e5;
    polygon-fill: @m2;line-color:darken(@m2,10);
  }
 [percent_pass10 >= 50][percent_pass10 < 60]{
      //polygon-fill: #bd6f4b;
    polygon-fill: @m1;line-color:darken(@m1,10);

  }  
}

 