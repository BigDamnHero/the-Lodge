var Lodge = Lodge || {};

Lodge.initAutoCompletes = function() {
  $(".autocomplete").each(function() {
    var el = $(this);
    el.keyup(function() {
      Lodge.loadAutoCompletes(el);
    });
    el.blur(function() {
      var id = el.data("options_div");
      var options = $("#" + id);
      options.slideUp(200);
      var val = el.val().toLowerCase();
      options.children().each(function() {
        if($(this).text().toLowerCase() === val) {
          $("#" + el.attr("data-id-field")).val($(this).data("object_id"));
          el.val($(this).text());
        }
      })
    });
    el.focus(function() {
      el.keyup();
    });
  });
}

Lodge.displayAutoCompletes = function(el, items) {
  el = $(el);
  $("#" + el.attr("data-id-field")).val("");
  var id = el.data("options_div");
  var div = $("#" + id);
  if(div.length < 1) {
    id = el.attr("id") + "_options";
    el.data("options_div", id);
    div = $("<div></div>");
    div.attr("id", id);
    $("body").append(div);
    div.css("position", "absolute");
    div.css("top", el.offset().top + el.height() + 9 + "px");
    div.css("left", el.offset().left + "px");
    div.width(el.width() + 6);
    div.addClass("autocomplete_options");
  }
  if(items && items.length > 0) { div.empty(); div.show(); }
  else { div.slideUp(200); }
  $(items).each(function() {
    var child = $("<div></div>");
    child.addClass("autocomplete_option");
    child.data("object_id", this.id);
    child.text(this.name);
    child.hide();
    div.append(child);
    child.slideDown(200);
    child.click(function() {
      el.val(child.text());
      $("#" + el.attr("data-id-field")).val(child.data("object_id"));
      div.empty();
    });
  });
  
}

Lodge.loadAutoCompletes = function(el) {
  var text = $(el).val();
  var url = $(el).attr("data-url") + text;
  if(text.length > 0) {
    $.ajax({
      url: url,
      success: function(data, status, xhr) {
        Lodge.displayAutoCompletes(el, JSON.parse(data));
      },
      error: function(xhr, status, error) {
        alert("Error");
      }
    });
  }
  else
  {
    Lodge.displayAutoCompletes(el);
  }
}

$(document).ready(function() {
  Lodge.initAutoCompletes();
});
