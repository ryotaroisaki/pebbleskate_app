// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .


$(function() {

  $('.login-show').click(function(){
    $('#login-modal').fadeIn(300);
  });

  $('.signup-show').click(function(){
      $('#signup-modal').fadeIn(300);
  });

  $('.facebook-show').click(function(){
      $('#facebook-modal').fadeIn(300);
  });

  $('.twitter-show').click(function(){
      $('#twitter-modal').fadeIn(300);
  });

  $('.instagram-show').click(function(){
      $('#instagram-modal').fadeIn(300);
  });

  $('.close-modal').click(function() {
      $('#login-modal').fadeOut();
      $('#signup-modal').fadeOut();
      $('#facebook-modal').fadeOut();
      $('#twitter-modal').fadeOut();
      $('#instagram-modal').fadeOut();
  });

  $('.lesson-hover').hover(
     function() {
       // 子要素の「.text-contents」の要素を取得し、text-activeクラスをつけてください
       $(this).find('.text-contents').addClass('text-active');

     },
     function() {
       // 子要素の「.text-contents」の要素を取得し、text-activeクラスを外してください
        $(this).find('.text-contents').removeClass('text-active');

     }
   );

   // FAQのアコーディオン
   $('.faq-list-item').click(function() {
     var $answer = $(this).find('.answer');
     if($answer.hasClass('open')) {
       $answer.removeClass('open');
       // slideUpメソッドを用いて、$answerを隠してください
       $answer.slideUp();

       // 子要素のspanタグの中身をtextメソッドを用いて書き換えてください
       $(this).find("span").text("+");

     } else {
       $answer.addClass('open');
       // slideDownメソッドを用いて、$answerを表示してください
        $answer.slideDown();

       // 子要素のspanタグの中身をtextメソッドを用いて書き換えてください
        $(this).find("span").text("-");


     }

   });

});

// トップスライドショー
$(function(){
    const setImg = '#viewer';
    const fadeSpeed = 1000;
    const switchDelay = 3000;

    $(setImg).children('img').css({opacity:'0'});
    $(setImg + ' img:first').stop().animate({opacity:'1',zIndex:'20'},fadeSpeed);

    setInterval(function(){
        $(setImg + ' :first-child').animate({opacity:'0'},fadeSpeed).next('img').animate({opacity:'1'},fadeSpeed).end().appendTo(setImg);
    },switchDelay);
});


// フェードイン
$(function(){

  $('.toppage_caption').fadeIn(3000);

  $('.start_button').fadeIn(4500);

  $('.description').fadeIn(5500);

});


//slickスライドショー//

// <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
// <script src="/assets/slick.min.js"></script>

$(()=> {
    $('.center-item').slick({
          infinite: false,
          dots:true,
          slidesToShow: 1,
          centerMode: true,
          centerPadding:'130px',
          variableWidth: true,
          autoplay:true,
          arrows: true,
          initialSlide: 2,
          infinite: true,
              responsive: [{
               breakpoint: 480,
                    settings: {
                         slidesToShow: 1,
                         centerMode: true,
                         centerPadding:'74px',
                         variableWidth: true,

               }
          }]
     });
});
