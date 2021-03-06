class Student < ActiveRecord::Base
  attr_accessible :name, :surname
  belongs_to :group
  has_one :fmark, :dependent => :destroy
  has_many :presences, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :marks, :dependent => :destroy


  validates :name, presence: true
  validates :surname, presence: true

  def self.create_from_text(txt)
    txts=[]
    self.transaction do
      txts = txt.split("\r\n").select(&:present?).map do |human|
        name, surname = human.split(' ')
        new(name: name, surname: surname).save
      end
    end
    [txts.count(true), txts.count(false)]
  end


  def owner
    return self.group.subject.user_id
  end


end


