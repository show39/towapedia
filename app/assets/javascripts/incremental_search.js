$(document).on('turbolinks:load', function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxSearch = function() {
    $.ajax({
      url: "search",
      type: "GET",
      data: ("keyword=" + input)
    });
  };
  $('#inc_search').on('keyup', function() {
    input = $.trim($(this).val());
    if(!input) {
      var ele = document.getElementById('towa_list');
      ele.innerHTML = '';
      return false;
    }
    if(preInput !== input) {
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch, 300);
    }
    preInput = input;
  });
});
