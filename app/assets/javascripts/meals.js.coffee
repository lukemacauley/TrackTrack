# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	$(document).on 'page:fetch', -> 
		$('#container').not(".bar").addClass("blur")
		$('#nprogress').removeClass("blur")
		NProgress.start()
		
	$(document).on "page:change", ->
  	NProgress.done()

	$(document).on 'page:restore', ->
		NProgress.remove()

	NProgress.configure showSpinner: false

	$('.sidebar, body, footer, header, .logo').addClass("transition")

	$('.name').click ->
		$('.sidebar').css("right" : "0")
		$('.body-fade').fadeIn(300)
		$('footer').css("left" : "-245px")
		$('body').css("left" : "-245px")
		$('.logo').css("left" : "-245px")

	$('.shortcuts').click ->
		$('.shortcuts-box').fadeIn(300)

	$('.body-fade, .close').click ->
		$('.body-fade').fadeOut(300)
		$('.shortcuts-box').fadeOut(300)
		$('.sidebar').css("right" : "-245px")
		$('body').css("left" : "0")
		$('footer').css("left" : "0")
		$('.logo').css("left" : "0")

	$('textarea').autoGrow()

	$('.alert').delay(3000).fadeOut(300)

	$('.tooltip').tooltipster({ 
		 animation: 'fade'
		 maxWidth: 150
	})
	
	$('.disabled').click -> return false

$(document).ready(ready)
$(document).on('page:load', ready)