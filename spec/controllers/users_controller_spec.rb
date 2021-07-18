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

  describe '#edit' do
    let(:params) { { id: user } }

    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns server policy' do
      subject
      expect(assigns :user).to eq user
    end
  end

  describe '#update' do
    let(:params) { { id: user, user: { name: 'changed name' } } }

    subject { process :update, method: :put, params: params }

    it { is_expected.to redirect_to(user_path(assigns(:user))) }

    it 'updates user profile' do
      expect { subject }.to change { user.reload.name }.to('changed name')
    end

    context 'with bad name' do
      let(:params) { { id: user, user: { name: '' } } }

      it 'does not update user profile' do
        expect { subject }.not_to change { user.reload.name }
      end
    end

    context 'with bad bio' do
      let(:params) { { id: user, user: { bio: '' } } }

      it 'does not update user profile' do
        expect { subject }.not_to change { user.reload.bio }
      end
    end
  end

  describe '#destroy' do
    let!(:user) { create :user }
    let(:params) { { id: user } }

    subject { process :destroy, method: :delete, params: params }
  
    it 'destroy user' do
      expect { subject }.to change { User.count }.by(-1)
    end
  end
end

DatabaseCleaner.clean