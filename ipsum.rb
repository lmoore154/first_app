class Ipsum < ActiveRecord::Base

  validates :name, presence: true

  def to_json
    { id: idea, name: name, paragraph: paragraph }
  end

end
