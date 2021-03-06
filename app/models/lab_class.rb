class LabClass < ActiveRecord::Base
  attr_accessible :date, :note, :subject
  belongs_to :group
  has_many :presences, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :marks, :dependent => :destroy


  validates :subject, presence: true
  validates :date, presence: true

  def owner
    return self.group.subject.user_id
  end
end
