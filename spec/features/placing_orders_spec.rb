feature 'Placing An Order' do

  before(:each) do
    @testmenu = {
      "Cafe Latte" => 4.75,
      "Flat White" => 4.75,
      "Cappucino" => 3.85,
      "Single Espresso" => 2.05,
      "Double Espresso" => 3.75,
      "Americano" => 3.75,
      "Cortado" => 4.55,
      "Tea" => 3.65,
      "Choc Mudcake" => 6.40,
      "Choc Mousse" => 8.20,
      "Affogato" => 14.80,
      "Tiramisu" => 11.40,
      "Blueberry Muffin" => 4.05,
      "Chocolate Chip Muffin" => 4.05,
      "Muffin Of The Day" => 4.55
    }
  end

  scenario 'can see the front page' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'can see a price list stored in JSON' do
    visit '/'
    @testmenu.each do |key, value|
      expect(page).to have_content(key)
      expect(page).to have_content(value)
    end
  end

  scenario 'can select an item from the list' do
    visit '/'
    @testmenu.each_key do |key|
      expect(page).to have_selector(:link_or_button, key)
    end
  end

  scenario 'can see quantities to select' do
    visit '/'
    within("#multiplier") do
      (1..9).each do |digit|
        expect(page).to have_css("#multiply-by-#{digit}")
      end
    end
  end

  scenario 'can select an item and a quantity and add them to an order' do
    visit '/'
    within('#menu') do
      check('Flat White - 4.75')
    end
    within('#multiplier') do
      choose('4')
    end
    within('#add-to-total') do
      click_link 'Add to order'
    end
    within('#order') do
      expect(page).to have_content('19')
    end
  end

end
