require 'spec_helper'

describe "/ul_files/new.html.erb" do
  include UlFilesHelper

  before(:each) do
    assigns[:ul_file] = stub_model(UlFile,
      :new_record? => true,
      :sender_name => "value for sender_name",
      :recipient_email => "value for recipient_email",
      :filename => "value for filename"
    )
  end

  it "renders new ul_file form" do
    render

    response.should have_tag("form[action=?][method=post]", ul_files_path) do
      with_tag("input#ul_file_sender_name[name=?]", "ul_file[sender_name]")
      with_tag("input#ul_file_recipient_email[name=?]", "ul_file[recipient_email]")
      with_tag("input#ul_file_filename[name=?]", "ul_file[filename]")
    end
  end
end
