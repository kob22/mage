class Subject < ActiveRecord::Base
  attr_accessible :subject

  has_many :groups, :dependent => :destroy

  validates :subject, presence: true

end
