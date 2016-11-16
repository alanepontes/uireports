// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-fileupload
//= require fancybox
//= require jquery.raty
//= require turbolinks
//= require bootstrap-switch
//= require_tree .

$(document).on('page:change', function() { 
	$(".tip").tooltip(); 
	$(".switch").bootstrapSwitch();
	$(".fancybox").fancybox({
        transitionIn: 'elastic',
        transitionOut: 'elastic',
        overlayColor: '#000',
        overlayOpacity: 0.8,
        speedIn: 300,
        speedOut: 300,
        cyclic: true    ,
        titlePosition: 'outside',
        title: $(this).attr('rel'),
        nextEffect  : 'none',
        prevEffect  : 'none'
    });
});