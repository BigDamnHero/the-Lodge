// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Lodge = Lodge || {};
Lodge.Util = {};
Lodge.fadeDuration = 500;

Lodge.initDefaultText = function()
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

Lodge.initPreviewImages = function()
{
  $(".image_field").each(function(index, el)
  {
    var previewId = $(this).attr("data-preview");
    if(previewId)
    {
      $(this).change(function()
      {
        if($(this).val())
        {
          $("#" + previewId).attr("src", $(this).val());
          if(!$("#" + previewId).is(":visible"))
          {
            $("#" + previewId).fadeIn(Lodge.fadeDuration);
          }
        }
        else
        {
          $("#" + previewId).fadeOut(Lodge.fadeDuration, function()
          {
            $("#" + previewId).attr("src", "");
          });
        }
      });
      if($(this).val()) { $(this).change(); }
    }
  });
}

Lodge.initAttrInputs = function(inputMap)
{
  for(var inputEl in inputMap)
  {
    var bonusId = "#" + inputMap[inputEl];
    var inputId = "#" + inputEl;
    $(inputId).data("bonusId", bonusId);
    $("#" + inputEl).change(function(){
      var value = this.valueAsNumber;
      var bonus = Math.floor((value - 10) / 2);
      var sign = bonus >= 0 ? "+" : "";
      var bonusId = $(this).data("bonusId");
      $(bonusId).text(sign + bonus);
    });
    $("#" + inputEl).keyup(function(){ $(this).change(); });
    $("#" + inputEl).mouseup(function(){ $(this).change(); });
  }
}

Lodge.Util.wrap = function(x, min, max)
{
  var n = x || 0;
  var length = max - min;
  while(n < min) { n += length; }
  if(n >= max) { n = n % length + min; }
  return n;
}

$(document).ready(function() {
    Lodge.initDefaultText();
    Lodge.initPreviewImages();
});
