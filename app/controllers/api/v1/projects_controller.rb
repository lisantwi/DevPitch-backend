class Api::V1::ProjectsController < ApplicationController
    def create
        @project = @user.projects.create(project_params)
        params[:selected].each do  |language| 
          @language = Language.find_by(name: language)
          ProjectLanguage.create(language_id:@language.id, project_id: @project.id)
        end
        render json: @project.to_json(project_serializer_options)
      end

      def add_img
        @project = Project.find(params[:project_id])
        @project.images.create(src: params[:src])
        render json: @project.to_json(project_serializer_options)
      end

      def add_task
        @project = Project.find(params[:project_id])
        @project.tasks.create(name: params[:name], due_date: params[:due_date], priority: params[:priority])
        render json: @project.to_json(project_serializer_options)
      end

      def index
        @projects = @user.projects 
        render json: @projects.to_json(project_serializer_options)
      end

      def update
        @project = Project.find(params[:project_id])
        @project.update(project_params)
        @project.languages.destroy_all
        if params[:languages]
          params[:languages].each do  |language| 
            @language = Language.find_by(name: language)
            ProjectLanguage.create(language_id:@language.id, project_id: @project.id)
          end
        end
        render json: @project.to_json(project_serializer_options)

      end



      def destroy
        @project = Project.find(params[:id])
        @project.destroy
        render json:@project
      end




  


      private

      def project_serializer_options
        {:include => {
          :images => {:except=>[:created_at, :updated_at]},
          :languages => {:except => [:created_at, :updated_at]},
          :tasks => {:except => [:created_at, :updated_at]}
        }}
      end

      def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date)
      end

   

 
 
    
end

