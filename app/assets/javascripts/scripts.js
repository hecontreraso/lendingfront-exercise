jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("http://i.imgur.com/MolNwGH.jpg");
    
    $('#top-navbar-1').on('shown.bs.collapse', function(){
    	$.backstretch("resize");
    });
    $('#top-navbar-1').on('hidden.bs.collapse', function(){
    	$.backstretch("resize");
    });
    
    /*
        Form
    */
    $('.registration-form fieldset:first-child').fadeIn('slow');
    
    $('.registration-form input[type="text"], input[type="number"], input[type="email"]').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    // next step
    $('.registration-form .btn-next').on('click', function() {
    	var parent_fieldset = $(this).parents('fieldset');
    	var next_step = true;

      if ($('#form-requested-amount')[0].checkValidity() == false){
        $('.error-message').css('display', 'block');
        $('.error-message strong').text('Please check the requested amount. It can\'t be greater than $1\'000.000');
        next_step = false;
      }
    	
    	parent_fieldset.find('input[type="text"], input[type="number"], input[type="email"]').each(function() {
		    if( $(this).val() == "" ) {
          $(this).addClass('input-error');
          $('.error-message').css('display', 'block');
          $('.error-message strong').text('There\'s an error in the form. Please check the fields marked in red');
          next_step = false;
        }
        else {
          $(this).removeClass('input-error');
    		}
    	});
    	
    	if( next_step ) {
        $('.error-message').css('display', 'none');
    		parent_fieldset.fadeOut(400, function() {
	    		$(this).next().fadeIn();
	    	});
    	}
    	
    });
    
    // previous step
    $('.registration-form .btn-previous').on('click', function() {
    	$(this).parents('fieldset').fadeOut(400, function() {
    		$(this).prev().fadeIn();
        $('.error-message').css('display', 'none');
    	});
    });
    
    // submit
    $('.registration-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="number"], input[type="email"]').each(function() {
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
