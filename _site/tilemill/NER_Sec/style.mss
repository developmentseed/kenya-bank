@b1: #F7F7F7;
@b2: #D9D9D9;
@b3: #BDBDBD;
@b4: #969696;
@b5: #636363;
@b6: #252525;

@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;

#NER {
  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.1;}  
  [zoom >= 11]{polygon-opacity:0;} 
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;

   [NER_Sec_2009 >= 0][NER_Sec_2009 < 10]{
    //polygon-fill:#aaa0a6;
  polygon-fill: @m1;line-color:darken(@m1,10);
  }
   [NER_Sec_2009 >= 10][NER_Sec_2009 < 20]{ 
    //polygon-fill:#7d6e80;
     polygon-fill: @m2;line-color:darken(@m2,10);
    }
   [NER_Sec_2009 >= 20][NER_Sec_2009 < 30]{ 
    //polygon-fill:#444;
    polygon-fill: @m3;line-color:darken(@m3,10);
    }
  [NER_Sec_2009 >= 30][NER_Sec_2009 < 40]{ 
    //polygon-fill:#111111;
    polygon-fill: @m4;line-color:darken(@m4,10);  
    }
    [NER_Sec_2009 >= 40]{ 
    //polygon-fill:#111111;
    polygon-fill: @m5;line-color:darken(@m5,10);  
    }
  }

