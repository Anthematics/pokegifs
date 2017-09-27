class PokemonController < ApplicationController
	def show
		respoke = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
		pokebody = JSON.parse(respoke.body)

		resgif = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{params[:name]}&rating=g")
		gifbody = JSON.parse(resgif.body)


		gif_url = gifbody["data"][0]["url"]
		id = pokebody ["id"]
		name = pokebody["name"]
		types = pokebody["types"]

		render json: {name: name , types: [types] , id: [id]}
	end
end
