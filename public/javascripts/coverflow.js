var Lodge = Lodge || {}
Lodge.CoverFlow = {};
Lodge.CoverFlowSelect = {};
Lodge.CoverFlow.speed = '0.5s';

Lodge.CoverFlow.parseArgs = function(args)
{
  var options = {};
  if(typeof args[0] == 'object') { options = args[0]; }
  else if(typeof args[1] == 'object') { options = args[1]; }
  if(typeof args[0] == 'string') { options['selector'] = args[0]; }
  return options;
}

Lodge.CoverFlow.getActiveDetails = function(el, selected)
{
  var items = el.data("coverflow-items");
  var id = items[selected].id;
  var url = el.data("coverflow-detail-url");
  if(url.charAt(url.length - 1) != '/') { url += '/'; }
  url += id;
  $.ajax({
      url: url,
      dataType: "html",
      success: function(data, status, xhr) {
        var details = $(data);
        el.find(".coverflow_detail_wrapper").empty();
        el.find(".coverflow_detail_wrapper").append(details);
        $(".coverflow_wrapper").resize();
      },
      error: function(xhr, status, error) {
        alert("Error getting cover flow details: " + error + "\nUrl = " + url);
      }
  });
}

Lodge.CoverFlow.init = function(el, options)
{
  el = $(el);
  el.addClass("coverflow_wrapper");
  var river = $(document.createElement('div'));
  river.addClass("coverflow_river");
  el.append(river);
  var images = new Array(7);
  for(var i = 0; i < 7; i++)
  {
    var wrapper = $(document.createElement('div'));
    wrapper.hide();
    wrapper.addClass("coverflow_image coverflow_image_" + i);
    wrapper.css({
      "-webkit-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-moz-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-o-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-ms-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
    });
    images[i] = wrapper;
    var img = $(document.createElement('img'));
    img.css({
      "-webkit-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-moz-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-o-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "-ms-transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
      "transition": "all " + Lodge.CoverFlow.speed + " ease-in-out",
    });
    wrapper.append(img);
    river.append(wrapper);
  }
  var detailWrapper = $(document.createElement('div'));
  detailWrapper.addClass("coverflow_detail_wrapper");
  el.append(detailWrapper);
  el.data("coverflow-list-url", options.itemsUrl);
  el.data("coverflow-detail-url", options.detailUrl);
  if(options.itemsUrl)
  {
    $.ajax({
      url: options.itemsUrl,
      success: function(data, status, xhr) {
        var items = JSON.parse(data);
        el.data("coverflow-items", items);
        el.data("coverflow-offset", 0);   // Difference between center index & 3
        el.data("coverflow-selected", 0); // Item currently displayed in the center
        el.trigger("coverflow-change", [0, items[0]]);
        for(var i = 0; i < 7; i++)
        {
          var itemIdx = (i + items.length - 3) % items.length;
          var img = $(images[i]).children();
          img.attr("src", items[itemIdx].thumb);
          img.attr("title", items[itemIdx].name);
          $(images[i]).show();
        }
        $(images[3]).addClass("coverflow_active");
        Lodge.CoverFlow.getActiveDetails(el, 0);
      },
      error: function(xhr, status, error) {
        alert("Error getting cover flow info: " + error);
      }
    });
  }
  
  var focusEl = $(options.focusElement || el);
  focusEl.keydown(function(event)
  {
    if(!el.is(":visible")) { return; }
    var items = el.data("coverflow-items");
    var selected = el.data("coverflow-selected");
    var center = el.data("coverflow-offset");
    var old = center;
    if(event.keyCode === 37)
    {
      center = (center + 1) % 7;
      selected = Lodge.Util.wrap(selected - 1, 0, items.length);
    }
    else if(event.keyCode === 39)
    {
      center -= 1;
      if(center < 0) { center += 7; }
      selected = Lodge.Util.wrap(selected + 1, 0, items.length);
    } 
    else { return; }
    Lodge.CoverFlow.getActiveDetails(el, selected);
    for(var i = 0; i < 7; i++)
    {
      var prev = (old + i);
      if(prev < 0) { prev += 7; }
      if(prev > 6) { prev -= 7; }
      var next = (center + i);
      if(next < 0) { next += 7; }
      if(next > 6) { next -= 7; }
      images[i].removeClass("coverflow_image_" + prev);
      images[i].addClass("coverflow_image_" + next);
      if(i == 3) { images[i].addClass("coverflow_active"); }
      else { images[i].removeClass("coverflow_active"); }
    }
    el.data("coverflow-offset", center);
    el.data("coverflow-selected", selected);
    if(event.keyCode == 37)
    {
      // Load new item in position 0
      var newIdx = Lodge.Util.wrap(selected - 3, 0, items.length);
      var img = el.find(".coverflow_image_0 img");
      img.attr("src", items[newIdx].thumb);
      img.attr("title", items[newIdx].name);
    }
    else
    {
      // Load new item in position 6
      var newIdx = Lodge.Util.wrap(selected + 3, 0, items.length);
      var img = el.find(".coverflow_image_6 img");
      img.attr("src", items[newIdx].thumb);
      img.attr("title", items[newIdx].name);
    }
    el.trigger("coverflow-change", [selected, items[selected]]);
  });
}

Lodge.CoverFlowSelect.init = function(el, options)
{
  el = $(el);
  var input = $('#' + options['inputId']);
  el.bind('coverflow-change', function(event, index, item) {
    input.val(item.id);
  });
}

Lodge.coverFlow = function()
{
  var options = Lodge.CoverFlow.parseArgs(arguments);
  $(options.selector).each(function()
  {
    Lodge.CoverFlow.init(this, options);
  });
}

Lodge.coverFlowSelect = function()
{
  var options = Lodge.CoverFlow.parseArgs(arguments);
  $(options.selector).each(function()
  {
    Lodge.CoverFlowSelect.init(this, options);
    Lodge.CoverFlow.init(this, options);
  });
}

