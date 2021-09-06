class BucketsController < ApplicationController
    before_action :set_bucket, only: [:show, :edit, :update, :destroy]
    before_action :require_login

    def index
        @empty_buckets = Bucket.buckets_empty
        @pending_buckets = Bucket.buckets_pending
        @completed_buckets = Bucket.buckets_completed
        @buckets = Bucket.all
    end

    def new
        @bucket = Bucket.new
        @bucket.tasks.build(user: current_user)
        @tasks = @bucket.tasks.select { |t| t.user_id == current_user.id }
    end

    def show
        #@bucket = Bucket.find_by(id: params[:id])
    end

    def edit
        #@bucket = Bucket.find_by(id: params[:id])
    end

    def create
        @bucket = Bucket.new(bucket_params)
        @bucket.tasks.each { |t|t.user_id = current_user.id }
        if @bucket.save
            flash[:message] = "New bucket successfully created!"
            redirect_to bucket_path(@bucket)
        else
            #@errors = @bucket.errors.full_messages
            @bucket.tasks.select { |t|t.user_id == current_user.id }
            render :new
        end
    end

    def update
        #@bucket = Bucket.find_by(id: params[:id])
        if @bucket.update(bucket_params)
            redirect_to bucket_path(@bucket)
        else
           #@errors = @bucket.errors.full_messages
           render :edit
        end
    end

    def destroy
        #@bucket = Bucket.find_by(id: params[:id])
        @bucket.delete
        redirect_to buckets_path
    end

    private
      def bucket_params
        params.require(:bucket).permit(
            :name,
            :description,
            :status,
            :quantity,
            tasks_attributes: [:name, :description, :status, :user_id, :id] 
        )
      end

      def set_bucket
        @bucket = Bucket.find_by(id: params[:id])
      end

end