json.extract! my_question, :id, :prompt, :created_at, :updated_at
json.url my_question_url(my_question, format: :json)
