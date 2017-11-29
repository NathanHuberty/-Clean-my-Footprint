function form_radio() {
  $("#occasional").collapse("show");
  var reccurent = document.getElementById("trip_frequency_reccurent")
  var occasional = document.getElementById("trip_frequency_occasional")
  reccurent.addEventListener("click", function(e) {
    $("#recurring").collapse("show");
    $("#occasional").collapse("hide");
  })

  occasional.addEventListener("click", function(e) {
    $("#recurring").collapse("hide");
    $("#occasional").collapse("show");
  })
}
