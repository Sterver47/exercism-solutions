class Clock
  protected getter(total_minutes : Int32)

  def initialize(hour : Int32 = 0, minute : Int32 = 0) : Nil
    @total_minutes = (minute + hour * 60) % 1440
  end

  def to_s : String
    "%02d:%02d" % [(@total_minutes // 60) % 24, @total_minutes % 60]
  end

  {% for name in %w{+ -} %}
    def {{name.id}}(other : Clock) : Clock
      self.class.new(minute: (total_minutes {{name.id}} other.total_minutes) % 1440)
    end
  {% end %}

  def ==(other : Clock) : Bool
    self.total_minutes == other.total_minutes
  end
end
