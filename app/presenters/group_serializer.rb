class UserSerializer
  extend HALPresenter
  model Group

  attribute :id
  attribute :name
  collection of: 'groups' do
    attribute(:number_of_groups) { resources.count }
    link :self do
      format "/api/v2/groups/"
    end    
  end

  link :self do
  	"/api/v2/groups/#{resource.id}"
  end

  link :users do
  	"/api/v2/groups/#{resource.id}/users"
  end
end
