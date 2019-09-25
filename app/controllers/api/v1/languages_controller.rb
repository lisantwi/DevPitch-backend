class Api::V1::LanguagesController < ApplicationController
    
    def index
        @languages = Language.all.map{|l| {key: l.id, value: l.name, text: l.name}}
        render json: @languages
    end

end
