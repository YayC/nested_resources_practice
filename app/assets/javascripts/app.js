
  function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
    if ( $(link).closest('label').text() == "Question") {
      alert('Question removed!')
    }
  }

  function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
  }


$(document).ready(function() {
  $('#show_new_form').on('click', function(e){
    e.preventDefault();

    $('form#new_survey').toggle(toggleButtonName);
    function toggleButtonName(){
      $button = $('#show_new_form');
      $button.text() === 'New Survey' ? $button.text('Hide Form') : $button.text('New Survey');
    }
  });

  
});
