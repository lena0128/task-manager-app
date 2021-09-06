class TasksController < ApplicationController
    before_action :set_task, except: [:index, :new, :create]

    def index
        @tasks_not_start = Task.tasks_not_start
        @tasks_in_progress = Task.tasks_in_progress
        @tasks_completed = Task.tasks_completed
        @tasks = Task.all
    end

    def new
        @task = Task.new
        @buckets = Bucket.all
    end

    def create
        @task = Task.new(task_params)
        @task.user = current_user
        if @task.save
            flash[:message] = "New task has been successfully created!"
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def show
        @task = Task.find_by(id: [params[:id]])
    end

    def edit
    end

    def update
        if @task.update(task_params)
            flash[:message] = "Task successfully updated!"
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def destroy
        @task.delete
        flash[:message] = "Task successfully deleted!"
        redirect_to tasks_path
    end

    private
      def task_params
        params.require(:task).permit(
            :name,
            :description,
            :status,
            :bucket_id
        )
      end

      def set_task
        @task = Task.find_by(id: [params[:id]])
      end
    
end