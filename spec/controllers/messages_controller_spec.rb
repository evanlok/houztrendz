require 'rails_helper'

RSpec.describe MessagesController do
  let(:user) { create(:user) }

  describe 'POST create' do
    let(:message_params) { attributes_for(:message).merge!(recipient_id: user.id) }

    before do
      request.env['HTTP_REFERER'] = '/'
    end

    it 'creates message and delivers email' do
      expect(MessageMailer).to receive(:message_email) { double(:mailer, deliver_now: true) }
      post :create, message: message_params
      expect(Message.count).to eq(1)
    end

    context 'as html' do
      it 'redirects to referrer' do
        post :create, message: message_params
        expect(response).to redirect_to('/')
      end

      context 'with invalid params' do
        it 'sets flash error' do
          post :create, message: { body: 'abc' }
          expect(response).to redirect_to('/')
          expect(flash[:error]).to be_present
        end
      end
    end

    context 'as json' do
      it 'renders success json' do
        post :create, message: message_params, format: :json
        expect(response).to be_success
      end

      context 'with invalid params' do
        it 'returns error response' do
          post :create, message: { body: 'abc' }, format: :json
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end
end
