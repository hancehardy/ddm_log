class JobsController < ApplicationController

    def index
       @jobs = Job.all.order('created_at ASC') 
    end

    def new
    end

    def create
        @job = Job.new(job_params)
        @job.save

        redirect_to @job
    end

    def show
        @job =Job.find(params[:id])
    end

    private

        def job_params
            params.require(:job).permit(:name, :contract_amount, :contract_date, :status)
        end



end
