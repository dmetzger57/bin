#!/usr/bin/env ruby
#
dupes = Hash.new

Dir.glob("**/*") {|f|
  if File.file? f
    check_sum =  `openssl sha1 "#{f}" | cut -d'=' -f2`.tr(' ', '').strip
    dupes[check_sum] = "#{dupes[check_sum]}" + "," + "#{f}"
  end
}

dupes.each do |key, value|
  puts "#{value}\n" if (value =~ /.*,.*,.*/)
end
