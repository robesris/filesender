require 'spec_helper'

describe "/ul_files/edit.html.erb" do
  include UlFilesHelper

  before(:each) do
    assigns[:ul_file] = @ul_file = stub_model(UlFile,
      :new_record? => false,
      :sender_name => "value for sender_name",
      :recipient_email => "value for recipient_email",
      :filename => "value for filename"
    )
  end

  it "renders the edit ul_file form" do
    render

    response.should have_tag("form[action=#{ul_file_path(@ul_file)}][method=post]") do
      with_tag('input#ul_file_sender_name[name=?]', "ul_file[sender_name]")
      with_tag('input#ul_file_recipient_email[name=?]', "ul_file[recipient_email]")
      with_tag('input#ul_file_filename[name=?]', "ul_file[filename]")
    end
  end
end
