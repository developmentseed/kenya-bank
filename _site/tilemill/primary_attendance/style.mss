/*
#net_attendance_primary{
  line-width:0.2;
  line-opacity: 0.5;
  line-gamma:1;
 
   [distid = 411]{
   polygon-pattern-file:url(/Users/mayarichman/Documents/MapBox/stripepngs/trans_stripe_64.png);
   polygon-opacity:.4;  
  }
   [distid = 803]{
   polygon-pattern-file:url(/Users/mayarichman/Documents/MapBox/stripepngs/trans_stripe_64.png);
   polygon-opacity:.4;
  } 
   [distid = 603]{     
   polygon-pattern-file:url(/Users/mayarichman/Documents/MapBox/stripepngs/trans_stripe_64.png);
   polygon-opacity:.4; 
  }
  
  [School = 'Primary']{
    
  polygon-opacity:.6;
  line-width:0.2;
  line-opacity: 0.5;
  line-gamma:1;
 [Average >= 0][Average < 12]{
  polygon-fill: #91b8aa;
  }
 [Average >= 12][Average <  20]{
  polygon-fill:#5cb697;
  }
 [Average >=  20][Average <  50]{
  polygon-fill:#45ab86;
    //polygon-fill:#30856d;
   
  }
 [Average >=  50 ][Average < 80]{
    polygon-fill:#2a8b80;
  //polygon-fill:#155050;
  }
  [Average >= 80][Average < 100]{
    polygon-fill:#294d5d;
     //polygon-fill:#13252e;
  }
    
    }
  
  
  
}
*/
/*
#net_attendance_primary[School = 'Primary']{
  polygon-opacity:.6;
  line-width:0.2;
  line-opacity: 0.5;
  line-gamma:1;
 
 [Average >= 0][Average < 12]{
  polygon-fill: #91b8aa;
  }
 [Average >= 12][Average <  20]{
  polygon-fill:#5cb697;
  }
 [Average >=  20][Average <  50]{
  polygon-fill:#45ab86;
    //polygon-fill:#30856d;
   
  }
 [Average >=  50 ][Average < 80]{
    polygon-fill:#2a8b80;
  //polygon-fill:#155050;
  }
  [Average >= 80][Average < 100]{
    polygon-fill:#294d5d;
     //polygon-fill:#13252e;
  }
}


<div class='my-legend'>
<div class='title'>Net Attendance Average in Primary School</div>
<div class='scale'>
  <ul class='labels'>
    <li><span style='background:#b4daca;'></span>< 13%</li>
    <li><span style='background:#7baf9b;'></span>< 20%</li>
    <li><span style='background:#86c0a6;'></span>< 50%</li>
    <li><span style='background:#76ada2;'></span>< 80%</li>
    <li><span style='background:#75888d;'></span>< 100%</li>
    <li><span><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAPCAYAAACm25zCAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAN1wAADdcBQiibeAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAADpSURBVEiJ1ZRdCsQgDITHNNr2/gdYWNgrFlol7pOl/mzBogv6OCKfSWaiPu+Xx+UQEZZlARFdZXjvse87nHORrpQCM2OeZ6THWgtrLUQk0nswKH1gjCkCnHMZAACYGVrrTBeRYhG9GBxEIoIxBsycPSh1CQCmaSp2SUSwbVum92RwALQedamIngwKXRrRTlEhpVEHwK/Oaq2zT4kIjuMoFsHM/2DU+XVd10xvnYlHjKs4UiZSxkkZLRMp45zICCv2jsEhQCPaKdLviqhaf5VrvDWD7vxas/5q13hrRmbkUTKRMs6b0TKRMr7+sNRervg1wQAAAABJRU5ErkJggg==" alt="" /></span>No Data</li>
  </ul>
</div>
<div class='source'>Source: <a href="https://opendata.go.ke/Education/Kenya-Primary-Schools-2007/p452-xb7c">KENYA openData</a></div>
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
    width: 50px;
    margin-bottom: 6px;
    text-align: center;
    font-size: 80%;
    list-style: none;
    }
  .wax-legend ul.labels li span {
    height: 15px;
    width: 50px;
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
*/

#primaryschools {
  marker-width:2;
  //marker-fill:#ad80cf;
  marker-fill:#333;
  marker-opacity:.25;
  marker-line-color:#000;
  marker-line-width:0.5;
  marker-line-opacity:.8;
  marker-allow-overlap:true;
  
  [zoom >= 7]{
      marker-width:2;
      marker-line-opacity:.7;
    }
  [zoom >= 8]{
     marker-width:7;
     marker-line-opacity:.9;
    }
  [zoom >= 9]{
     marker-width:10;
     marker-opacity:.4;
     marker-line-opacity:1;
    }
  [zoom >= 10]{
     marker-width:15;
     marker-opacity:.5;
     marker-line-opacity:1;
    }
  
}
