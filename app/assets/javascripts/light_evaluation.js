$(document).on('turbolinks:load', function() {
  $(".light-group1,.light-group2,.light-group3").hover(function() {
    $(".light-group1,.light-group2,.light-group3").attr("src", "/assets/light-off-4c4e686b109af4cc020a7fe84f115682cff8986868a5cb955af4fb9662248ac2.jpg");
    $(this).attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
    $(this).parents('form').prevAll().find('img').attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
  });
});
