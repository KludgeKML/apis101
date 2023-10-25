class UserSerializer
  extend HALPresenter
  model User

  attribute :id
  attribute :name
  collection of: 'users' do
    attribute(:number_of_users) { resources.count }
    link :self do
      format "/api/v2/users/"
    end    
  end

  link :self do
  	"/api/v2/users/#{resource.id}"
  end

  link :groups do
  	"/api/v2/users/#{resource.id}/groups"
  end

  link :roles do
  	"/api/v2/users/#{resource.id}/roles"
  end
end
