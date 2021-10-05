/* Set values(using ajax) + misc */
var promoCode;
var promoPrice;
var fadeTime = 150;

/* Assign actions */
$('.quantity input').change(function() {
  updateQuantity(this);
});

$('.remove button').click(function() {
  removeItem(this);
});

$(document).ready(function() {
  updateSumItems();
});


// check if discount code is valid using ajax.
$('.promo-code-cta').click(function() {

  promoCode = $('#promo-code').val();

  const data = {}

    $.ajax({
        type: "GET",
        url: '/customer/rest/discount-code/?code=' + promoCode,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
            console.log('success');

          if (data.length != 0) {

            promoPrice = data[0]['amount']
            console.log(promoPrice);

              //If there is a promoPrice that has been set (it means there is a valid promoCode input) show promo.
              if (promoPrice) {
                $('.summary-promo').removeClass('hide');
                $('.promo-value').text(promoPrice);
                recalculateCart(true);
              }

          } else {
            // if promoCode is not valid.
            promoPrice = 0;
            alert("این کد معتبر نیست!");
          }
        },

        error: function (xhr) {

            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console.
            alert(xhr.responseText);
        }
    });

});

/* Recalculate cart */
function recalculateCart(onlyTotal) {
  var subtotal = 0;

  /* Sum up row totals */
  $('.basket-product').each(function() {
    subtotal += parseInt($(this).children('.subtotal').text());
  });

  /* Calculate totals */
  var total = subtotal;

  //If there is a valid promoCode, and subtotal < 10000 subtract from total
  var promoPrice = parseInt($('.promo-value').text());
  if (promoPrice) {
    if (subtotal >= 10000) {
      total -= promoPrice*total/100;
    } else {
      alert('برای استفاده از کد تخفیف باید مبلغ سفارشتان بیش از 10 هزار تومن باشد.');
      $('.summary-promo').addClass('hide');
    }
  }

  /*If switch for update only total, update only total display*/
  if (onlyTotal) {
    /* Update total display */
    $('.total-value').fadeOut(fadeTime, function() {
      $('#basket-total').html(total);
      $('.total-value').fadeIn(fadeTime);
    });
  } else {
    /* Update summary display. */
    $('.final-value').fadeOut(fadeTime, function() {
      $('#basket-subtotal').html(subtotal);
      $('#basket-total').html(total);
      if (total == 0) {
        $('.checkout-cta').fadeOut(fadeTime);
      } else {
        $('.checkout-cta').fadeIn(fadeTime);
      }
      $('.final-value').fadeIn(fadeTime);
    });
  }
}

/* Update quantity */
function updateQuantity(quantityInput) {
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseInt(productRow.children('.price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;

  /* Update line price display and recalc cart totals */
  productRow.children('.subtotal').each(function() {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice);
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });

  productRow.find('.item-quantity').text(quantity);
  updateSumItems();
}

function updateSumItems() {
  var sumItems = 0;
  $('.quantity input').each(function() {
    sumItems += parseInt($(this).val());
  });
  $('.total-items').text(sumItems);
}

/* Remove item from cart */
function removeItem(removeButton) {
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
    updateSumItems();
  });
}
