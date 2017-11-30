$(".logo-project-modal").click(function() {
  $(this).addClass('active');
  $(".logo-project-modal").not(this).removeClass('active');
});
