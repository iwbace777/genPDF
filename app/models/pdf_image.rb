class PdfImage < ActiveRecord::Base
  default_scope { order(id: 'ASC') }

  belongs_to :image
end
