class CellphonesController < ApplicationController
  # GET /cellphones
  # GET /cellphones.xml
  def index
    @cellphones = Cellphone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cellphones }
    end
  end

  # GET /cellphones/1
  # GET /cellphones/1.xml
  def show
    @cellphone = Cellphone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cellphone }
    end
  end

  # GET /cellphones/new
  # GET /cellphones/new.xml
  def new
    @cellphone = Cellphone.new
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cellphone }
    end
  end

  # GET /cellphones/1/edit
  def edit
    @cellphone = Cellphone.find(params[:id])
  end

  # POST /cellphones
  # POST /cellphones.xml
  def create
    @cellphone = Cellphone.new(params[:cellphone])

    @cellphone.token = "12345"
    @cellphone.active = "false"
    @cellphone.user_id = current_user

      if @cellphone.save
        redirect_to(@cellphone, :notice => 'Please enter your varification code')
      else
        render :action => "new"
      end
	
  end

  # PUT /cellphones/1
  # PUT /cellphones/1.xml
  def update
    @cellphone = Cellphone.find(params[:id])

    respond_to do |format|
      if @cellphone.update_attributes(params[:cellphone])
        format.html { redirect_to(@cellphone, :notice => 'Cellphone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cellphone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cellphones/1
  # DELETE /cellphones/1.xml
  def destroy
    @cellphone = Cellphone.find(params[:id])
    @cellphone.destroy

    respond_to do |format|
      format.html { redirect_to(cellphones_url) }
      format.xml  { head :ok }
    end
  end
end
