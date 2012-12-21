class Student < ActiveRecord::Base
  attr_accessible :name, :surname
  belongs_to :group
  has_many :presences, :dependent => :destroy

  validates :name, presence: true
  validates :surname, presence: true
  
  def self.create_from_text(txt)
    txt = txt.split("\r\n").reject(&:blank?)
    n=0
    self.transaction do
      txt.map! do |human|
        human = human.split(" ")
        student = new(name: human[0] , surname: human[1])
        if student.save 
	n+=1
	end
     end
    end
    [txt.length,n]
  end

end
