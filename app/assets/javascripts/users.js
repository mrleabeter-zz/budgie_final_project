// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log("I'm loaded!");

$(document).on('click', '.update-discount-button', function(){
  var id = $(this).attr("data-id");
  var discountDiv = $('div #discount-' + id)
  var discountCompany = discountDiv.children('h3').text();
  var discountPercent = parseInt(discountDiv.children('h4').text());
  var discountRestrictions = discountDiv.find('li').text();

  $('.user-discount-form #discount_id').val(id);
  $('.user-discount-form #company_company_name').val(discountCompany);
  $('.user-discount-form #discount_discount_percent').val(discountPercent);
  $('.user-discount-form #discount_restrictions').val(discountRestrictions);

  console.log('hello')
})