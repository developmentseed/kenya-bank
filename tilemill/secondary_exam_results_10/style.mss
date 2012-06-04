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
#sec_exam_10 {
  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.1;}  
  [zoom >= 11]{polygon-opacity:0;}  
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
  
  [percent_passed10 >= 34]{
   polygon-fill: @m5;line-color:darken(@m5,10);
    }
  //percentage schools with passing average grade increased
  [percent_passed10 >= 26][percent_passed10 <= 34]{
    polygon-fill: @m4;line-color:darken(@m4,10);
    }
  //stayed the same
  [percent_passed10 >= 18][percent_passed10 < 26]{
     polygon-fill: @m3;line-color:darken(@m3,10);
      }
   [percent_passed10 >= 12][percent_passed10 < 18]{
      polygon-fill: @m2;line-color:darken(@m2,10);  
     }  
  //percentage schools with passing average grade decreased
  [percent_passed10 >= 3][percent_passed10 < 12]{
     polygon-fill: @m1;line-color:darken(@m1,10);
    }  
  
}

/*
.wax-tooltip {
min-width:240px;
width:auto;
height:90px;
}
.wax-tooltip h5.int-stat {
display:block;
float:left;
}
.wax-tooltip h6.int-gender {
position:relative;
left:10px;
top:20px;
font-size:12px;
}
.wax-tooltip span.int-value{
font-size:17px;
position: relative;
left:10px;
}
.wax-tooltip span.int-gender{
font-size:13px;
margin:5px;
}
.wax-tooltip h6.int-range {
display:block;
}
.wax-tooltip span.int-range{
font-size:10px;
margin-right:10px;
position:relative;
}
Female: 
   <span class='int-gender'>{{{percent_female_passed10}}}%</span> 
   Male: 
   <span class='int-gender'>{{{percent_male_passed10}}}%</span>

</style>



<h6 class='int-range'>
   (Range: {{{lowest_percentage_passed10}}} -    
    {{{highest_percentage_passed10}}}%)  
  </h6>*/
