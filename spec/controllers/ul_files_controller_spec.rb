require 'spec_helper'

describe UlFilesController do

  def mock_ul_file(stubs={})
    @mock_ul_file ||= mock_model(UlFile, stubs)
  end

  describe "GET index" do
    it "assigns all ul_files as @ul_files" do
      UlFile.stub(:find).with(:all).and_return([mock_ul_file])
      get :index
      assigns[:ul_files].should == [mock_ul_file]
    end
  end

  describe "GET show" do
    it "assigns the requested ul_file as @ul_file" do
      UlFile.stub(:find).with("37").and_return(mock_ul_file)
      get :show, :id => "37"
      assigns[:ul_file].should equal(mock_ul_file)
    end
  end

  describe "GET new" do
    it "assigns a new ul_file as @ul_file" do
      UlFile.stub(:new).and_return(mock_ul_file)
      get :new
      assigns[:ul_file].should equal(mock_ul_file)
    end
  end

  describe "GET edit" do
    it "assigns the requested ul_file as @ul_file" do
      UlFile.stub(:find).with("37").and_return(mock_ul_file)
      get :edit, :id => "37"
      assigns[:ul_file].should equal(mock_ul_file)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ul_file as @ul_file" do
        UlFile.stub(:new).with({'these' => 'params'}).and_return(mock_ul_file(:save => true))
        post :create, :ul_file => {:these => 'params'}
        assigns[:ul_file].should equal(mock_ul_file)
      end

      it "redirects to the created ul_file" do
        UlFile.stub(:new).and_return(mock_ul_file(:save => true))
        post :create, :ul_file => {}
        response.should redirect_to(ul_file_url(mock_ul_file))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ul_file as @ul_file" do
        UlFile.stub(:new).with({'these' => 'params'}).and_return(mock_ul_file(:save => false))
        post :create, :ul_file => {:these => 'params'}
        assigns[:ul_file].should equal(mock_ul_file)
      end

      it "re-renders the 'new' template" do
        UlFile.stub(:new).and_return(mock_ul_file(:save => false))
        post :create, :ul_file => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ul_file" do
        UlFile.should_receive(:find).with("37").and_return(mock_ul_file)
        mock_ul_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ul_file => {:these => 'params'}
      end

      it "assigns the requested ul_file as @ul_file" do
        UlFile.stub(:find).and_return(mock_ul_file(:update_attributes => true))
        put :update, :id => "1"
        assigns[:ul_file].should equal(mock_ul_file)
      end

      it "redirects to the ul_file" do
        UlFile.stub(:find).and_return(mock_ul_file(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(ul_file_url(mock_ul_file))
      end
    end

    describe "with invalid params" do
      it "updates the requested ul_file" do
        UlFile.should_receive(:find).with("37").and_return(mock_ul_file)
        mock_ul_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ul_file => {:these => 'params'}
      end

      it "assigns the ul_file as @ul_file" do
        UlFile.stub(:find).and_return(mock_ul_file(:update_attributes => false))
        put :update, :id => "1"
        assigns[:ul_file].should equal(mock_ul_file)
      end

      it "re-renders the 'edit' template" do
        UlFile.stub(:find).and_return(mock_ul_file(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ul_file" do
      UlFile.should_receive(:find).with("37").and_return(mock_ul_file)
      mock_ul_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ul_files list" do
      UlFile.stub(:find).and_return(mock_ul_file(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ul_files_url)
    end
  end

end
