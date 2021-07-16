require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  before {  sign_in user }

  describe '#index' do
    subject {get :index, params: params}

    let!(:post) { create :post, user: user }

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq([post])
    end

    it { is_expected.to render_template('index') }
  end

  describe '#show' do
    let(:params) { { user_id: user.id, id: post } }
    subject { get :show, params: params }

    let!(:post) { create :post, user: user }

    it 'assings @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { is_expected.to render_template(:show) }

    context 'when user tries to see someone elses post' do
      let!(:post) { create :post }
      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end