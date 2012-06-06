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
#literacy {  
  [zoom > 0][zoom <= 8]{polygon-opacity: 0.6;}
  [zoom = 9]{polygon-opacity:0.4;}
  [zoom = 10]{polygon-opacity:0.2;}  
  [zoom >= 11]{polygon-opacity:0.1;}
  line-width:0.25;
  line-opacity: 0.8;
  line-gamma:1;
 
  [average_lit_2005_06 >= 0][average_lit_2005_06 < 30]{
     polygon-fill: @m1;line-color:darken(@m1,10);
   //polygon-fill:saturate(#ffdaa5,10%);
    
 }
 [average_lit_2005_06 >= 30][average_lit_2005_06 < 66.59911]{
   //polygon-fill:saturate(#ffbfa4,10%);
     polygon-fill: @m2;line-color:darken(@m2,10);
  } 
 [average_lit_2005_06 >= 66.59911] [average_lit_2005_06 < 81.75644 ]{
    //polygon-fill:saturate(#e6919b,10%);
      polygon-fill: @m3;line-color:darken(@m3,10);
   }
  [average_lit_2005_06 >= 81.75644][average_lit_2005_06 < 87.05281]{
   //polygon-fill:saturate(#cf708f,10%);
     polygon-fill: @m4;line-color:darken(@m4,10);  
  }
  [average_lit_2005_06 >= 87.05281]{
    //polygon-fill:#d22b74;
     polygon-fill: @m5;line-color:darken(@m5,10);     
  }
}

/*

<div class='my-legend'>
<div class='title'>Literacy Rate: Average </div>
<div class='scale'>
  <ul class='labels'>
    <li><span style='background:#dfdcd8;'></span>< 30%</li>
    <li><span style='background:#cecbc7;'></span>< 67%</li>
    <li><span style='background:#b7b4b0;'></span>< 81%</li>
    <li><span style='background:#989591;'></span>< 87%</li>
    <li><span style='background:#73706c;'></span>< 100%</li>
</ul>
</div>
<div class='source'>Source: <a href="hhttps://opendata.go.ke/Education/Percentage-distribution-of-Population-15-years-by-/jbxi-fy92">KENYA openData</a></div>
</div>

<style type='text/css'>
  .wax-legend .title {
    text-align: left;
    margin-bottom: 8px;
    font-weight: bold;
    font-size: 90%;
    }
  .wax-legend .scale ul {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    }
  .wax-legend .scale ul li {
    display: block;
    float: left;
    width: 40px;
    margin-bottom: 6px;
    text-align: center;
    font-size: 80%;
    list-style: none;
    }
  .wax-legend ul.labels li span {
    height: 10px;
    width: 40px;

    }
  .wax-legend ul li span {
    display: block;
    float: left;
    }
  .wax-legend .source {
    font-size: 70%;
    color: #999;
    clear: both;
    }
  .wax-attribution a,
  .wax-legend a {
    color: #777;
    }
</style>

<div class='note'>Rate represents averaged male and female literacy rates  
</div>

.wax-legend .note {
    line-height:13px;
    font-size:85%;
    text-align: left;
    margin-bottom: 8px;
    font-style: italic;
   }


{{#percent_passed10}}
<div class='heading'>
<h4 class='int-title'>{{{COUNTY}}}</h4>
</div>
<div class='clearfix'>
  <div class='total' style='float:left;'>
   <h5 class='int-stat'>
   Passed:<br></br>
   <span class='int-value'>{{{percent_passed10}}}%</span>
   </h5>
   <h6 class='int-range'>
   <span class='int-range'>{{{lowest_percentage_passed10}}}%</span> 
   <span class='int-range'>{{{highest_percentage_passed10}}}%</span>
   </h6>
  </div>
  <div class='gender' style='float: left;'>
   <h6 class='int-gender'>
   Female: 
   <span class='int-gender'>{{{percent_female_passed10}}}%</span> 
   Male: 
   <span class='int-gender'>{{{percent_male_passed10}}}%</span>
   </h6>
  </div>
</div>
{{/percent_passed10}}
<style type='text/css'>

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


</style>




*/