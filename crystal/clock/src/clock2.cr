class Clock2
  @hour : Int32
  @minute : Int32

  def hour : Int32
    @hour
  end

  def minute : Int32
    @minute
  end

  def initialize(hour : Int32 = 0, minute : Int32 = 0) : Nil
    @hour = hour
    @minute = minute
    self.normalize
  end

  def normalize : Nil
    total_minutes = @hour * 60 + @minute

    @hour = (total_minutes // 60) % 24
    @minute = total_minutes % 60
  end

  def to_s : String
    sprintf("%02d:%02d", @hour, @minute)
  end

  def +(other : Clock2) : Clock2
    @hour += other.hour
    @minute += other.minute
    self.normalize
    self
  end

  def -(other : Clock2) : Clock2
    @hour -= other.hour
    @minute -= other.minute
    self.normalize
    self
  end

  def ==(other : Clock2) : Bool
    @hour == other.hour && @minute == other.minute
  end
end