#Extensions To Hash

#to_xml
XML_TYPE_NAMES = {
    "Symbol"     => "symbol",
    "Integer"    => "integer",
    "BigDecimal" => "decimal",
    "Float"      => "float",
    "TrueClass"  => "boolean",
    "FalseClass" => "boolean",
    "Date"       => "date",
    "DateTime"   => "datetime",
    "Time"       => "datetime"
}

#Merging
{a: 1, b: 1}.merge(a: 0, c: 2)
# => {:a=>0, :b=>1, :c=>2}

#deep_merge and deep_merge!
#if key is there in both hashes, then value in the one is considered
{a: {b: 1}}.deep_merge(a: {c: 2})
# => {:a=>{:b=>1, :c=>2}}


#Working with keys

#except and except!
{a: 1, b: 2}.except(:a) # => {:b=>2}

#stringify_keys and stringify_keys!
{nil => nil, 1 => 1, a: :a}.stringify_keys
# => {"" => nil, "1" => 1, "a" => :a}


#Slicing
#slice! replaces hash with given keys and returns hash containing removed key/value
hash = {a: 1, b: 2}
rest = hash.slice!(:a) # => {:b=>2}
hash                   # => {:a=>1}

#Extracting
#extract! removes and returns key/value pairs that match given keys
hash = {a: 1, b: 2}
rest = hash.extract!(:a) # => {:a=>1}
hash                     # => {:b=>2}
