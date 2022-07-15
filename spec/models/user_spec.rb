
RSpec.describe User, :type => :model do
  describe "object creation by the user model" do
    context "with valid attributes" do 
      let(:user) {create(:user)}
      it "creates a valid user" do
        expect(user).to be_valid
        expect(User.count).to eq(1)
      end
    end

    context "with invalid attributes" do 
      let(:user) {build(:user, email: "123hfjd")}
      it "does not create a valid user" do
        expect(user).to be_invalid
        expect(user.errors.messages[:email]).to  eq(["is invalid"])
        expect(User.count).to eq(0)
      end
    end
  end
end