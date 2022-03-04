class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles

    def total_salary
      self.roles.sum(:salary)
    end

    def blockbusters
      self.movies.filter{|movie| movie.box_office_earning > 505555}
      # self.movies.where("box_office_earning>?", 50000)
    end

    def self.most_successful
      self.all.max_by{ |actor| actor.total_salary}

      # highest_paid = Actor.first

      # self.all.each do |actor|
      #   if actor.total_salary > highest_paid.total_salary 
      #     highest_paid = actor
      #   end
      # end

      # highest_paid
    end
end