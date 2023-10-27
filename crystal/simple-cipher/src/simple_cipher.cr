class SimpleCipher
  getter key : String

  def initialize : Nil
    @key = 100.times.map { 'a' + rand(26) }.join
  end

  def initialize(@key : String) : Nil
    if @key.empty? || @key =~ /[^a-z]/
      raise ArgumentError.new("Key must be all lowercase letters")
    end
  end

  {% for methodname, operator in {encode: '+', decode: '-'} %}
  def {{methodname}}(text : String) : String
    String.build do |result|
      text.each_char.zip(@key.each_char.cycle) do |char, key_char|
        result << ('a'.ord + ((char - 'a') {{operator.id}} (key_char - 'a')) % 26).chr
      end
    end
  end
  {% end %}
end
