# frozen_string_literal: true

describe Application do
  subject(:data) do
    JSON.parse(last_response.body)
  end

  describe '/ok' do
    it 'returns ok' do
      get '/ok'
      expect(last_response).to be_ok
      expect(data['message']).to eq('ok')
    end
  end
end
