class Api::V1::ProjectsController < ApplicationController
    def create
        @project = @user.projects.create(project_params)
        params[:selected].each{|language| @project.languages.create(name: language) }
        render json: @project.to_json(project_serializer_options)
      end

      def add_img
        @project = Project.find(params[:project_id])
        @project.images.create(src: params[:src])
        render json: @project.to_json(project_serializer_options)
      end

      def index
        @projects = @user.projects 
        render json: @projects.to_json(project_serializer_options)
      end

  


      private

      def project_serializer_options
        {:include => {
          :images => {:except=>[:created_at, :updated_at]},
          :languages => {:except => [:created_at, :updated_at]}
        }}
      end

      def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date)
      end
    

 
 
    
end

