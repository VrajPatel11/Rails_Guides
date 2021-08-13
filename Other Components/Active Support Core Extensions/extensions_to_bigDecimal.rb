#Extensions to BigDecimal
BigDecimal(5.00, 6).to_s       # => "5.0"

#symbol specifier
BigDecimal(5.00, 6).to_s       # => "5.0"

#engineering notation
BigDecimal(5.00, 6).to_s("e")  # => "0.5E1"
