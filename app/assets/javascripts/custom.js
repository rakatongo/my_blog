$(document).ready(function() {	

	$('#comment_content').focus(function() {
		if($(this).width() <= 300){
			$(this).animate({ width: '+=50'})			
		}
	})	
	$('#contact_link').click(function(e) {			
		$('.contact_form').fadeIn('fast')		
		$('html, body').animate({scrollTop: $(".contact_form").offset().top}, 1500)
		$('#hide_contact').fadeIn().effect("pulsate", { times:2 }, 2000);
		e.preventDefault()		
	})
	$('#contact_msg').focus(function() {
		if($(this).width() <= 211){
			$(this).animate({
				width: '+=100',
				height: '+=150'		
			})
			$('html, body').animate({scrollTop: '+=20'}, 800)
		}
	})
    $('.form_centrado textarea').htmlarea()
    $('#hide_contact').click(function(e) {
    	$(this).fadeOut()
    	$('.contact_form').slideUp('slow')
    	return false    	
    	e.preventDefault
    })
})