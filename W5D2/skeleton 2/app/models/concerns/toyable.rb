module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end


  def receive_toy(name)
    new_toy = self.find_or_create_by(name: name)
    self.toy.new_toy
  end
end