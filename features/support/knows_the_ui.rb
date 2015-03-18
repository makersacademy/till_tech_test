module KnowsTheUserInterface

  def enter_payment_of_value value 
    fill_in('payment', with: value)
    click_button 'Make Payment'
  end

  def payment_has_been_made?
    expect(page.find('#receipt-container')).to have_content 'Payment'
  end

  def wait_for_ajax timeout
    sleep(timeout)
  end

end

