require "open-uri"
require "json"
class Cusipparse
  #新浪api
  @@url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=%ip%"
  @@ydurl = "http://www.youdao.com/smartresult-xml/search.s?type=ip&q=%ip%"
  @@tburl = "http://ip.taobao.com/service/getIpInfo.php?ip=%ip%"

  def self.parse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    JSON.parse(open(@@url.sub('%ip%', ip)).read)['province']
    #==>{
    #"ret"=>1,
    #"start"=>"117.136.5.0",
    #"end"=>"117.136.5.255",
    #"country"=>"中国",
    #"province"=>"辽宁",
    #"city"=>"沈阳",
    #"district"=>"",
    #"isp"=>"移动",
    #"type"=>"",
    #"desc"=>"全省移动cmnet共用出口"
    #}
  end

  def self.ydparse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    (open(@@ydurl.sub('%ip%', ip)).read)
    #==>{
    #"ret"=>1,
    #"start"=>"117.136.5.0",
    #"end"=>"117.136.5.255",
    #"country"=>"中国",
    #"province"=>"辽宁",
    #"city"=>"沈阳",
    #"district"=>"",
    #"isp"=>"移动",
    #"type"=>"",
    #"desc"=>"全省移动cmnet共用出口"
    #}
  end

  def self.tbparse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    JSON.parse((open(@@tburl.sub('%ip%', ip)).read))["data"]["region"]
  end
end
