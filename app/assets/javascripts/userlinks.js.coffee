# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $('#userlink_url').change ->
       loadtitle()
       $("#userlink_name").focus()
       false
    
    $('#userlink_url').keypress (e) ->
       if e.which == 13
           loadtitle()
           $("#userlink_name").focus()
           
           false


    loadtitle = ->
       cur_url = $("#userlink_url").val()
       $("#userlink_url").val("http://" + cur_url) unless cur_url.lastIndexOf("http", 0) == 0

       $(".starthidden").show({duration:300})
       $.ajax({
           dataType: "json",
           url: 'http://title-fetch.robscanlon.com/?q=' + encodeURIComponent($("#userlink_url").val())
           success: (data) -> 
              $("#userlink_name").val(data.title)
       })
    true
       

