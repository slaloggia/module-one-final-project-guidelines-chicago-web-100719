
require 'rest-client'
require 'json'
require 'pry'


def get_data
    response_string = RestClient.get('https://akabab.github.io/superhero-api/api/all.json')
    response_hash = JSON.parse(response_string)
end

def get_characters
    get_data.collect {|hash| hash["name"]}
end

def add_characters
    characters = get_characters.each {|c| Character.create(name: c)}
    puts characters
end
x = Character.new
binding.pry