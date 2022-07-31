#! /usr/bin/env ruby

require "optparse"
require "Date"

opt = OptionParser.new

option = {}
opt.on("-m", "--month <MONTH>") {|v| option[:m] = v}
opt.on("-y", "--year <YEAR>") {|v| option[:y] = v}
opt.parse(ARGV)

if option.size == 0
  year = Date.today.year
  mon = Date.today.month
elsif option.size == 1
  year = Date.today.year
  mon = "#{option[:m]}".to_i
else
  year = "#{option[:y]}".to_i
  mon = "#{option[:m]}".to_i
end

puts "#{mon}月 #{year}".center(20)

week = ["日", "月", "火", "水", "木", "金", "土"]
puts week.join(" ")

Firstday = Date.new(year, mon, 1).day
Lastday = Date.new(year, mon, -1).day

w1 = Date.new(year, mon, 1).wday
count = Firstday - w1

while count <= Lastday

  if count <= 0
    print "   " 
  elsif  
    count <= 9
    print "#{count}  "
  else
    print "#{count} "
  end

  if (w1 + count) % 7 == 0
    puts "\n"
  end

  count += 1
end
