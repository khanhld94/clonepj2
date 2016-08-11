uri = URI.parse(ENV["https://fathomless-badlands-24597.herokuapp.com/"] || "redis://localhost:3000/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
