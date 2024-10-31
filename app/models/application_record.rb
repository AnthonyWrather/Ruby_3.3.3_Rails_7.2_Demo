class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(auth_object = nil)
    [ "body", "title", "user_email", "user_name" ]
    super
  end

  private_class_method :ransackable_attributes
end
