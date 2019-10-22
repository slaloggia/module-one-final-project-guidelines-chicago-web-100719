

def get_data
    response_string = RestClient.get('https://akabab.github.io/superhero-api/api/all.json')
    response_hash = JSON.parse(response_string)
end

def add_characters
    characters = get_characters.each {|c| Character.create(name: c)}
    puts characters
end

add_characters