class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    def cast_role(actor, character_name, salary)
      Role.create(
        movie_id: self.id, 
        actor_id: actor.id,
        character_name: character_name,
        salary: salary)
    end

    def all_credits
      self.roles.map do |role|
        role.credit
        # "#{role.character_name}: Played by #{role.actor.name}"
    end

    def fire_actor(actor_instance)
      self.roles.where(actor_id: actor_instance.id).destroy_all
      # self.roles.find_by(actor_id: actor_instance.id).destroy_all

    #   self.roles.each do |role|
    #     if role.actor_id = actor_instance.id
    #       role.delete
    #     end
    # end
  end

 


end