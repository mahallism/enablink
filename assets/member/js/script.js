var height_topnav = 50;
var height_footer = 36 + 1;
function set_auto_height() {
	var height_window = window.innerHeight;
	document.getElementsByClassName('auto-height')[0].style.minHeight = (height_window - height_topnav - height_footer)+"px";
}
document.onreadystatechange = function(e) {
	if (document.readyState === 'interactive') {
		set_auto_height();
	}
};

$(document).on('click', function(e) {
	var el = $('[data-toggle=collapse]');
	var target = $(el.attr('data-target'));
	if (!$(e.target).closest(el.attr('sidenav-target')).length) {
		if (target.hasClass('show')) {
			target.removeClass('show');
		}
	}
});

$(window).resize(function(){
	set_auto_height();
});

$(function() {
	// datatables
	try {
		$('.datatables').DataTable({
			responsive: true,
		});
		$('.datatables-noorder-first-last').DataTable({
			responsive: true,
			columnDefs: [
			{ orderable: false, targets: [-1, 0] }
			],
		});
		$('.datatables-noorder-last').DataTable({
			responsive: true,
			columnDefs: [
			{ orderable: false, targets: -1 }
			]
		});
	}catch(err) {
		console.log(err.message);
	}
	// bs-custom-file-input
	try {
		bsCustomFileInput.init();
	}catch(err) {
		console.log(err.message);
	}

	// bootstrap-select
	// $('.selectpicker').selectpicker();
	
	// tinymce
	var tinymce_option = {
		mini: {
			height: 100,
			menubar:false,
			toolbar1: 'undo redo | styleselect | bold underline italic | bullist numlist | outdent indent | table | link unlink | filemanager image | forecolor backcolor | code',
		}, 
		full: {
			height: 200,
			toolbar1: 'undo redo | styleselect | bold underline italic | bullist numlist | outdent indent | table | link unlink | filemanager image | forecolor backcolor | code',
			image_advtab: true,
		}
	};
	var base_url = $('base').attr('href');
	var tinymce_css = [base_url + "css/bootstrap.min.css"];
	// var tinymce_css = [base_url + "http://project/template/dashmaster/css/bootstrap.min.css"];
	$('[tinymce]').each(function() {
		var el = $(this);
		var options = {
			selector: '#' + el.attr('id'),
			convert_urls: false,
			elementpath: true,
			relative_urls: true,
			document_base_url : base_url,
			theme: 'modern',
			skin : 'kopiskin',
			plugins: [
				"autolink link image imagetools lists advlist charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
				"table contextmenu directionality emoticons paste textcolor code"
			],
			content_style: "@import '" + tinymce_css.join("'; @import '") + "';  body{ margin: .5rem 1rem; }",
		};
		jQuery.extend(options, tinymce_option[el.attr('tinymce')]);
		if (el.attr('tinymce-height') != undefined) {
			options.height = el.attr('tinymce-height');
			console.log(el.attr('tinymce-height'));
		}
		tinymce.init(options);
	});
});

$(document).on('click', '[hide]', function(event) {
	var el = $(this);
	var target = $(el.attr('hide'));
	target.addClass('hide');
	return false;
});

$(document).on('click', '[show]', function(event) {
	var el = $(this);
	var target = $(el.attr('show'));
	target.removeClass('hide');
	return false;
});

$(document).on('change', '[show-change]', function(event) {
	var el = $(this);
	var target = $(el.attr('show-change'));

	if (target.hasClass('hide')) {
		target.removeClass('hide');
	}else{
		target.addClass('hide');
	}
});

$(document).on('change', '[show-on]', function(event) {
	var el = $(this);
	var target = $(el.attr('show-on'));

	if (el.val() === el.attr('show-on-value') && target.hasClass('hide')) {
		target.removeClass('hide');
	}else{
		target.addClass('hide');
	}
});

$(document).on('change', '[duplicate-value-to]', function(event) {
	var el = $(this);
	var target = $(el.attr('duplicate-value-to'));
	var value = el.val();
	target.val(value);
});

$(document).on('change', '[show-parent-on]', function(event) {
	var el = $(this);
	var target = $(el.attr('show-parent-on')).parent();

	if (el.val() === el.attr('show-on-value') && target.hasClass('hide')) {
		target.removeClass('hide');
	}else{
		target.addClass('hide');
	}
});

// var timepicker = new TimePicker('start_at', {
//   lang: 'en',
//   theme: 'dark'
// });
// timepicker.on('change', function(evt) {
  
//   var value = (evt.hour || '00') + ':' + (evt.minute || '00');
//   evt.element.value = value;

// });
