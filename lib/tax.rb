module Tax

TAX_RATE = 8.64

def calculate_tax(value)
  (value * (TAX_RATE / 100)).round(2)
end

end