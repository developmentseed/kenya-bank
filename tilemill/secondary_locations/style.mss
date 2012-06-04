
#secondaryschools {
  marker-width:2;
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



