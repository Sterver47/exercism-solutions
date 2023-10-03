class Clock
  @total_minutes : Int32

  def initialize(hour : Int32 = 0, minute : Int32 = 0) : Nil
    @total_minutes = minute + hour * 60
  end

  def total_minutes : Int32
    @total_minutes
  end

  def to_s : String
    sprintf("%02d:%02d", (@total_minutes // 60) % 24, @total_minutes % 60)
  end

  def +(other : Clock) : Clock
    @total_minutes += other.total_minutes
    self
  end

  def -(other : Clock) : Clock
    @total_minutes -= other.total_minutes
    self
  end

  def ==(other : Clock) : Bool
    (self.total_minutes % 1440) == (other.total_minutes % 1440)
  end
end
