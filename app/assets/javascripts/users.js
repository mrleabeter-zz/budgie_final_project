// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
$(document).ready(function() {

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
  });

  var maxField = 3;
  var fieldHTML = '<div><input type="text" name="restriction[]" value=""/><a href="javascript:void(0);" class="remove-button" title="Remove Restriction">-</a></div>';
  var x = 1;
  $('.add-restriction').click(function() {
    console.log("hello");
    if (x < maxField) {
      x++;
      $('.restriction-wrapper').append(fieldHTML);
    }
  });

  $('.restriction-wrapper').on('click', '.remove-button', function(event) {
    event.preventDefault();
    $(this).parent('div').remove();
    x--
  });

});