require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:post) { create :post, user: user }
  
  before {  sign_in user }

  describe '#destroy' do
    let!(:comment) { create :comment, user: user, post: post }
    let(:params) { { id: comment, post_id: post, user_id: user } }

    subject { process :destroy, method: :delete, params: params }
    
    it 'destroy post' do
      expect { subject }.to change { Comment.count }.by(-1)
      is_expected.to redirect_to(user_post_path(assigns(:user), assigns(:post)))
    end
  end
end

DatabaseCleaner.clean