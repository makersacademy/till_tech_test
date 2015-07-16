feature 'Placing An Order' do
  before(:each) do
    @testmenu = {
      'Cafe Latte' => 4.75,
      'Flat White' => 4.75,
      'Cappucino' => 3.85,
      'Single Espresso' => 2.05,
      'Double Espresso' => 3.75,
      'Americano' => 3.75,
      'Cortado' => 4.55,
      'Tea' => 3.65,
      'Choc Mudcake' => 6.40,
      'Choc Mousse' => 8.20,
      'Affogato' => 14.80,
      'Tiramisu' => 11.40,
      'Blueberry Muffin' => 4.05,
      'Chocolate Chip Muffin' => 4.05,
      'Muffin Of The Day' => 4.55
    }
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
        expect(page.html).to include(value.to_s)
      end
    end
  end

  scenario 'can select an item from the list' do
    visit '/'
    within('#menu') do
      @testmenu.each do |key, value|
        expect(page).to have_selector("input[type=submit][value='#{key} - #{value}']")
      end
    end
  end

  scenario 'can see quantities to select' do
    visit '/'
    within('#multiplier') do
      (1..9).each do |digit|
        expect(page).to have_css("#multiply-by-#{digit}")
      end
    end
  end

  scenario 'can select an item and a quantity and add them to an order' do
    visit '/'
    within('#multiplier') do
      choose('4')
    end
    within('#menu') do
      click_button('Flat White - 4.75')
    end
    within('#order') do
      expect(page).to have_content('19')
    end
  end
end
