require "./lib/receipt"
require "./lib/order_list"

describe Receipt do

  let(:order_list) { double("OrderList", total: 10.0, print: {items: 
                            { list: [], total: 10.5 }})}
  let(:tax)        { double("Tax"      , print: { after_tax: 10.5, total: 0.5 }) } 
  let(:place)      { double("Location" , print: { name: "Cafe Honika" } )}

  describe "prints information" do
  
    it " provided by evaluator objects passed on initialization" do
      receipt = Receipt.new(order_list, tax: tax)
      expect(receipt.run_and_print_calculations).to eq(tax: { after_tax: 10.5, total: 0.5 }) 
    end

  end

  describe "calculates a grand total" do
    
    it "and appends it to the printed receipt-hash" do
      receipt = Receipt.new(order_list, tax: tax, location: place)
      expect(receipt.print[:total]).to eq 11.0
    end

  end
end

