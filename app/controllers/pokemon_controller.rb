class PokemonController < ApplicationController
	def show
		respoke = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
		pokebody = JSON.parse(respoke.body)

		id = pokebody ["id"]
		name = pokebody["name"]
		types = pokebody["types"]

		resgif = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
		gifbody = JSON.parse(resgif.body)

		gif_url = gifbody["data"][0]["url"]


		render json: {name: name , types: types[0]["type"]["name"] , id: [id]}
	end
end

#types (is the first level, and an array)
#types[0] (is the 2nd level and a hash)
#types[0]["type"] (is the 3rd level and within the/ is a hash)
#["name"] is the final level and a value
#
# types": [
# 		{
# 			"slot": 2,
# 			"type": {
# 				"url": "https://pokeapi.co/api/v2/type/4/",
# 				"name": "poison"
# 			}
# 		},
# 		{
# 			"slot": 1,
# 			"type": {
# 				"url": "https://pokeapi.co/api/v2/type/12/",
# 				"name": "grass"
