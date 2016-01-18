require 'till_factory'
describe TillFactory do
  subject(:till_factory) {described_class}
  context "when passed a filename, TillFactory will build a till object" do
    it "returns a Till class on #build" do
      allow(File).to receive(:read)
      allow(JSON).to receive(:parse).with(any_args).and_return({prices: {}})
      expect(till_factory.build(:filename).class).to be Till
    end
  end
end
