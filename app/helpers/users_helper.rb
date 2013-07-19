module UsersHelper
  def generate_csv(users, options = {})
    CSV.generate(options) do |csv|
      csv << ["id", "username"] # Users.column_names
      users.each do |user|
        csv << [user.id, user.username] # user.attributes.values_at(*Users.column_names)
      end
    end
  end
end
