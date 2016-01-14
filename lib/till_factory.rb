class TillFactory
  def self.build(filename)
    Till.new(ReadJson, File, JSON, filename)
  end
end
