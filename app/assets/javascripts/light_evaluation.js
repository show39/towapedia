$(document).on('turbolinks:load', function() {
  $(".light-group1,.light-group2,.light-group3").hover(function() {
    $(".light-group1,.light-group2,.light-group3").attr("src", "/assets/light-off-4c4e686b109af4cc020a7fe84f115682cff8986868a5cb955af4fb9662248ac2.jpg");
    $(this).attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
    $(this).prevAll().attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
  });
  $(".light-group1").click(function() {
    $(this).parent().html("<img src='/assets/lights1-c4875b518ba63c9573efe0c81e7133c30064a1ecf6a1369e5745cbc184b30689.jpg', alt='lights1'>");
    $("input[name=selected-light]").val(this.id);
  });
  $(".light-group2").click(function() {
    $(this).parent().html("<img src='/assets/lights2-a44c93e142825705696f95cf11c9cf8f39666930c915b524461c28852a6f1b8d.jpg', alt='lights2'>");
    $("input[name=selected-light]").val(this.id);
  });
  $(".light-group3").click(function() {
    $(this).parent().html("<img src='/assets/lights3-64c9cd449bb348961759e0d33e56c6bf26af91d1b98e384af60affe943bf4b96.jpg', alt='lights3'>");
    $("input[name=selected-light]").val(this.id);
  });
});
