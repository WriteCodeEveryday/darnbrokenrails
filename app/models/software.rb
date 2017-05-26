class Software < ApplicationRecord
  attr_protected :price
  # XXX This model violates the "Attribute Restriction" portion of Brakeman.
  # This model implements the "attr_protected" that has been found to be faulty in past Rails versions.
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/attribute_restriction/
end
