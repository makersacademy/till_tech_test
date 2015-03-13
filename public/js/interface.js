  $(document).on('click', '#buttonForAdd', function(e) {
    e.preventDefault();
    $('.receiptPlacement').addClass('receipt1')
    $('#printReceipt').removeAttr('hidden')

  });
  $(document).on('click', '.receiptPlacement', function(e) {
    e.preventDefault();
    $('.overView').addClass('receipt2')
  });

  $(document).on('click', '.overView', function(e) {
    e.preventDefault();
    $('.overView').removeClass('receipt2')
  });

