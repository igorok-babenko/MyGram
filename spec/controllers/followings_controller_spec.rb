require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe FollowingsController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  before {  sign_in user }

  describe '#index' do
    subject { get :index, params: params }

    it 'have not followings' do
      subject
      expect(assigns(:followings)).to eq([])
    end

    it { is_expected.to render_template('index') }
  end
end

DatabaseCleaner.clean