class UserManager
  def self.first_or_create_by(attrs)
    user = User.where(attrs).first_or_initialize
    return user if user.persisted?
    league_name = "#{user.first_name}'s default league"

    yield user if block_given?

    User.transaction do
      league = League.create!(name: league_name)
      user.save!
      user.drafters.create!(league_id: league.id)
    end
    user
  end
end
