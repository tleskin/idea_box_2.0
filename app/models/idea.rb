class Idea < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  enum quality: { swill: 0, plausible: 1, genius: 2 }

    def up_quality
      if swill?
        1
      elsif plausible?
        2
      else
        quality
      end
    end
end
