class Subject < ActiveRecord::Base
  attr_accessible :subject
  belongs_to :user
  has_many :groups, :dependent => :destroy

  validates :subject, presence: true
  validates :user_id, presence: true

  def owner
    return self.user_id
  end
end
