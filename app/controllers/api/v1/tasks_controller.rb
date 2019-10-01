class Api::V1::TasksController < ApplicationController
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        json_string = {'message' => 'Your task has been deleted'}.to_json
        render json: {message: json_string, task: @task}
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        @project = Project.find(@task.project_id)
        render json: @project.to_json(project_serializer_options)
    end

    private

    def task_params
        params.require(:task).permit(:name, :priotity, :due_date, :is_complete)
    end

    def project_serializer_options
        {:include => {
          :images => {:except=>[:created_at, :updated_at]},
          :languages => {:except => [:created_at, :updated_at]},
          :tasks => {:except => [:created_at, :updated_at]}
        }}
      end

end
