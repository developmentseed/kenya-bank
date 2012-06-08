var MB = {};
MB.maps = {};

MB.api = function(l) {
  return 'http://api.tiles.mapbox.com/v3/worldbank-education.map-zlpoq0vs,' + l.id + '.jsonp';
};

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

    if (l.zoomrange) {
      MB.maps[el].setZoomRange(l.zoomrange[0], l.zoomrange[1]);
    } else {
      MB.maps[el].setZoomRange(t.minzoom, t.maxzoom);
    }

  MM.Hash(MB.maps[el]);
    
    if ($.inArray('attribuition', l.features) >= 0) wax.mm.attribution(MB.maps[el], t).appendTo(MB.maps[el].parent);
    if ($.inArray('zoompan', l.features) >= 0)   wax.mm.zoomer(MB.maps[el]).appendTo(MB.maps[el].parent);
    if ($.inArray('zoombox', l.features) >= 0)   wax.mm.zoombox(MB.maps[el]);
    if ($.inArray('bwdetect', l.features) >= 0)  wax.mm.bwdetect(MB.maps[el]);
    if ($.inArray('share', l.features) >= 0)     wax.mm.share(MB.maps[el], t).appendTo($('body')[0]);

    if ($.inArray('legend', l.features) >= 0) {
      MB.maps[el].legend = wax.mm.legend(MB.maps[el], t).appendTo(MB.maps[el].parent);
      $('.wax-legends').appendTo(MB.maps[el].parent);
    }

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
};

MB.refresh = function(m, l) {
  if (l.id) {
    wax.tilejson(MB.api(l), function(t) {
      var layer = l.layer || 0;
      try {
        MB.maps[m].setLayerAt(layer, new wax.mm.connector(t));
      } catch (e) {
        MB.maps[m].insertLayerAt(layer, new wax.mm.connector(t));
      }
      if (MB.maps[m].interaction) MB.maps[m].interaction.tilejson(t);
      if (MB.maps[m].legend) MB.maps[m].legend.content(t);
    });
  }
  if (l.center) {
    var lat = l.center.lat || MB.maps[m].getCenter().lat,
        lon = l.center.lon || MB.maps[m].getCenter().lon,
        zoom = l.center.zoom || MB.maps[m].getZoom();

    if (l.center.ease > 0) {
      MB.maps[m].easey = easey().map(MB.maps[m])
      .to(MB.maps[m].locationCoordinate({ lat: lat, lon: lon })
      .zoomTo(zoom)).run(l.center.ease);
    } else {
      MB.maps[m].setCenterZoom({ lat: lat, lon: lon }, zoom);
    }
  }
};


$(function() {

  // Primary Navigation
  $('#nav').find('a').click(function(e) { 
	if ($(this).attr('data-story') != 'open') {
    if (!$(this).parent().hasClass('active')) {
      var name = $(this).attr('data-story');
      var story = $('.' + name);
      $('#nav li, .story').removeClass('active');
      $(this).parent().addClass('active');
      $(this).addClass('active');
      story.addClass('active');
      story.find('li a').first().trigger('click');
      
      window.location.hash = $(this).attr('hash');
    } 
	}
  });
  
  if (location.hash === '#performance') {
        $('a#performance').trigger('click');
    }
    if (location.hash === '#investment') {
        $('a#investment').trigger('click');
    }

  

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

  // Sub Navigation per story.
  $('a.section-name').click(function(e) {
    e.preventDefault();
    var el = $(this);
    if (!$(this).hasClass('active')) {
      $('.subnav li:not(.subnav li li)').removeClass('active');
      $(this).parent().addClass('active');
      buildRequest(el);
    }
  });

  // Primary/Secondary Toggle
  $('a.toggle').click(function (e) {
    e.preventDefault();
    var el = $(this);
    if (!$(this).hasClass('active')) {
      $('a.toggle').removeClass('active');
      $(this).addClass('active');
      buildRequest(el);
    }
  });  

  // About
  $('a.methods-link').click(function(e){
      e.preventDefault();
      $('.methods-modal').css('display', 'block');
  });

  $('a.methods-close').click(function(e){
      e.preventDefault();
      $('.methods-modal').css('display', 'none');
  });

  // links in the story text to trigger the nav
  $('a.narrative').click(function(e) {
    e.preventDefault();
    var story = $(this).attr('data-which-narrative');
    $('[data-narrative="' + story + '"]').trigger('click');
    $('[data-narrative="' + 'datas"]').trigger('click');
  });
});
