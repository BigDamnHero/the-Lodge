$(function() {
  // Setup 'Invite new player' popup
  $("#invite_link").click(function(){
    Lodge.Campaign.openInvitePopup();
    return false;
  });
});

var Lodge = Lodge || {};
Lodge.Campaign = Lodge.Campaign || {};

Lodge.Campaign.openInvitePopup = function() {
  // Get popup div
  var popup = $("#invite_popup");
  if(popup.size() < 1)
  {
    // Popup div doesn't exist, create it.
    popup = $("<div></div>");
    popup.attr("id", "invite_popup");
    popup.addClass("popup");
    
    // Show loading animation

    // Ajax fetch popup content
    var url = $("#invite_link").attr("href");
    $.ajax({
      url:      url,
      cache:    false,
      dataType: "html",
      success: function(data, status, xhr) {
        popup.append(data);
      },
      error: function(xhr, status, error) {
        alert("Uh oh, I fucked up: " + error);
      }
    });
  }

  // Show popup
  popup.dialog({
    draggable:  false,
    modal:      true,
    height:     330,
    width:      500,
    resizable:  false,
    title:      "Invite Players",
    show:       "fade",
    hide:       "fade",
    buttons:    {
      Cancel: function() { $(this).dialog("close"); },
      Invite: function() {
        Lodge.Campaign.invitePlayers();
      }
    }
  });
  
  // Hide loading animation
}

Lodge.Campaign.invitePlayers = function() {
  if(!$("#users_select").val())
  {
    alert("No users selected.");
    return false;
  }
  
  $("#invite_form").submit();
}
