/* Color variables */  
@m1 : #2bbbff;
@m2:  #0091d5;
@m3 : #006ea2;
@m4 : #00354d;
@m5: #001d2b;


/* Layers */  

#primary-schools {
    marker-opacity: 0.5;
    marker-line-opacity:0.5;
    marker-width:2;
    marker-fill: lighten(@m1,30);
    marker-line-color:@m3;
    marker-line-width:1;
    marker-allow-overlap:true;
  [zoom <= 7]{
    marker-allow-overlap:false;
    [toterl = 0]{marker-width:1;}
    [toterl = 0][toterl <= 50]{marker-opacity:0;marker-line-opacity:0;}
    [toterl > 50][toterl <= 300]{marker-width:4;}
    [toterl > 300][toterl <= 500]{marker-width:6;}
    [toterl > 500][toterl <= 800]{marker-width:8;marker-opacity:0.8;}
    [toterl > 800][toterl <= 1500]{marker-allow-overlap:true;marker-width:12;marker-opacity:0.8;}
    [toterl > 1500]{marker-allow-overlap:true;marker-width:18;marker-opacity:0.8;}
    }
  [zoom = 8]{
    marker-allow-overlap:false;
    [toterl = 0]{marker-width:1;}
    [toterl = 0][toterl <= 50]{marker-opacity:0;marker-line-opacity:0;}
    [toterl > 50][toterl <= 300]{marker-width:6;}
    [toterl > 300][toterl <= 500]{marker-width:8;}
    [toterl > 500][toterl <= 800]{marker-width:10;marker-opacity:0.8;}
    [toterl > 800][toterl <= 1500]{marker-allow-overlap:true;marker-width:14;marker-opacity:0.8;}
    [toterl > 1500]{marker-allow-overlap:true;marker-width:22;marker-opacity:0.8;}
    }
  
  [zoom >= 9][zoom < 12]{
    marker-allow-overlap:false;
    [toterl = 0]{marker-width:1;}
    [toterl = 0][toterl <= 50]{marker-opacity:0;marker-line-opacity:0;}
    [toterl > 50][toterl <= 300]{marker-width:8;}
    [toterl > 300][toterl <= 500]{marker-width:10;}
    [toterl > 500][toterl <= 800]{marker-width:14;marker-opacity:0.8;}
    [toterl > 800][toterl <= 1500]{marker-allow-overlap:true;marker-width:18;marker-opacity:0.8;}
    [toterl > 1500]{marker-allow-overlap:true;marker-width:26;marker-opacity:0.8;}
    }
   [zoom = 12]{
    marker-allow-overlap:false;
    [toterl = 0]{marker-width:1;}
    [toterl = 0][toterl <= 50]{marker-width: 6;}
    [toterl > 50][toterl <= 300]{marker-width:10;}
    [toterl > 300][toterl <= 500]{marker-width:12;}
    [toterl > 500][toterl <= 800]{marker-width:16;marker-opacity:0.8;}
    [toterl > 800][toterl <= 1500]{marker-allow-overlap:true;marker-width:20;marker-opacity:0.8;}
    [toterl > 1500]{marker-allow-overlap:true;marker-width:28;marker-opacity:0.8;}
    }
  [zoom > 12]{
    marker-allow-overlap:false;
    [toterl = 0]{marker-width:1;}
    [toterl = 0][toterl <= 50]{marker-width:8;}
    [toterl > 50][toterl <= 300]{marker-width:10;}
    [toterl > 300][toterl <= 500]{marker-width:12;}
    [toterl > 500][toterl <= 800]{marker-width:16;marker-opacity:0.8;}
    [toterl > 800][toterl <= 1500]{marker-allow-overlap:true;marker-width:20;marker-opacity:0.8;}
    [toterl > 1500]{marker-allow-overlap:true;marker-width:30;marker-opacity:0.8;}
    }
}


