require 'swagger_helper'

RSpec.describe 'api/post', type: :request do
    path '/api/v1/posts' do
        post 'creates a post' do
            tags 'Posts'
            consumes 'application/json'
            parameter name: :post, in: :body, schema: {
                type: :object,
                properties: {
                    title: { type: :string },
                    body: { type: :string },
                    user_id: { type: :integer }
                },
                require['title', 'body', 'user_id']
            }
            response '201', 'post created' do
                let(:post) { { title: 'Doe', body: '', user_id: 1 } }
end
end
end
end
