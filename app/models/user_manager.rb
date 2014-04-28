class UserManager
  def self.create(attrs = {})
    user = User.create(attrs)
    user.drafters.create! if user.persisted?
    user
  end

  def self.first_or_create_by(attrs)
    user = User.where(attrs).first
    if user
      return user
    else
      user = User.new(attrs)
      yield user if block_given?
      user.save
      user.drafters.create! if user.persisted?
      user
    end
  end
end
