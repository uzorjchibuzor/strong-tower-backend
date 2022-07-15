
RSpec.describe Appointment, :type => :model do
  describe "object creation by the appointment model" do
    context "with valid attributes" do 
      let(:user) {create(:user)}
      let(:doctor) {create(:doctor)}
      let(:appointment) {create(:appointment, user: user, doctor: doctor)}
      it "creates a valid appointment" do
        expect(appointment).to be_valid
        expect(Appointment.count).to eq(1)
      end
    end

    context "with invalid attributes" do 
      let(:appointment) {build(:appointment, doctor: nil)}
      it "does not create a valid appointment" do
        expect(appointment).to be_invalid
        expect(appointment.errors.messages[:doctor]).to  eq(["must exist"])
        expect(Appointment.count).to eq(0)
      end
    end
  end
end