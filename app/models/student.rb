class Student < ActiveRecord::Base
  attr_accessible :name
  belongs_to :group
  
  def self.create_from_text(txt)
    txt = txt.split("\n").reject(&:blank?)
 
    self.transaction do
      txt.map! do |o|
        student = new(name: o)
        student.save.tap { |saved| saved || (raise ActiveRecord::Rollback) }
     end
    end
    txt.all? ? txt.length : nil
  end

end
