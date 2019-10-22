
require 'rest-client'
require 'json'
require 'pry'


def get_data
    response_string = RestClient.get('https://akabab.github.io/superhero-api/api/all.json')
    response_hash = JSON.parse(response_string)
end

def get_superhero(superhero)
     get_data.find do |hash|
    hash["name"].downcase == superhero.downcase
end

def get_names
    get_data.collect {|hash| hash["name"]}
end

def get_publisher
    
    get_data.collect do |hash|
        hash["biography"]["publisher"]
    end

end

def get_occupation
    get_data.each do |hash|
        hash["work"]["occupation"]
    end
end
