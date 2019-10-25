

def get_data
    response_string = RestClient.get('https://akabab.github.io/superhero-api/api/all.json')
    response_hash = JSON.parse(response_string)
end

def add_data
    get_data.each {|character| Character.create(
        name: character["name"],
        secret_identity: character["biography"]["fullName"],
        strength: character["powerstats"]["strength"],
        speed: character["powerstats"]["speed"],
        intelligence: character["powerstats"]["intelligence"],
        alignment: character["biography"]["alignment"],
        publisher_id: Publisher.find_or_create_by(name: character["biography"]["publisher"]).id
    )}
    
end

add_data

