class BucketsController < ApplicationController

    def index
        @buckets = Bucket.all
    end

    def new
        @bucket = Bucket.new
    end

    #def show
    #    @bucket = Bucket.find_by(id: params[:id])
    #end

    def create
        @bucket = Bucket.new(bucket_params)
        if @bucket.save
            redirect_to bucket_path(@bucket)
        else
            @errors = @bucket.errors.full_messages
            render :new
        end
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

end