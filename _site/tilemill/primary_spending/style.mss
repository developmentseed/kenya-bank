

@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;

#primary_spending {

  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.1;}  
  [zoom >= 11]{polygon-opacity:0.0;}
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
  
  [Per_Primary_capita_spending_TSC_Enrolments_2011_num >= 4.0][Per_Primary_capita_spending_TSC_Enrolments_2011_num < 6.0]{
  //polygon-fill:saturate(#ffbfa4,10%);
  polygon-fill: @m1;line-color:darken(@m1,10);
  }
  [Per_Primary_capita_spending_TSC_Enrolments_2011_num >= 6.0][Per_Primary_capita_spending_TSC_Enrolments_2011_num < 8.0]{
  //polygon-fill:saturate(#e6919b,10%);
  polygon-fill: @m2;line-color:darken(@m2,10);
  }
  [Per_Primary_capita_spending_TSC_Enrolments_2011_num >= 8.0][Per_Primary_capita_spending_TSC_Enrolments_2011_num < 10.0]{
  //polygon-fill:saturate(#cf708f,10%);
  polygon-fill: @m3;line-color:darken(@m3,10);
  }
  [Per_Primary_capita_spending_TSC_Enrolments_2011_num >= 10.0][Per_Primary_capita_spending_TSC_Enrolments_2011_num < 11.0]{
  //polygon-fill:#d22b74;
  polygon-fill: @m4;line-color:darken(@m4,10);
  }
  [Per_Primary_capita_spending_TSC_Enrolments_2011_num >= 11.0]{
  //polygon-fill:#d22b74;
  polygon-fill: @m5;line-color:darken(@m5,10);
  }
}
