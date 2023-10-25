class Mutations::CreateUser < Mutations::BaseMutation
  null true
  argument :body, String

  field :user, Types::UserType
  field :errors, [String], null: false

  def resolve(body:)
     user = User.build(body:)
     if user.save
     	{
     		user: user,
     		errors: [],
     	}
     else
     	{
	     	user: nil,
     		errors: user.errors.full_message,
     	}
 	 end
  end
end
