feature 'Placing An Order' do
  before(:each) do
    @testmenu = {
      'Cafe Latte' => '4.75',
      'Flat White' => '4.75',
      'Cappucino' => '3.85',
      'Single Espresso' => '2.05',
      'Double Espresso' => '3.75',
      'Americano' => '3.75',
      'Cortado' => '4.55',
      'Tea' => '3.65',
      'Choc Mudcake' => '6.40',
      'Choc Mousse' => '8.20',
      'Affogato' => '14.80',
      'Tiramisu' => '11.40',
      'Blueberry Muffin' => '4.05',
      'Chocolate Chip Muffin' => '4.05',
      'Muffin Of The Day' => '4.55'
    }
  end

  def order_item(item, quantity = 1)
    visit '/'
    # choose(quantity)
    # find(:css, "input[type='radio'][value='#{quantity}']").click
    # page.find_field(quantity).click
    # find('input #5').click
    choose("multiplier", option: quantity)
    click_button(item)
  end

  scenario 'can see the front page' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'can see a price list stored in JSON' do
    visit '/'
    within('#menu') do
      @testmenu.each do |key, value|
        expect(page.html).to include(key)
        expect(page.html).to include(value)
      end
    end
  end

  scenario 'can select an item from the list' do
    visit '/'
    within('#menu') do
      @testmenu.each_key do |key|
        expect(page).to have_selector("button[type=submit][value='#{key}']")
      end
    end
  end

  scenario 'can see quantities to select' do
    visit '/'
    within('#multiplier') do
      (1..9).each do |digit|
        expect(page).to have_selector("input[type=radio][value='#{digit}']")
      end
    end
  end

  scenario 'can select an item and a quantity and add them to an order' do
    visit '/'
    within('#multiplier') do
      choose('4')
    end
    within('#menu') do
      click_button('Flat White - £4.75')
    end
    within('#order') do
      expect(page).to have_content('19')
    end
  end

  scenario 'add multiple line items and show subtotal, tax and total' do
    order_item('Flat White')
    order_item('Tea', 4)
    order_item('Muffin Of The Day', 2)
    order_item('Affogato', 2)
    within('#order') do
      expect(page).to have_content('58.05')
      expect(page).to have_content('63.06')
    end
  end

  scenario 'enter payment and show change due', :js => true do
    order_item('Flat White')
    # sleep 3
    order_item('Tea', 4)
    # sleep 3
    order_item('Muffin Of The Day', 2)
    # sleep 3
    order_item('Affogato', 2)
    # sleep 3
    fill_in('paid', :with => '7000')
    within('#change') do
      expect(page).to have_content('6.96')
    end
  end

end
