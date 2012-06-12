var MB = {};
MB.maps = {};   
var	apiUrl;
var embedUrl;

// Returns a map layer (defined by `l.id`) along with the kenya base layer
MB.api = function(l) {
  return 'http://api.tiles.mapbox.com/v3/worldbank-education.map-zlpoq0vs,' + l.id + '.jsonp';
};

// Initializes the settings for the map when called
MB.map = function(el, l) {
  wax.tilejson(MB.api(l), function(t) {
    var h = [
      new MM.DragHandler(),
      new MM.DoubleClickHandler(),
      new MM.TouchHandler()
    ];
    if ($.inArray('zoomwheel', l.features) >= 0) h.push(new MM.MouseWheelHandler());

    MB.maps[el] = new MM.Map(el, new wax.mm.connector(t), null, h);
    MB.maps[el].setCenterZoom({
      lat: (l.center) ? l.center.lat : t.center[1],
      lon: (l.center) ? l.center.lon : t.center[0]
    }, (l.center) ? l.center.zoom : t.center[2]);
    
    // Sets a zoom range for the map if given, otherwise defaults to the maximum and minimum options
    if (l.zoomrange) {
      MB.maps[el].setZoomRange(l.zoomrange[0], l.zoomrange[1]);
    } else {
      MB.maps[el].setZoomRange(t.minzoom, t.maxzoom);
    }

    // If these features exist in the array (as defined where the function is called) then they are added to the map.
    if ($.inArray('attribuition', l.features) >= 0) wax.mm.attribution(MB.maps[el], t).appendTo(MB.maps[el].parent);
    if ($.inArray('zoompan', l.features) >= 0)   wax.mm.zoomer(MB.maps[el]).appendTo(MB.maps[el].parent);
    if ($.inArray('zoombox', l.features) >= 0)   wax.mm.zoombox(MB.maps[el]);
    if ($.inArray('bwdetect', l.features) >= 0)  wax.mm.bwdetect(MB.maps[el]);
    if ($.inArray('share', l.features) >= 0)     wax.mm.share(MB.maps[el], t).appendTo($('body')[0]);
    
    // Appends multiple legends if present
    if ($.inArray('legend', l.features) >= 0) {
      MB.maps[el].legend = wax.mm.legend(MB.maps[el], t).appendTo(MB.maps[el].parent);
      $('.wax-legends').appendTo(MB.maps[el].parent);
    }
    // Adds `tooltips` or `movetips` to the map if given in the features array
    if ($.inArray('tooltips',l.features) >= 0) {
      MB.maps[el].interaction = wax.mm.interaction()
      .map(MB.maps[el])
      .tilejson(t)
      .on(wax.tooltip()
      .parent(MB.maps[el].parent)
      .events()
      );
    } else if ($.inArray('movetips',l.features) >= 0) {
      MB.maps[el].interaction = wax.mm.interaction()
      .map(MB.maps[el])
      .tilejson(t)
      .on(wax.movetip()
        .parent(MB.maps[el].parent)
        .events()
      );
    }
  });

	apiUrl = MB.api(l);
		
};

// Refresh map with new layer. re-instantiates the legend and tooltip if exist
MB.refresh = function(m, l) {
  if (l.id) {
    wax.tilejson(MB.api(l), function(t) {
      var layer = l.layer || 0;
      try {
        MB.maps[m].setLayerAt(layer, new wax.mm.connector(t));
      } catch (e) {
        MB.maps[m].insertLayerAt(layer, new wax.mm.connector(t));
      }
      //adds interaction for new layer and legend
      if (MB.maps[m].interaction) MB.maps[m].interaction.tilejson(t);
      if (MB.maps[m].legend) MB.maps[m].legend.content(t);
    });
  }
  // Set a center latitude and longitude and zoom level
  if (l.center) {
    var lat = l.center.lat || MB.maps[m].getCenter().lat,
        lon = l.center.lon || MB.maps[m].getCenter().lon,
        zoom = l.center.zoom || MB.maps[m].getZoom();
    // If ease time is given in center, this moves the map at the speed given to the lat/long above, 
    // otherwise sets the maps new center with zoom level
    if (l.center.ease > 0) {
      MB.maps[m].easey = easey().map(MB.maps[m])
      .to(MB.maps[m].locationCoordinate({ lat: lat, lon: lon })
      .zoomTo(zoom)).run(l.center.ease);
    } else {
      MB.maps[m].setCenterZoom({ lat: lat, lon: lon }, zoom);
    }
  }
	
	apiUrl = MB.api(l);

};

// jQuery's on document load function.
$(function() {

  // Primary Navigation layers i.e. Context, Performance, Investment
  $('#nav').find('a').click(function(e) { 
  	// Adds story content 
	if ($(this).attr('data-story') != 'open') {
	  // Triggers a new story with click 
    if (!$(this).parent().hasClass('active')) {
      var name = $(this).attr('data-story');
      var story = $('.' + name);
      $('#nav li, .story').removeClass('active');
      $(this).parent().addClass('active');
      $(this).addClass('active');
      story.addClass('active');
      story.find('li a').first().trigger('click');
      //add hash attribute to page
      window.location.hash = $(this).attr('hash');
    }
	}
  });
  // If hash is #performance, move to performance page
  if (location.hash === '#performance') {
    $('a#performance').trigger('click');
  }
  // If hash is #investment, move to investment page
  if (location.hash === '#investment') {
    $('a#investment').trigger('click');
  }

 //initialize map settings with active layer, given latitutde and longitude, zoom level, tooltip etc. 
 //which is sent to the MB.map function to build inital map 
  new MB.map('map', {
    id: $('.story.active .subnav .active a').attr('data-layer'),
    center: {
      lat: 0,
      lon: 35.318,
      zoom: 7
    },
    zoomrange: [6, 15],
    features: [
      'zoomwheel',
      'zoombox',
      'zoompan',
      'legend',
      'attribuition',
      'tooltips',
      'share'
    ]
  });
 // Builds a map request by pulling from anchor tags in sub-navigation to collect
 // new layer, lat, long, zoom, and ease to refresh map with chosen content 
  var buildRequest = function(el) {
    var options = {}
    options.id = el.attr('data-layer');
    options.center = {};
    options.center.lon = el.attr('data-lon') || undefined;
    options.center.lat = el.attr('data-lat') || undefined;
    options.center.zoom = el.attr('data-zoom') || undefined;
    options.center.ease = el.attr('data-ease') || 0;
    MB.refresh('map', options);
  }

  // Sub Navigation per story i.e. School Locations, Poverty, Literacy
  $('a.section-name').click(function(e) {
    e.preventDefault();
    var el = $(this);
     console.log(el.parent());
    //removes activity from sub navigation but leaves toggle buttons highlighted
    if (!$(this).hasClass('active')) {
      console.log(el.attr('class'));
      if(el.attr('class') == 'no-link section-name'){
        $('.subnav li').removeClass('active');
        $('.subnav li').find('a').removeClass('active');
        $(this).parent().addClass('active'); 
        buildRequest(el);
      }
      else{
        $('.subnav li').not(document.getElementById('primary toggle')).removeClass('active');
        $(this).parent().addClass('active'); 
        buildRequest(el);
      }
      //builds new map request

    }
  });

  // Primary/Secondary Toggle
  $('a.toggle').click(function (e) {
    e.preventDefault();
    var el = $(this);
    //switch between primary and secondary toggle and build map request with new layer
    if (!el.hasClass('active')) {
      $('a.toggle', el.parent().parent())
        .removeClass('active');
      el.addClass('active');
      buildRequest(el);
    }
  });

  // About modal 
  $('a.methods-link').click(function(e){
      e.preventDefault();
      $('.methods-modal').css('display', 'block');
  });
 // Closes About modal
  $('a.methods-close').click(function(e){
      e.preventDefault();
      $('.methods-modal').css('display', 'none');
  });

  // Links in the story text to trigger the nav
  $('a.narrative').click(function(e) {
    e.preventDefault();
    var story = $(this).attr('data-which-narrative');
    $('[data-narrative="' + story + '"]').trigger('click');
    $('[data-narrative="' + 'datas"]').trigger('click');
  });

});   

function updateEmbedApi() {
    center = MB.maps['map'].pointLocation(new MM.Point(MB.maps['map'].dimensions.x/2,MB.maps['map'].dimensions.y/2));
    embedUrl = '<iframe src="'
                    + apiUrl.replace(".jsonp","")
                    + '/mm/zoompan,tooltips,legend,bwdetect.html#'
                    + MB.maps['map'].coordinate.zoom + '/'
                    + center.lat + '/'
                    + center.lon + '"'
                    + ' frameborder="0" width="500" height="400"></iframe>';
}
