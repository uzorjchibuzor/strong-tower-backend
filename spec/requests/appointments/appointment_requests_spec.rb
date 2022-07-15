
describe 'POST /new_appointment' do
  let(:user) { create(:user) }
    let(:doctor) { create(:doctor) }
    let(:appt_time) { Faker::Time.forward(days: 5, period: :morning).strftime("%d/%m/%Y %H:%M") }
  scenario 'valid appointment attributes' do
    post '/new_appointment', params: {
      appointment: {
        user_id: user.id,
        doctor_id: doctor.id,
        date: appt_time
      }
    }

    returned_object = JSON.parse(response.body)
    
    expect(response.status).to eq(200)
    expect(returned_object['doctor_id']).to eq(doctor.id)
    expect(returned_object['user_id']).to eq(user.id)
    expect(Appointment.count).to eq(1)
    expect(Appointment.last.date).to eq(appt_time)

  end

  scenario 'invalid appointment attributes' do
    post '/new_appointment', params: {
      appointment: {
        user_id: user.id,
        date: appt_time
      }
    }

    returned_object = JSON.parse(response.body)
    expect(response.status).to eq(422)  
    expect(returned_object).to eq({"doctor"=>["must exist"]})
  end
end