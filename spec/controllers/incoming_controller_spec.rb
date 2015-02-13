require 'rails_helper'

describe IncomingController do
  describe '#create' do
    context 'given an existing user' do
      let(:user) {User.create!(email: 'a@a.com', password: '12345678')}
      context 'given a well-formed request from that user' do
        let(:params) { {sender: user.email, subject: '#computers', 'body-plain' => 'http://bloc.io'} }
        it 'returns 200 ok' do
          post :create, params
          expect(response).to be_success
        end

        it 'creates a bookmark for that user' do
          expect{
            post :create, params
          }.to change(user.bookmarks, :count).by(1)
        end

        it 'creates a bookmark with a preview' do
          post :create, params
          expect(user.bookmarks.first.title).to_not be_nil
        end
      end
    end

    context 'given an unknown user' do
      context 'given a well-formed request from that user' do
        # possibly invert contexts to reduce duplication
      end
    end
  end
end
