# Domr
# By Nick Shvelidze
# Simple search for domain names
# Command-Line usage:
#    domr example.com
# => example.com is taken

require 'rainbow'
require 'uri'
require 'net/http'
require 'json'

# Simple search for domain names
# The main class
# Usage:
# Domr.search(query)
class Domr
  
  # Perform a query on domainr API
  #
  # Example:
  #   >> Domr.search "exapmle"
  #   => example.com taken
  #
  # Arguments:
  #   query: (String)
  def self.search query
    
    # Form the request string
    request = Net::HTTP::Get.new("/api/json/search?q=" << URI.escape(query))
    
    # Perform the actual query
    response = Net::HTTP.start("domai.nr") { |http|
      http.request request
    }
    
    # Check for errors
    if response.code != "200"
      puts "HTTP error".color(:red).bright # Color is red
      
      # Exit the program
      exit
    end
    
    # Output results
    JSON.parse(response.body)['results'].each do |result|

      # Determine color to show
      if result['availability'] == 'available'
        color = :green
      elsif result['availability'] == 'taken' || result['availability'] == 'unavailable'
        color = :red
      elsif result['availability'] == 'maybe'
        color = :yellow
      else
        color = :default
      end

      # Construct final output string
      string = " " << result['domain'] << " " << result['availability']

      # Output colorized string
      puts string.color(color).bright
    end
  end
end