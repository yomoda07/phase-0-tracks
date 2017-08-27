
$('.container').click(function() {
  var subMenu = $('.menu-item').find('.sub-menu');
  if (subMenu.hasClass('active')) {
    subMenu.slideUp();
  }
});
$('.menu-item').click(function() {
  var subMenu = $(this).find('.sub-menu');
  var menuName = $(this).children().first().find('span');
  var menuItemAll = $(this).parent().children();
  menuItemAll.find('.sub-menu').slideUp('fast');
  menuItemAll.find('span').text('▽');
  menuItemAll.find('.sub-menu').removeClass('active');
  if (subMenu.hasClass('active')) {
    subMenu.removeClass('active');
    subMenu.slideUp();
  } else {
    $(this).find('.sub-menu').addClass('active');
    menuName.text('△');
    subMenu.slideDown();
  }
});


$('h2').click(function() {
  $(this).parent().find('.content').slideToggle('slow');
});

$('.sub-menu').find('li').hover(function() {
  $(this).css('margin-left', '10px');
}, function() {
  $(this).css('margin-left', '5px');
});
