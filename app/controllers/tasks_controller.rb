class TasksController < ApplicationController
    before_action :set_task, except: [:index, :new, :create]
    before_action :require_login

    def index
        @tasks_not_start = Task.tasks_not_start
        @tasks_in_progress = Task.tasks_in_progress
        @tasks_completed = Task.tasks_completed
        @tasks = Task.all
    end

    def new
        if params[:bucket_id]
            @bucket = Bucket.find_by(id: params[:bucket_id])
            @task = @bucket.tasks.build(user: current_user)
            @buckets = Bucket.all
        else
            @task = Task.new
            @buckets = Bucket.all
        end
    end

    def create
           @task = Task.new(task_params)
           @task.user_id = current_user.id
             if params[:bucket_id]
                @task.bucket_id = params[:bucket_id]
                @bucket = Bucket.find_by(id: params[:bucket_id])
             end  

             if @task.save
                  flash[:message] = "New task has been successfully created!"
             end

               if params[:bucket_id]
                  @bucket = Bucket.find_by(id: params[:bucket_id])  
                  redirect_to bucket_task_path(@bucket, @task)
               elsif params[:id]
                  redirect_to task_path(@task)
              else
                render :new
        end
    end

    def show
        if params[:bucket_id]
            @bucket = Bucket.find_by(id: params[:bucket_id])
            @task = Task.find_by(id: [params[:id]])
            @user = current_user
        else
            @task = Task.find_by(id: [params[:id]])
            @user = current_user
        end
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
            :bucket_id, 
            :user_id
        )
      end

      def set_task
        @task = Task.find_by(id: [params[:id]])
      end
    
end