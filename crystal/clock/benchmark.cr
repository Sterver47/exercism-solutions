require "benchmark"
require "./src/*"  # Adjust the path to your `Clock` class file

Benchmark.ips do |x|

    x.report("Clock") do
        clock1 = Clock.new(12, 30)
        clock2 = Clock.new(10, -4545)

        clock1.to_s
        clock1 + clock2
        clock1 - clock2
        clock1 == clock2
    end
  
    x.report("Clock2") do
        clock1 = Clock2.new(12, 30)
        clock2 = Clock2.new(10, -4545)

        clock1.to_s
        clock1 + clock2
        clock1 - clock2
        clock1 == clock2
    end
  
  end