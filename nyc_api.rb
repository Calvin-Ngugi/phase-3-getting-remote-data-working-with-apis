require 'net/http'
 require 'open-uri'
 require 'json'
 
 class GetPrograms

  def initialize(url)
    @url = url
  end

  def get_programs
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

 programs = GetPrograms.new.get_programs
 puts programs
