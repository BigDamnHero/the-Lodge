Lodge.Characters = Lodge.Characters || {};
Lodge.Characters.FormHelper = {};
Lodge.Characters.FormHelper.classCount = 0;

Lodge.Characters.FormHelper.newClassFields = function()
{
  var count = Lodge.Characters.FormHelper.classCount;
  Lodge.Characters.FormHelper.classCount++;
  var wrapper = $('<div></div>');
  wrapper.attr('id', 'class_levels_wrapper_' + count);
  wrapper.data('index', count);

  // class_id hidden input
  var el1 = $('<input type="hidden"></input>');
  el1.attr('id', 'class_levels_class_id_' + count);
  el1.attr('name', 'character[class_levels_attributes][' + count + '][class_id]');
  wrapper.append(el1);

  // class name label
  var el2 = $('<label></label>');
  el2.attr('for', 'class_levels_level_' + count);
  el2.text('Barbarian');
  wrapper.append(el2);
  
  // levels numeric input
  var el3 = $('<input type="number"></input>');
  el3.attr('id', 'class_levels_level_' + count);
  el3.attr('min', 1);
  el3.attr('value', 1);
  el3.attr('size', 4);
  el3.attr('name', 'character[class_levels_attributes][' + count + '][level]');
  wrapper.append(el3);
  
  return wrapper;
}

$(function() {
  $("#tabs").tabs({
    show: function(event, ui) {
      var sel = '#' + ui.panel.id + ' .focus';
      $(sel).focus();
    }
  });
  
  Lodge.coverFlowSelect({
    selector: '#race_picker',
    inputId: 'character_race',
    itemsUrl: '/cover_flow/races',
    detailUrl: '/cover_flow/race',
    focusElement: 'body'
  });
  
  Lodge.coverFlowSelect({
    selector: '#class_picker',
    inputId: 'char_class_id',
    itemsUrl: '/cover_flow/classes',
    detailUrl: '/cover_flow/class',
    focusElement: 'body'
  });
  
  $('#class_picker').bind('coverflow-change', function(event, index, item) {
    
  });
  
  $('#add_class_link').click(function() {
    var fields = Lodge.Characters.FormHelper.newClassFields();
    $('#levels_wrapper').append(fields);
  });
});
