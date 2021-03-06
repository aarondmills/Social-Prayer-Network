class PrayersController < ApplicationController
	layout "prayers"
  load_and_authorize_resource

  def index

    @prayers = Prayer.paginate :page => params[:page], :per_page => 10, :order => 'created_at DESC'
		@categories = Category.all


  end

  def show
    @prayer = Prayer.find(params[:id])
		@categories = Category.all

  
  end

  def new
    @prayer = Prayer.new
		@categories = Category.all

  end

  def edit
    @prayer = Prayer.find(params[:id])
		@categories = Category.all
  end


  def create
    @prayer  = current_user.prayers.build(params[:prayer])
    


      if @prayer.save
        
	redirect_to :controller => 'resources', :catid => @prayer.category_id
	@mycategory = @prayer.category
	
	PrayerMailer.prayer_confirmation(@prayer, @mycategory, current_user).deliver

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

  def delete
    @prayer = Prayer.find(params[:id])
    @prayer.destroy

    redirect_to(prayers_url, :notice => "Your prayer request has been removed.")

  end
  def destroy
    @prayer = Prayer.find(params[:id])
    @prayer.destroy

    redirect_to(prayers_url, :notice => "Your prayer request has been removed.")

  end
end
