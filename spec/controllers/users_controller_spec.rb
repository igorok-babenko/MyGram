require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe '#index' do
    subject {get :index}

    it 'assigns @users' do
      subject
      expect(assigns(:users)).to eq([user])
    end

    it { is_expected.to render_template('index') }
  end
  
  describe '#show' do
    let(:params) { { id: user } }
    subject { get :show, params: params }

    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    it { is_expected.to render_template(:show) }
  end
end

DatabaseCleaner.clean