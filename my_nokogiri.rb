require 'rubygems'
require 'nokogiri'
require 'open-uri'
qsbk = "http://wap3.qiushibaike.com/new2/hot/533"
p Dir.pwd      #"/home/sean/NetBeansProjects/his/yun_vms"
p __FILE__     #"/home/sean/NetBeansProjects/his/yun_vms/lib/customs/tools/my_nokogiri.rb"
p File.dirname(__FILE__) #"/home/sean/NetBeansProjects/his/yun_vms/lib/customs/tools"
p File.extname(__FILE__) #".rb"
p File.basename(__FILE__) #"my_nokogiri.rb"
p File.basename(__FILE__,File.extname(__FILE__))  #"my_nokogiri"
p File.expand_path("../restart", __FILE__) #"/home/sean/NetBeansProjects/his/yun_vms/lib/customs/tools/restart"

wml = Nokogiri::HTML open(qsbk)
p wml.css('div.qiushi').length
text_file = File.new(File.join(File.dirname(__FILE__),"qiushibaike.txt"), "w+")
wml.css('div.qiushi').each do |qiushi|
  text_file.puts qiushi.inner_html[0,qiushi.inner_html.index('<br>')]
  text_file.puts "-----------------------"
end
text_file.close