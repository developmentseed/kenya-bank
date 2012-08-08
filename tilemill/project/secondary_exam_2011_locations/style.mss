/* Color variables */  
@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;

/* Layers */  
#kenyaknecscores[g_knec_code != 401][g_knec_code != 205][g_knec_code != 805][g_knec_code != 557][g_knec_code != 508] {
    marker-opacity: 0.5;
    marker-line-opacity:0.5;
    marker-width:2;
    marker-fill: lighten(@m1,30);
    marker-line-color:@m3;
    marker-line-width:1;
    marker-allow-overlap:true;
  [zoom <= 7]{
    marker-allow-overlap:false;
    [knec_total_students = 0]{marker-width:1;}
    [knec_total_students <= 25]{marker-allow-overlap:true;marker-opacity:0;marker-line-opacity:0;}
    [knec_total_students > 25][knec_total_students <= 50]{marker-width:4;}
    [knec_total_students > 50][knec_total_students <= 75]{marker-width:6;}
    [knec_total_students > 75][knec_total_students <= 300]{marker-allow-overlap:true;marker-width:8;marker-opacity:0.8;}
    [knec_total_students > 200]{marker-width:12;marker-opacity:0.8;}
    }
  [zoom = 8]{
    marker-allow-overlap:false;
    [knec_total_students = 0]{marker-width:1;}
    [knec_total_students <= 25]{marker-allow-overlap:true;marker-opacity:0;marker-line-opacity:0;}
    [knec_total_students > 25][knec_total_students <= 50]{marker-width:6;}
    [knec_total_students > 50][knec_total_students <= 75]{marker-width:8;}
    [knec_total_students > 75][knec_total_students <= 300]{marker-allow-overlap:true;marker-width:10;marker-opacity:0.8;}
    [knec_total_students > 300]{marker-width:14;marker-opacity:0.8;}
    }
  
  [zoom >= 9][zoom < 11]{
    marker-allow-overlap:false;
    [knec_total_students = 0]{marker-width:1;}
    [knec_total_students <= 25]{marker-allow-overlap:true;marker-opacity:0;marker-line-opacity:0;}
    [knec_total_students > 25][knec_total_students <= 50]{marker-width:8;}
    [knec_total_students > 50][knec_total_students <= 75]{marker-width:12;}
    [knec_total_students > 75][knec_total_students <= 300]{marker-allow-overlap:true;marker-width:16;marker-opacity:0.8;}
    [knec_total_students > 300]{marker-width:20;marker-opacity:0.8;}
    }
   [zoom = 11]{
    marker-allow-overlap:false;
    [knec_total_students = 0]{marker-width:1;}
    [knec_total_students <= 25]{marker-allow-overlap:true;marker-width:6;}
    [knec_total_students > 25][knec_total_students <= 50]{marker-width:10;}
    [knec_total_students > 50][knec_total_students <= 75]{marker-width:16;}
    [knec_total_students > 75][knec_total_students <= 300]{marker-allow-overlap:true;marker-width:20;marker-opacity:0.8;}
    [knec_total_students > 300]{marker-width:25;marker-opacity:0.8;}
    }
  [zoom > 11]{
    marker-allow-overlap:false;
    [knec_total_students = 0]{marker-width:1;}
    [knec_total_students <= 25]{marker-allow-overlap:true;marker-width:8;}
    [knec_total_students > 25][knec_total_students <= 50]{marker-width:12;}
    [knec_total_students > 50][knec_total_students <= 75]{marker-width:18;}
    [knec_total_students > 75][knec_total_students <= 300]{marker-allow-overlap:true;marker-width:23;marker-opacity:0.8;}
    [knec_total_students > 500]{marker-width:30;marker-opacity:0.8;}
    }
}
