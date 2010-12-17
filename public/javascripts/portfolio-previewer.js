/**
 * Portfolio previewer- parses the portfolio data from a XML file, displays previews of the
 * items separated by pages and adds a functionality for displaying a post after
 * clicking on the smaller preview
 * 
 * @author Pexeto http://pexeto.com
 */

(function($){
	$.fn.portfolioPreviewer=function(options){
	// main default settings
		var defaults={
			xmlSourceFile : 'portfolio-preview.xml',
			itemnum : 6,
			pageWidth : 270,
			easing : '', // will be overwritten by the XML data
			speed : 500 // will be overwritten by the XML data
		};

		var options=$.extend(defaults, options);
		
	// data containers
	var items = [], divContainer, firstColumn, wrapper, pageWrappers = [], currentShown = 0, ie=$.browser.msie;
	var root=$(this);


	/**
	 * Parses the data from the XML file, creates objects from the data and
	 * saves the objects into arrays.
	 */
	var parseData = function() {
		$.ajax( {
			type : 'GET',
			url : options.xmlSourceFile,
			dataType : 'xml',
			success : function(xml) {

				$(xml).find('settings').children().each(function(){
					var tagname=this.tagName;
					options[tagname]=$(this).text();
				});
				
				
				$(xml).find('item').each(
						function(i) {
							var current = $(this);
							var post = {
								title : current.find('ptitle:first').text(),
								thumbnail : current.find('thumbnail:first')
										.text(),
								small_thumbnail : current.find(
										'small_thumbnail:first').text(),
								content : $('content:first', current).text()
							};

							// create the object for the post
							var html=createPostHtml(post);
							post.obj = $(html);
							post.html = html;
							post.smallObj = $(createSmallPostHtml(post));

							items.push(post);
						});
				
				
				if (items.length > 0) {
					displayContent();
				}
			}
		});
	};

	/**
	 * Creates the HTML for the big preview post from the left.
	 */
	var createPostHtml = function(post) {
		var html = '<div><h1>' + post.title + '</h1><hr /><hr />';
		if (post.thumbnail) {
			html += '<img src="' + post.thumbnail + '" alt="" class="alignleft shadow-frame portfolio-big-img" />';
		}
		html += '<p>' + post.content + '</p></div></div>';
		post.obj = $(html);

		return html;
	};

	/**
	 * Creates the HTML for the smaller preview post from to the right.
	 */
	var createSmallPostHtml = function(post) {
		html = '<img src="' + post.small_thumbnail + '" alt="" class="alignleft shadow-frame" />';
		return html;
	};

	/**
	 * Displays the main content of the items container.
	 */
	var displayContent = function() {
		firstColumn = $('<div id="portfolio-preview"><div class="loading"></div></div>');
		var secondColumn = $('<div class="portfolio-sidebar"><h4>'+options.more+'</h4><hr /><hr /><div id="portfolio-wrapper"></div></div>');
		root.html('').append(firstColumn).append(secondColumn);
		wrapper = secondColumn.find('#portfolio-wrapper');

		// show the first post
		showFirstPost();

		// show the other posts from the right
		displayPostList();
	};

	var showFirstPost = function(post) {
		firstColumn.html(items[0].html);
	};

	/**
	 * Displays all the smaller post previews to the right, separated by pages.
	 */
	var displayPostList = function() {

		for ( var i = 0; i < items.length; i++) {
			if (i % options.itemnum === 0) {
				var pageWrapper = $('<div class="portfolio-items"></div>');
				pageWrappers.push(pageWrapper);
				wrapper.width(wrapper.width() + 500);
				wrapper.append(pageWrapper);
			}
			var post = items[i].smallObj;

			pageWrappers[pageWrappers.length - 1]
					.append(post);
					
					
		}

		if (items.length > options.itemnum) {
			showNavigation();
		}

		setPostClickHandlers();
	};

	/**
	 * Shows the pagination below the smaller post previews.
	 */
	var showNavigation = function() {
		wrapper
				.parent()
				.append(
						'<div id="portfolio-big-pagination"><a class="alignleft" id="prev-item"> <span class="portfolio-big-arrows">&laquo; </span>'+options.prev+'</a> <a class="alignright" id="next-item"> '+options.next+' <span class="portfolio-big-arrows"> &raquo;</span></a></div>');
		var prevButton = wrapper.parent().find('a#prev-item');
		var nextButton = wrapper.parent().find('a#next-item');

		// set the next button click handler
		nextButton.click(function(event) {

			event.preventDefault();
			if (currentShown < pageWrappers.length - 1) {
				var margin = -(currentShown + 1)
						* (options.pageWidth + 31);
				wrapper.animate( {
					marginLeft : [ margin, options.easing ]
				}, options.speed);
				currentShown++;
			}
		});

		// set the previous button click handler
		prevButton.click(function(event) {
			event.preventDefault();
			if (currentShown !== 0) {
				var margin = -(currentShown - 1)
						* (options.pageWidth + 31);
				wrapper.animate( {
					marginLeft : [ margin, options.easing ]
				}, options.speed);
				currentShown--;
			}
		});
		
		$('#portfolio-big-pagination a').hover(function(){
			$(this).css({cursor:'pointer'});
		});
	};

	/**
	 * Sets post click handlers to the smaller previews. When a small preview post is clicked
	 * the whole content of the post is shown to the left.
	 */
	var setPostClickHandlers = function() {
		var itemsNumber = items.length;
		for ( var i = 0; i < itemsNumber; i++)
			(function(i) {
				items[i].smallObj.each(function(j) {
					$(this).bind(
							{
								'click' : function() {
									var current = items[i];

									firstColumn.html(current.html);

								},
								'mouseover' : function() {
									$(this).stop().animate({opacity:0.8}, 400);
									$(this).css( {
										cursor : 'pointer'
									});
								},
								'mouseout' : function() {
									$(this).stop().animate({opacity:1}, 400);
								}
							});
				});
			})(i);

	};
	
	if(root.length){
		parseData();
	}

	};
}(jQuery));