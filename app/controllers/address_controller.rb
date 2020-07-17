class AddressController < ApplicationController
    def info
        # address_query = params[:query]
        
        # response = CIVIC.representative_info_by_address(address: address_query, levels: "country", fields: "divisions,normalized_input")
        
        # normy = response.normalized_input
        # norm_address = "#{normy.line1}  #{normy.city}, #{normy.state} #{normy.zip}"
    
        state = State.all.sample
        district = state.districts.sample

        # state = State.find_by(abbreviation: normy.state)
        # cd_key = response.divisions.keys.select{|k| k.split("/").find {|e| /cd:/ =~ e}}.first
        # cd = cd_key.split("cd:").last
        # district = District.find_by(state_id: state.id, number: cd)
        
        if district #no district without state, so just check distrit
          reps = district.reps  #add .fields to save query time?
        #   if state.senate_vote #boolean, essentially for .senators?  
        #     senators = state.senators.includes(:twitter_accounts)  #add .fields to save query time?
        #   end
    
          # location_info = {normalized_address: norm_address, when_is_primary: state.when_is_primary?, state: state.name, district: district.full_name}
          
          options = {include: %i[twitter_accounts twitter_accounts.tweets]}
          
          render json: {
                      reps: PoliticianSerializer.new(reps, options),
                    #   senators: PoliticianSerializer.new(senators),
                      # address_info: location_info,
                      cook_index:  district.cook_index,
                      # restore_json: norm_address
                    }
        else
          render json: {alert: "Unable to find a district from this address"}
        end
      end
end
