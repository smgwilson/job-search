class AgenciesController < ApplicationController

  # Crud actions index, show, new, create, edit, update, destroy

  def index
    @agencies = Agency.all
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(agency_params)

     if @agency.save
       flash[:success]='Agency created successfully'
       redirect_to agency_path
     else
       render :new
     end
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def update
    @agency = Agency.find(params[:id])

    if @agency.update(agency_params)
      flash[:success]='Agency updated successfully'
      redirect_to agency_path(@agency)
    else
      render :edit
    end
  end

  def destroy
    @agency = Agency.find(params[:id])
    if @agency.destroy
      flash[:success]='Agency deleted'
    end
  end

private

  def agency_params
    params.require(:agency).permit(:agency_name)
  end

end
