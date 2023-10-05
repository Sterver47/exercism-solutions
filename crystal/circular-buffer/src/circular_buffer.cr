class GenericCircularBuffer(T) < Array(T)
  def initialize(@max_size : UInt32)
    super
  end

  def read : T
    raise BufferEmptyException.new("Can't read from empty buffer.") if self.empty?
    self.shift
  end

  def write(value : T) : Nil
    raise BufferFullException.new("Can't write to full buffer.") if full?
    self << value
  end

  def overwrite(value : T) : Nil
    self.shift if full?
    self << value
  end

  def full? : Bool
    self.size == @max_size
  end

  class BufferEmptyException < RuntimeError; end

  class BufferFullException < RuntimeError; end
end

class CircularBuffer < GenericCircularBuffer(Int32); end
