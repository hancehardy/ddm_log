class JobsController < ApplicationController

    def index
       @jobs = Job.all.order('created_at ASC') 
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to @job
        else
            render 'new'
        end
    end

    def show
        @job =Job.find(params[:id])
    end

    def edit
        @job = Job.find(params[:id])
    end

    def update
        @job = Job.find(params[:id])

		if @job.update(params[:job].permit(:name, :contract_amount, :contract_date, :status))
			redirect_to @job
		else
			render 'edit'
		end
    end
    
    def destroy
        @job = Job.find(params[:id])
        @job.destroy        
        redirect_to root_path
    end



    private

        def job_params
            params.require(:job).permit(:name, :contract_amount, :contract_date, :status)
        end



end
