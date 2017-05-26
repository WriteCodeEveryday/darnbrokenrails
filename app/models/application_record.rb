class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # XXX This model violates the "Attribute Restriction" portion of Brakeman.
  # This model lacks the "attr_accessible" required for Rails apps doing "Mass Assignment".
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/attribute_restriction/
end
