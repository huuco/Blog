jQuery(document).on("turbolinks:load", function() {
  $(".star_content .star").click(function(){
    star = $(this).find("i").attr("value");
    $("#rate_star").val(star);
    $(".star_content .star").removeClass("star_on");
    for (i=1; i<=parseInt(star)+1; i++)
    {
      $(".star_content .star:nth-child("+i+")").addClass("star_on");
    }
  });
  $('.average-review-rating').raty({
    readOnly: true,
    path: '/assets/',
    score: function() {
      return $(this).attr('data-score')
    }
  });
  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'rate[star]'
  });
  var selectizeCallback = null;

  $(".category-modal").on("hide.bs.modal", function(e) {
    if (selectizeCallback != null) {
      selectizeCallback();
      selecitzeCallback = null;
    }

    $("#new_category").trigger("reset");
    $.rails.enableFormElements($("#new_category"));
  });

  $("#new_category").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function(response) {
        selectizeCallback({value: response.id, text: response.name});
        selectizeCallback = null;

        $(".category-modal").modal('toggle');
      }
    });
  });

  $(".selectize").selectize({
    create: function(input, callback) {
      selectizeCallback = callback;

      $(".category-modal").modal();
      $("#category_name").val(input);
    }
  });
  $(".comment-list-fuck")
});

