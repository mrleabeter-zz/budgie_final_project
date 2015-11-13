$(document).ready(function() {

  $(document).on('click', '.update-discount-button', function(){
    var id = $(this).attr("data-id");
    var discountDiv = $('div #discount-' + id)
    var discountCompany = discountDiv.children('h3').text();
    var discountPercent = parseInt(discountDiv.children('h4').text());

    var restrictionsArray = discountDiv.find('li').map(function() {
      return $(this).text();
    }).toArray();

    $('.user-discount-form #discount_id').val(id);
    $('.user-discount-form #company_company_name').val(discountCompany);
    $('.user-discount-form #discount_discount_percent').val(discountPercent);
    
    $(restrictionsArray).each(function(index, string) {
      if (index === 0) {
        $('.restriction-fields input').val(string);
      } else {
        $('.restriction-fields').append("<div><input type='text' name='restriction[]' value='"+string+"'/><a href='javascript:void(0);'' class='remove-button' title='Remove Restriction'>-</a></div>");
        restrictionCount++;
      }
    });    
  });

  var maxField = 3;
  var fieldHTML = '<div><input type="text" name="restriction[]" value=""/><a href="javascript:void(0);" class="remove-button" title="Remove Restriction">-</a></div>';
  var restrictionCount = 1;
  $(document).on('click', '.add-restriction', function() {
    if (restrictionCount < maxField) {
      restrictionCount++;
      $('.restriction-wrapper').append(fieldHTML);
    }
  });

  $(document).on('click', '.restriction-wrapper .remove-button', function(event) {
    event.preventDefault();
    $(this).parent('div').remove();
    restrictionCount--;
  });

  $(document).on('click', '#restrictions remove-button', function(event) {
    event.preventDefault();
    $(this).parent('div').remove();
    restrictionCount--;
  });

  $(document).on('click', '#user-update-button', function() {
    $('#user-details').hide();
    $('.user-update-form').show();
  });

});