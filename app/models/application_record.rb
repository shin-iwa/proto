class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def previous
  #   Novel.where("id < ?", self.id).order("id DESC").first
  # end

  # def next
  #   Novel.where("id > ?", self.id).order("id ASC").first
  # end

  # def previous
  #   Article.where("id < ?", self.id).order("id DESC").first
  # end

  # def next
  #   Article.where("id > ?", self.id).order("id ASC").first
  # end

end
