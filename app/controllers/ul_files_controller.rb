class UlFilesController < ApplicationController
  # GET /ul_files
  # GET /ul_files.xml
  def index
    @ul_files = UlFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ul_files }
    end
  end

  # GET /ul_files/1
  # GET /ul_files/1.xml
  def show
    @ul_file = UlFile.find(params[:id])
    @host_with_port = request.host_with_port

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ul_file }
    end
  end

  # GET /ul_files/new
  # GET /ul_files/new.xml
  def new
    @ul_file = UlFile.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ul_file }
    end
  end

  # GET /ul_files/1/edit
  def edit
    @ul_file = UlFile.find(params[:id])
  end

  # POST /ul_files
  # POST /ul_files.xml
  def create
    host_with_port = request.host_with_port
    @ul_file = UlFile.new(params[:ul_file])

    respond_to do |format|
      if @ul_file.save
        flash[:notice] = 'UlFile was successfully created.'
        format.html { redirect_to(@ul_file) }
        format.xml  { render :xml => @ul_file, :status => :created, :location => @ul_file }
        FileMailer.deliver_file_notification(
          :sender     => @ul_file.sender_name,
          :from       => "FileSender <filesender@notarealdomain.com>",
          :recipients => @ul_file.recipient_email,
          :filename   => @ul_file.attachment_file_name,
          :url        => @ul_file.attachment.url,
          :host_with_port => host_with_port
        )
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ul_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ul_files/1
  # PUT /ul_files/1.xml
  def update
    @ul_file = UlFile.find(params[:id])

    respond_to do |format|
      if @ul_file.update_attributes(params[:ul_file])
        flash[:notice] = 'UlFile was successfully updated.'
        format.html { redirect_to(@ul_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ul_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ul_files/1
  # DELETE /ul_files/1.xml
  def destroy
    @ul_file = UlFile.find(params[:id])
    @ul_file.destroy

    respond_to do |format|
      format.html { redirect_to(ul_files_url) }
      format.xml  { head :ok }
    end
  end
end
