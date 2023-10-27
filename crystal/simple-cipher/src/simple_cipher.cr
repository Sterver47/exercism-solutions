class SimpleCipher
  getter key : String

  def initialize(@key : String = "") : Nil
    @key = 100.times.map { 'a' + rand(26) }.join if @key.empty?
  end

  {% for methodname, operator in {encode: '+', decode: '-'} %}
  def {{methodname}}(text : String) : String
      text.each_char.zip(@key.each_char.cycle).map do |char, key_char|
       ('a'.ord + ((char - 'a') {{operator.id}} (key_char - 'a')) % 26).chr
    end.join
  end
  {% end %}
end
