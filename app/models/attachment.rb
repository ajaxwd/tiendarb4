class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :archivo, attachment_presence: true
  has_attachment_file :archivo

  do_not_validate_attachment_file_type :archivo
end
