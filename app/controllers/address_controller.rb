class AddressController < ApplicationController
  def random
    district = District.find(rand(435))
    RandomQuery.create(client_ip: request.remote_ip, district: district, district_name: district.full_name)
    state = district.state
    reps = district.reps
    senators = state.senators
    location_info = {normalized_address: 'Random Address', when_is_primary: state.when_is_primary?, state: state.name, district: district.full_name}
    folder_name = state.abbreviation + '-' + district.number
          
          geo_json = JSON.parse(File.read("public/districts/#{folder_name}/shape.geojson"))

          options = {include: %i[twitter_accounts]}

          render json: {
                      reps: PoliticianSerializer.new(reps, options),
                      senators: senators.empty? ? nil : PoliticianSerializer.new(senators, options),
                      addressInfo: location_info,
                      cookIndex:  district.cook_index,
                      districtGeoJson: geo_json
                    }, status: 200
  end
  
  def info
    entered_address = params.permit(:address)[:address]
    begin
      response = $civic.representative_info_by_address(address: entered_address, levels: "country", fields: "divisions,normalized_input")
      
      normy = response.normalized_input
      norm_address = "#{normy.line1}  #{normy.city}, #{normy.state} #{normy.zip}"
      
      state = State.find_by(abbreviation: normy.state)
      
      if %w[DE VT WY MT ND AK SD].include?(normy.state)
        cd = 0
      else
        cd_key = response.divisions.keys.select{|k| k.split("/").find {|e| /cd:/ =~ e}}.first
        cd = cd_key.split("cd:").last if cd_key
      end
      
      district = District.find_by(state_id: state.id, number: cd) if state
      
      if district #no district without state, so just check distrit
        Webhit.create(client_ip: request.remote_ip, query: entered_address, normalized: norm_address, district_name: district.full_name, district: district)
        reps = district.reps  #add .fields to save query time?
            
            senators = state.senators  #add .fields to save query time?
          
      
            location_info = {normalized_address: norm_address, when_is_primary: state.when_is_primary?, state: state.name, district: district.full_name}
            folder_name = state.abbreviation + '-' + district.number
            
            geo_json = JSON.parse(File.read("public/districts/#{folder_name}/shape.geojson"))

            options = {include: %i[twitter_accounts]}

            render json: {
                        reps: PoliticianSerializer.new(reps, options),
                        senators: senators.empty? ? nil : PoliticianSerializer.new(senators, options),
                        addressInfo: location_info,
                        cookIndex:  district.cook_index,
                        districtGeoJson: geo_json
                      }, status: 200
          else
            FailedQuery.create(client_ip: request.remote_ip, query: entered_address)
            render json: {alert: "Unable to find a district from this address"}, status: 400
          end
        end
      rescue Google::Apis::ClientError
        FailedQuery.create(client_ip: request.remote_ip, query: entered_address)
        render json: {alert: "Unable to find a district from this address"}, status: 400
      end
end
