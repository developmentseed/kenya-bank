// Requires jquery and [jquery.viewport](http://www.appelsiini.net/projects/viewport)
function isTouchDevice(e) {
	try {
    	document.createEvent('TouchEvent');
    	return true;
	} catch(error) {
    	return false;
	}
}

$(function() {
    if ($('#open-page').length > 0) {
        // Sticky navigation
        var navTop = $('.navigation')
                        .offset().top - parseFloat($('.navigation')
                            .css('marginTop')
                            .replace(/auto/, 0));
    
        $(window).scroll(function (e) {
            if (isTouchDevice()) {
                var topHeight = $(this).scrollTop();
                $('.navigation').css('top', topHeight);
            }
            if ($(window).width() > 920) {
                var y = $(this).scrollTop();
                if (y >= navTop) {
                    $('.navigation').addClass('fixed');
                } else {
                    $('.navigation').removeClass('fixed');
                }
            }
        });
    
        // Sticky dataset profile
        var mapTop = $('.open-drawer-content')
                        .offset().top -  parseFloat($('.open-drawer-content')
                            .css('marginTop')
                            .replace(/auto/, 0));
    
        $(window).scroll(function (e) {
            if (isTouchDevice()) {
                var topHeight = $(this).scrollTop();
                $('.open-drawer-content').css('top', topHeight);
            }
            if ($(window).width() > 920) {
                var y = $(this).scrollTop();
                if (y >= mapTop) {
                    $('.open-drawer-content').addClass('fixed');
                } else {
                    $('.open-drawer-content').removeClass('fixed');
                }
            }
        });
    
        // Show dataset profiles
        $('.collection').click(function (e) {
            var thisDataset = $(this).attr('id');
            var thisProfile = $(".open-drawer-content[data-profile='" + 
                                thisDataset + "']");
            
            // Clear all maps
            $('.largemap').html('');
            
            // Build new map
            var mapUrl = $('.largemap', thisProfile).attr('data-map');
            $('.largemap', thisProfile).html('<iframe src="' + mapUrl +
                '" frameborder="0" width="100%" height="100%"></iframe>');
                
            // Hide old drawers, show new
            $('.open-drawer-content').removeClass('active');
            thisProfile.addClass('active');
            
            // Set classes for the dataset
            $('.collection').removeClass('active');
            $(this).addClass('active');
        });
    
        // Highlight appropriate nav item
        $(window).scroll(function (e) {
            if($(this).scrollTop() != 0) {
                var inview = $('.content h2:in-viewport:first').attr('id') ||
                                $('.content h2:above-the-top:last').attr('id');
    
                var link = $('.navigation a[href="#' + inview + '"]');
                if (link.length && !link.is('.active')) {
                    $('.navigation a').removeClass('active');
                    link.addClass('active');
                }
            } else {
                $('.navigation a').removeClass('active');
                $('.navigation a:first').addClass('active');
            }
        });
        
        $('.api-button').click(function (e) {
	        e.preventDefault();
	        if ($(this).hasClass('active')) {
	            $(this).removeClass('active');
	            $('.api-modal').css('display', 'none');
	        } else {
	
	            $(this).addClass('active');
	            $('.api-modal').css('display', 'block');
	        }
	    });
	    
	    $('a.api-close').click(function(e){
	        e.preventDefault();
	        $('.api-modal').css('display', 'none');
	        $('.api-button').removeClass('active');
	    });
    } 
});