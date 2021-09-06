module TasksHelper
    def task_form_helper(bucket)
    bucket ? bucket_tasks_path : tasks_path
    end 
end