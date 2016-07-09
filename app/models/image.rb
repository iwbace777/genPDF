class Image < ActiveRecord::Base
  default_scope { order(id: 'ASC') }
end
