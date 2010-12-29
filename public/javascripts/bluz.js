$(document).ready(function() {
	bluz_engage();
	bluz_minor();
	bluz_social_footer();
	bluz_switch_view();
	bluz_complete();
});

function bluz_switch_view(){
	$("a.switch_thumb").toggle(function(){
        $(this).addClass("swap");
        $("ul.grid").fadeOut("fast", function() {
			$(this).removeClass("grid");
            $(this).fadeIn("fast").addClass("list");
        });
    }, function () {
        $(this).removeClass("swap");
        $("ul.list").fadeOut("fast", function() {
			$(this).removeClass("list");
            $(this).fadeIn("fast").addClass("grid");
        });
    });
}

function bluz_engage(){
	Cufon.replace('h1, h2, h3, h4, h5, h6, p.tagline'); // enabling cufon
	$('#tabs').tabs({ fx: { opacity: 'toggle', height: 'toggle' } }); // make the tabs work
	$('ul.sf-menu').superfish({ 
        delay:       250                          // one second delay on mouseout 
	});
	$("a[rel^='prettyPhoto']").prettyPhoto(); // makes lightbox work
}

function bluz_social_footer(){
	$('.footer-widget .social-links a:has(img)').fadeTo("fast","0.7");
	$('.footer-widget .social-links a:has(img)').hover(function() {
		$(this).stop().fadeTo("fast","1");
		}, function() {
		$(this).stop().fadeTo("fast","0.7");
	});
}

function bluz_minor(){
	$('span.close').click(function() {
		$(this).parent().fadeOut(400);					   
	});
	$('#content img').hide();//hide all the images on the page
}

function bluz_complete(){
	$('ul.sf-menu').before('<div id="nav-finish"></div>');
	$('#pagename h2 span').after('<img src="../images/pagename-right.png" alt="" id="pagename-finish" />');
}


var i = 0;//initialize
var int=0;//Internet Explorer Fix
$(window).bind("load", function() {//The load event will only fire if the entire page or document is fully loaded
	var int = setInterval("preload(i)",300);//500 is the fade in speed in milliseconds
});	

function preload() {
	var images = $('#content img').length;//count the number of images on the page
	if (i >= images) {// Loop the images
		clearInterval(int);//When it reaches the last image the loop ends
	}
	$('#content img:hidden').eq(0).fadeIn(500);//fades in the hidden images one by one
	
	i++;//add 1 to the count
}
