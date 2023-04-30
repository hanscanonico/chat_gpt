require 'httparty'

class HomeController < ApplicationController
  def index
    # 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
    openai_api_key = Rails.application.credentials.openai_api_key

    @completion = openai_api_key
    response = HTTParty.post(
      'https://api.openai.com/v1/completions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{openai_api_key}"
      },
      body: {
        prompt: 'How are you',
        max_tokens: 150,
        model: 'text-davinci-003',
        top_p: 1,
        frequency_penalty: 0,
        presence_penalty: 0.6
      }.to_json
    )
    if response.success?
      @completion = response
    # Do something with the completion
    else
      puts "Error #{response.code}: #{response.body}"
    end
  end
end
