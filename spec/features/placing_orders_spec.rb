feature 'Placing An Order' do

  scenario 'I can see the front page' do
    visit '/'
    expect(page.status_code).to eq 200
  end

end
