class Api::V1::ImagesController < ApplicationController
    
    def destroy
        @image = Image.find(params[:id])
        @image.destroy
        @project = Project.find(@image.project_id)
        render json: @project.to_json(project_serializer_options)
    end

    private

    def project_serializer_options
      {:include => {
        :images => {:except=>[:created_at, :updated_at]},
        :languages => {:except => [:created_at, :updated_at]},
        :tasks => {:except => [:created_at, :updated_at]}
      }}
    end

end
