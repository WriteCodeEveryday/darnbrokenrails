# XXX Utilize the annotate gem to annotate your models. This basic step can save lots of money
# when taking on new personnel. You'll also get through your development even quicker.
# Source: https://rails-bestpractices.com/posts/2011/01/23/annotate-your-models/
class Purchaser < ActiveRecord::Base
  validates_presence_of :name
  has_many :softwares
end
