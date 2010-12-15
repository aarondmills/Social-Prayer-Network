require 'spec_helper'

describe PrayersController do

  def mock_prayer(stubs={})
    (@mock_prayer ||= mock_model(Prayer).as_null_object).tap do |prayer|
      prayer.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all prayers as @prayers" do
      Prayer.stub(:all) { [mock_prayer] }
      get :index
      assigns(:prayers).should eq([mock_prayer])
    end
  end

  describe "GET show" do
    it "assigns the requested prayer as @prayer" do
      Prayer.stub(:find).with("37") { mock_prayer }
      get :show, :id => "37"
      assigns(:prayer).should be(mock_prayer)
    end
  end

  describe "GET new" do
    it "assigns a new prayer as @prayer" do
      Prayer.stub(:new) { mock_prayer }
      get :new
      assigns(:prayer).should be(mock_prayer)
    end
  end

  describe "GET edit" do
    it "assigns the requested prayer as @prayer" do
      Prayer.stub(:find).with("37") { mock_prayer }
      get :edit, :id => "37"
      assigns(:prayer).should be(mock_prayer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created prayer as @prayer" do
        Prayer.stub(:new).with({'these' => 'params'}) { mock_prayer(:save => true) }
        post :create, :prayer => {'these' => 'params'}
        assigns(:prayer).should be(mock_prayer)
      end

      it "redirects to the created prayer" do
        Prayer.stub(:new) { mock_prayer(:save => true) }
        post :create, :prayer => {}
        response.should redirect_to(prayer_url(mock_prayer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved prayer as @prayer" do
        Prayer.stub(:new).with({'these' => 'params'}) { mock_prayer(:save => false) }
        post :create, :prayer => {'these' => 'params'}
        assigns(:prayer).should be(mock_prayer)
      end

      it "re-renders the 'new' template" do
        Prayer.stub(:new) { mock_prayer(:save => false) }
        post :create, :prayer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested prayer" do
        Prayer.should_receive(:find).with("37") { mock_prayer }
        mock_prayer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :prayer => {'these' => 'params'}
      end

      it "assigns the requested prayer as @prayer" do
        Prayer.stub(:find) { mock_prayer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:prayer).should be(mock_prayer)
      end

      it "redirects to the prayer" do
        Prayer.stub(:find) { mock_prayer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(prayer_url(mock_prayer))
      end
    end

    describe "with invalid params" do
      it "assigns the prayer as @prayer" do
        Prayer.stub(:find) { mock_prayer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:prayer).should be(mock_prayer)
      end

      it "re-renders the 'edit' template" do
        Prayer.stub(:find) { mock_prayer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested prayer" do
      Prayer.should_receive(:find).with("37") { mock_prayer }
      mock_prayer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the prayers list" do
      Prayer.stub(:find) { mock_prayer }
      delete :destroy, :id => "1"
      response.should redirect_to(prayers_url)
    end
  end

end
