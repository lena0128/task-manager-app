class BucketsController < ApplicationController
    before_action :set_bucket, only: [:show, :edit, :update, :destroy]

    def index
        @buckets = Bucket.all
    end

    def new
        @bucket = Bucket.new
    end

    def show
        #@bucket = Bucket.find_by(id: params[:id])
    end

    def edit
        #@bucket = Bucket.find_by(id: params[:id])
    end

    def create
        @bucket = Bucket.new(bucket_params)
        if @bucket.save
            redirect_to bucket_path(@bucket)
        else
            #@errors = @bucket.errors.full_messages
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
            :quantity
        )
      end

      def set_bucket
        @bucket = Bucket.find_by(id: params[:id])
      end

end