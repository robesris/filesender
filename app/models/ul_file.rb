class UlFile < ActiveRecord::Base
  has_attached_file :attachment,
                    :url => "/system/:attachment/:md5/:id/:basename.:extension",
                    :path => ":rails_root/public/system/:attachment/:md5/:id/:basename.:extension"
end
