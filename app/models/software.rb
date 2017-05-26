class Software < ApplicationRecord
  attr_protected :price
  # XXX This model violates the "Attribute Restriction" portion of Brakeman.
  # This model implements the "attr_protected" that has been found to be faulty in past Rails versions.
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/attribute_restriction/
  
  validates_format_of :name, :with => /\w*- Daily\b/
  # XXX This model violates the "Format Validation" portion of Brakeman.
  # This model implements the "validates_format_of" without regex line endings.
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/format_validation/
  
  def is_cloud?
    self.cloud
  end
  
  def get_link
    if self.is_cloud?
      self.login_link
    else
      nil
    end
  end
end
