Lodge.Characters = Lodge.Characters || {};
Lodge.Characters.FormHelper = {};
Lodge.Characters.FormHelper.classCount = 0;
Lodge.Characters.FormHelper.viewed = [false, false, false, false, false, false];

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
  el2.attr('id', 'class_levels_class_name_' + count);
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
  el3.data('new-class', true);
  wrapper.append(el3);
  
  // remove row button
  if(count > -1)
  {
    var el4 = $('<a href="#remove_class">[remove]</a>');
    el4.attr('id', 'class_levels_remove_' + count);
    el4.addClass('negative');
    el4.addClass('remove_button');
    el4.click(function() {
      Lodge.Characters.FormHelper.removeClassFields(count);
      return false;
    });
    wrapper.append(el4);
  }
  
  return wrapper;
}

Lodge.Characters.FormHelper.removeClassFields = function(index)
{
  
}

Lodge.Characters.FormHelper.checkComplete = function()
{
  var complete = true;
  $("input[required='required']").each(function() {
    complete = complete && $(this).val().length > 0;
  });
  var disabled = complete ? false : "disabled";
  $("input[type='submit']").attr("disabled", !complete);
}

$(function() {
  $("#tabs").tabs({
    show: function(event, ui) {
      var sel = '#' + ui.panel.id + ' .focus';
      $(sel).focus();
      var index = $(this).tabs('selected');
      Lodge.Characters.FormHelper.viewed[index] = true;
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
  
  $("input[required='required']").change(function(){
    Lodge.Characters.FormHelper.checkComplete(); 
  });
  $("input[required='required']").keyup(function(){
    Lodge.Characters.FormHelper.checkComplete(); 
  });
  
  /*
  $('#class_picker').bind('coverflow-change', function(event, index, item) {
    var items = $('#class_picker').data('coverflow-items');
    var index = $('#class_picker').data('coverflow-selected');
    var selected = items[index];
    var last = Lodge.Characters.FormHelper.classCount - 1;
    $('#class_levels_class_id_' + last).val(selected.id);
    $('#class_levels_class_name_' + last).text(selected.name);
  });
  
  $('#add_class_link').click(function() {
    var fields = Lodge.Characters.FormHelper.newClassFields();
    $('#levels_wrapper').append(fields);
    return false;
  });
  
  if($('#class_levels_wrapper_0').length < 1) {
    $('#add_class_link').click();
  }
  */
});
