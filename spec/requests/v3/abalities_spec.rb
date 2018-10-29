require 'rails_helper'

RSpec.describe 'V3::Abalities', type: :request do
  let!(:user) { create_list(:login, 3) }
  let!(:set) { create(:tour_set, admins: [User.first]) }
  

  describe 'with no auth' do
    context 'Create tours in tenant' do
      before { Apartment::Tenant.switch! set.subdir }
      before { create_list(:tour, 5) }
      before { Tour.first.authors << User.second }
      before { Tour.second.authors << User.last }
      before { Tour.last.update_attribute(:published, true) }
      before { get "/#{Apartment::Tenant.current}/tours", headers: { Authorization: "Bearer #{User.last.login.oauth2_token}" } }
      it 'works' do
        expect(json.size).to eq(Tour.count)
      end
    end
  end
end
