require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
    connection = PG.connect dbname: "chitter_test"
    user = User.create(name: "Alexander Hamilton", email: "a.ham@email.com", password: "work")
    expect(user.name).to eq "Alexander Hamilton"
    end
  end 
end