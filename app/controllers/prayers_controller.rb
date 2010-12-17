class PrayersController < ApplicationController

  def index
    @prayers = Prayer.all

  end

  def show
    @prayer = Prayer.find(params[:id])

  
  end

  def new
    @prayer = Prayer.new

  end

  def edit
    @prayer = Prayer.find(params[:id])
  end


  def create
    @prayer = Prayer.new(params[:prayer])

      if @prayer.save
        redirect_to(@prayer, :notice => 'We have received your request ')
      else
        render :action => "new"
      end

  end


  def update
    @prayer = Prayer.find(params[:id])

      if @prayer.update_attributes(params[:prayer])
       redirect_to(@prayer, :notice => 'Prayer Request Updated!')
      else
       render :action => "edit"
      end

  end


  def destroy
    @prayer = Prayer.find(params[:id])
    @prayer.destroy

    redirect_to(prayers_url, :notice => "Your prayer request has been removed.")

  end
end
