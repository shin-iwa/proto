class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def previous
  #   Article.novel.where("id < ?", self.id).order("id DESC").first
  # end

  # def next
  #   Article.novel.where("id > ?", self.id).order("id ASC").first
  # end

  # def previous
  #   Article.where("id < ?", self.id).order("id DESC").first
  # end

  # def next
  #   Article.where("id > ?", self.id).order("id ASC").first
  # end

end
