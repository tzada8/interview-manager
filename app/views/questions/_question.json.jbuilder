json.extract! question, :id, :prompt, :answer, :interview_id, :created_at, :updated_at
json.url question_url(question, format: :json)
