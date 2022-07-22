class Query < ApplicationRecord
  
  default_scope { order(created_at: :desc) }
  
  def askGPT
    response = HTTParty.post('https://api.openai.com/v1/completions',
      :body => {
        :model => "text-davinci-002",
        :prompt => self["prompt"],
        :temperature => 0,
        :max_tokens => 400
      }.to_json,
        :headers => {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + Rails.application.credentials.openai_api_key
        })
    response["choices"][0]["text"].strip
  end

end
