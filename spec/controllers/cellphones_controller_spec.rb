require 'spec_helper'

describe CellphonesController do

  def mock_cellphone(stubs={})
    (@mock_cellphone ||= mock_model(Cellphone).as_null_object).tap do |cellphone|
      cellphone.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all cellphones as @cellphones" do
      Cellphone.stub(:all) { [mock_cellphone] }
      get :index
      assigns(:cellphones).should eq([mock_cellphone])
    end
  end

  describe "GET show" do
    it "assigns the requested cellphone as @cellphone" do
      Cellphone.stub(:find).with("37") { mock_cellphone }
      get :show, :id => "37"
      assigns(:cellphone).should be(mock_cellphone)
    end
  end

  describe "GET new" do
    it "assigns a new cellphone as @cellphone" do
      Cellphone.stub(:new) { mock_cellphone }
      get :new
      assigns(:cellphone).should be(mock_cellphone)
    end
  end

  describe "GET edit" do
    it "assigns the requested cellphone as @cellphone" do
      Cellphone.stub(:find).with("37") { mock_cellphone }
      get :edit, :id => "37"
      assigns(:cellphone).should be(mock_cellphone)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cellphone as @cellphone" do
        Cellphone.stub(:new).with({'these' => 'params'}) { mock_cellphone(:save => true) }
        post :create, :cellphone => {'these' => 'params'}
        assigns(:cellphone).should be(mock_cellphone)
      end

      it "redirects to the created cellphone" do
        Cellphone.stub(:new) { mock_cellphone(:save => true) }
        post :create, :cellphone => {}
        response.should redirect_to(cellphone_url(mock_cellphone))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cellphone as @cellphone" do
        Cellphone.stub(:new).with({'these' => 'params'}) { mock_cellphone(:save => false) }
        post :create, :cellphone => {'these' => 'params'}
        assigns(:cellphone).should be(mock_cellphone)
      end

      it "re-renders the 'new' template" do
        Cellphone.stub(:new) { mock_cellphone(:save => false) }
        post :create, :cellphone => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cellphone" do
        Cellphone.should_receive(:find).with("37") { mock_cellphone }
        mock_cellphone.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cellphone => {'these' => 'params'}
      end

      it "assigns the requested cellphone as @cellphone" do
        Cellphone.stub(:find) { mock_cellphone(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cellphone).should be(mock_cellphone)
      end

      it "redirects to the cellphone" do
        Cellphone.stub(:find) { mock_cellphone(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cellphone_url(mock_cellphone))
      end
    end

    describe "with invalid params" do
      it "assigns the cellphone as @cellphone" do
        Cellphone.stub(:find) { mock_cellphone(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cellphone).should be(mock_cellphone)
      end

      it "re-renders the 'edit' template" do
        Cellphone.stub(:find) { mock_cellphone(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cellphone" do
      Cellphone.should_receive(:find).with("37") { mock_cellphone }
      mock_cellphone.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cellphones list" do
      Cellphone.stub(:find) { mock_cellphone }
      delete :destroy, :id => "1"
      response.should redirect_to(cellphones_url)
    end
  end

end
