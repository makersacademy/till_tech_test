
module KnowsTheDomain

  def order_list
    @order_list ||= Capybara.app.order_list 
  end

  def receipt evaluator_objects = {}
    @receipt    ||= Receipt.new(order_list, evaluator_objects)
  end

  def add_to_receipt additions
    @receipt.evaluators = @receipt.evaluators.merge(additions)
  end

  def menu
    @menu ||= (Capybara.app.menu =  Menu.new([{ name: 'Spaghetti', price: 5.0 }]))
  end

  def order=(order_details)
    @order = Order.new(order_details)
  end

  def order
    @order
  end

  def create_order options
    Order.new(options)
  end

  def place_order options
    order_list.receive_order create_order(options)
  end

  def pay_bill_with_money_of_value value
    add_to_receipt(payment: Payment.new(value, receipt.print[:total]))
  end

end

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

