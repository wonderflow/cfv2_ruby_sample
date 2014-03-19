require 'sinatra'
require 'json/pure'

class BaseEnv < Sinatra::Base
get '/' do
  
  res = "<html><body style=\"margin:0px auto; width:80%; font-family:monospace\">" 
  res << "<head><title>CloudFoundry Environment By ZJU_VLIS</title></head>"
  res << "<h3>CloudFoundry Environment By ZJU_VLIS</h3>"
  res << "<div><table>"
  ENV.keys.sort.each do |key|
    value = begin
                "<pre>" + JSON.pretty_generate(JSON.parse(ENV[key])) + "</pre>"
            rescue
                ENV[key]
            end
    res << "<tr><td><strong>#{key}</strong></td><td>#{value}</tr>"
  end
  res << "</table></div></body></html>"
  
end
end
