require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

  def add_items
    allow(shop).to receive(:options).and_return(4.75,3.85)
    order.record_item("Cafe Latte", shop.options("Cafe Latte"), 2)
    order.record_item("Cappucino", shop.options("Cappucino"), 1)
  end

  def add_many_items
    allow(shop).to receive(:options).and_return(4.75,3.85)
    order.record_item("Cafe Latte", shop.options("Cafe Latte"), 10)
    order.record_item("Cappucino", shop.options("Cappucino"), 5)
  end

  def add_muffin
    allow(shop).to receive(:options).and_return(4.05)
    order.record_item("Blueberry Muffin", shop.options("Blueberry Muffin"), 1)
  end