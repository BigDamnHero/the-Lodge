// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Lodge = {
    
    initDefaultText: function()
    {
        $(".default_text").each( function(index, el)
        {
            $(el).focus(function()
            {
                if($(this).val() == $(this).get(0).title)
                {
                    $(this).removeClass("default_text_active");
                    $(this).val("");
                }
            });
            
            $(el).blur(function()
            {
                if($(this).val() == "" || $(this).val() == $(this).get(0).title)
                {
                    $(el).val($(el).attr("title"));
                    $(el).addClass("default_text_active");
                }
            });
        });
        
        $(".default_text").blur();
    }
    
}

$(document).ready(function() {
    Lodge.initDefaultText();
});
