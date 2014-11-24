$.Carousel = function(el) {
	this.$el = $(el);
	this.$active = $(this.$el.find('.items img')[0]);
	this.$active.addClass('active');
	this.transitioining = false;
	$('.slide-left').on('click', this.slideLeft.bind(this));
	$('.slide-right').on('click', this.slideRight.bind(this));
};

$.Carousel.prototype.slideLeft = function() {
	this.slide(-1);
}

$.Carousel.prototype.slideRight = function() {
	this.slide(1);
}

$.Carousel.prototype.slide = function(dir) {
	if(this.transitioning)
		return;
	this.transitioning = true;
	if(~dir) {
		moveDir = 'right';
		oppDir = 'left';
	} else {
		moveDir = 'left';
		oppDir = 'right';
	}
	
	this.activeIndex += dir;
	var len = this.$el.find('.items img').length;
	if(this.activeIndex < 0)
		this.activeIndex = len - 1;
	else if(this.activeIndex >= len)
		this.activeIndex = 0;
	
	var $oldActive = this.$active;
	$oldActive.addClass(oppDir);
	this.$active = $(this.$el.find('.items img')[this.activeIndex]);
	this.$active.addClass(moveDir + ' active');
	
	setTimeout(function() {
		requestAnimationFrame(function() {
			this.$active.removeClass(moveDir);
		}.bind(this))
	}.bind(this), 0);
	
	this.$active.one('transitionend', function() {
		$oldActive.removeClass('active ' + oppDir);
		this.transitioning = false;
	}.bind(this));
}

$.fn.carousel = function() {
	return this.each(function() {
		new $.Carousel(this);
	});
};