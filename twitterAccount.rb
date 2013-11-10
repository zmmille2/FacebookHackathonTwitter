require 'tweetstream'
require 'sentimental'
require 'mongo'
include Mongo

mongo_client = MongoClient.new("192.155.95.210")
db = mongo_client.db("tweets")
coll = db.collection("tweets")

Sentimental.load_defaults

analyzer = Sentimental.new
Sentimental.threshold = 0.1

TweetStream.configure do |config|
      config.consumer_key       = 'ig1XLFKyuMrbAbKj9UPLCw'
      config.consumer_secret    = 'qiVGvIWwFsss7P4tYQtOUIetB99biD00JqAAAyPg8'           # ooooooh look who's a bad boy
      config.oauth_token        = '102183904-eQwfgO0zfgSYutwZfKBVGPh1Pl5aboimNSUlgVPy'
      config.oauth_token_secret = 'uTUpPcEpqtSUQMMOjELkJNvbjw4orxBp0gCVRCfdqHLAZ'       # shhhh don't tell anyone this is our little secret ;*
      config.auth_method        = :oauth
end

puts "lat, long, sent"              #header

TweetStream::Client.new.locations(-124.47, 24.0, -66.56, 49.3843) do |status|
        
    geo = status.geo
    puts "#{geo.latitude}, #{geo.longitude}, #{analyzer.get_score(status.text)}"
#    puts status.to_hash[:place][:country_code]
#    puts "(#{status.geo.latitude}, #{status.geo.longitude})"
#    puts "#{status.text}"
#    puts analyzer.get_score(status.text)
#    puts "#{status.text}"

    coll.insert(status.to_hash)

end
