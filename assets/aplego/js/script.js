function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for(var i = 0; i <ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}
var height_topnav = 50;
var height_footer = 36;

var auto_height = false;
function set_auto_height() {
	if (auto_height) {
		var height_window = window.innerHeight;
		document.getElementsByClassName('auto-height')[0].style.minHeight = (height_window - height_topnav - height_footer)+"px";
	}
}
document.onreadystatechange = function(e) {
	if (document.readyState === 'interactive') {
		$sidenav = getCookie('sidenav');
		if ($sidenav == 'nonactive') {
			var element = document.getElementsByTagName("body")[0];
			element.classList.remove("active-sidenav");
		}
		set_auto_height();
	}
};
$(document).on("click","body [data-toggle=collapse]",function() {
	if ($('body').hasClass('active-sidenav')) {
		$('body').removeClass('active-sidenav');
		document.cookie="sidenav=nonactive";
	}else{
		$('body').addClass('active-sidenav');
		document.cookie="sidenav=active";
	}
});
$(window).resize(function(){
	set_auto_height();
});

$(function() {
	// datatables
	try {
		$('.datatables').DataTable();
		$('.datatables-noorder-first-last').DataTable({
			columnDefs: [
			{ orderable: false, targets: [-1, 0] }
			],
		});
		$('.datatables-noorder-last').DataTable({
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
			height: 140,
			menubar:false,
			toolbar1: 'undo redo | styleselect | bullist numlist | outdent indent | table',
			toolbar2: 'link unlink | filemanager image | forecolor backcolor | code',
		}, 
		full: {
			height: 340,
			toolbar1: 'undo redo | styleselect | bold underline italic | bullist numlist | outdent indent | table | link unlink | filemanager image | forecolor backcolor | code',
			image_advtab: true,
		}
	};
	var base_url = $('base').attr('href');
	var tinymce_css = [base_url + "assets/aplego/css/bootstrap.min.css"];
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
			media_main: base_url + 'aplego/media?mini_load=tinymce',
			plugins: [
				"autolink link image imagetools lists advlist charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
				"table contextmenu directionality emoticons paste textcolor code filemanager"
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

$(document).on('change', '[show-value]', function() {
	var el = $(this);
	$(el.attr('show-value')).children('.form-group').addClass('hide');
	$(el.attr('show-value')).children('[type=' + el.val() + ']').removeClass('hide');
});

$(document).on('change', '[show-type]', function() {
	var el = $(this);
	$(el.attr('show-type')).addClass('hide');
	$(el.attr('show-type') + '[value-type=' + el.val() + ']').removeClass('hide');
});

$(document).on('click', '[alfa-add]', function(event) {
	var el = $(this);
	var master = $(el.attr('alfa-master'));

	var string_item = master.html();
	var no = parseInt(el.attr('no_index'));
	var new_string_item = string_item.split('no_index').join(no);
	el.attr('no_index', (no + 1));

	$(new_string_item).appendTo(el.attr('alfa-add'));
	load_mini_tinymce(el.attr('alfa-add'));
	return false;
});

$(document).on('click', '[alfa-remove]', function(event) {
	var el = $(this);
	el.parents(el.attr('alfa-remove')).remove();

	return false;
});

$(document).on('change', '[show-change-number]', function(event) {
	var el = $(this);
	var target = $(el.attr('show-change-number'));
	target.removeClass('hide');
});


$(document).on('change', '[change-hide]', function(event) {
	var el = $(this);
	var target = $(el.attr('change-hide'));
	target.addClass('hide');
});

