# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	$('textarea').autoGrow()

	$('.alert').delay(2000).fadeOut(500)

	$('.tooltip').tooltipster({ 
		 animation: 'fade'
		 maxWidth: 150
	})

	$('.shortcuts').click ->
		$('.body-fade').fadeIn(300)
		$('.shortcuts-box').fadeIn(500)

	$('.body-fade, .close').click ->
		$('.body-fade').fadeOut(500)
		$('.shortcuts-box').fadeOut(300)
	
	$('.disabled').click -> return false

$(document).ready(ready)
$(document).on('page:load', ready)