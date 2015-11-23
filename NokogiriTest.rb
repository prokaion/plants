require 'open-uri'

url = "http://www.dehner.de"
main_cat = "/pflanzen-pflege"
subcat1 = "-zimmerpflanzen"
subcat2 = "-gruenpflanzen"
subcat3 = "-grosspflanzen/"

url += main_cat + subcat1 + subcat2
puts "calling url: " + url

doc = Nokogiri::HTML(open(url))

puts "Starting....................................."

count = 0
doc.xpath('//div[@class="tsr-product cc"]').each do |div_offer| 
  count += 1
  puts div_offer.search('a').first['href']
end

puts "found " + count.to_s + " links!"