# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	$(document).on 'page:fetch', -> 
		$('body').not('#progress').addClass("blur")
		NProgress.start()
		

	$(document).on "page:change", ->
  	NProgress.done()

	$(document).on 'page:restore', ->
		NProgress.remove()

	NProgress.configure showSpinner: false

	$('.sidebar, body, footer, header').addClass("transition")

	$('.name').click ->
		$('.sidebar').css("right" : "0")
		$('.body-fade').fadeIn(300)
		$('footer').css("left" : "-245px")
		$('body').css("left" : "-245px")
		$('.logo').css("left" : "-245px")


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
		$('.sidebar').css("right" : "-245px")
		$('body').css("left" : "0")
		$('footer').css("left" : "0")
		$('.logo').css("left" : "0")
	
	$('.disabled').click -> return false

$(document).ready(ready)
$(document).on('page:load', ready)