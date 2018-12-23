jQuery(document).on("turbolinks:load", function() {
<<<<<<< HEAD
 $(".star_content .star").click(function(){
    star = $(this).find("i").attr("value");
    $("#rate_star").val(star);
    $(".star_content .star").removeClass("star_on");
    for (i=1; i<=parseInt(star)+1; i++)
    {
      $(".star_content .star:nth-child("+i+")").addClass("star_on");
    }
=======
  $('.review-rating').raty({
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });
  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'rate[star]'
>>>>>>> 7acb049... add comment, edit comment, destroy comment
  });
});
