$(document).on('turbolinks:load', function() {
  $(".light-group1,.light-group2,.light-group3").hover(function() {
    $(".light-group1").attr("src", "/assets/light-off1-41763fca86985ad1647f3b40629e2129c1af8a380781948e7921b986dd843de7.jpg");
    $(".light-group2").attr("src", "/assets/light-off2-1c1235a8a614862e63b1016ae9ada657e9ca4aa0fec800e46d4fd5a3fb16ef6c.jpg");
    $(".light-group3").attr("src", "/assets/light-off3-051a7c213d3753d088f92229a2b70e577c92cbae645b626fbba80d77afdc79ec.jpg");
    $(this).attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
    $(this).parents('form').prevAll().find('img').attr("src", "/assets/light-on-7f6434b6f5408736ab9c65b380002e18ffb64246ad995e5ef1d7e79de4ee0d46.jpg");
  });
});
