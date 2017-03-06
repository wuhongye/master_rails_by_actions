(function(){

  $('.add-to-cart-btn').on('click', function() {
    var $this = $(this),
        $amount = $('input[name="amount"]'),
        $prog = $this.find('i');

    if ($amount.length > 0 && parseInt($amount.val()) <= 0){
      alert("购买数量至少为 1");
      return false;
    }

    $.$.ajax({
      url: $this.attr('href'),
      method: 'post',
      data: { product_id: $this.data('product_id'), amount: $amount.val()},
      beforeSend: function(){
        if (!$prog.hasClass('fa-spin')) {
          $prog.addClass('fa-spin');
        }
        $prog.show();
      },
      success: function(data){
        if ($('#shopping_cart_model').length > 0) {
          $('#shopping_cart_model').remove();
        }

        $('body').append('data');
        $('#shopping_cart_model').modal();
      },
      complete: function() {
        $prog.hide();
      }
    })

    return false;
  })

})()
