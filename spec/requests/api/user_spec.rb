# rubocop:disable all
require 'swagger_helper'

RSpec.describe 'api/user', type: :request do
    path '/api/v1/users' do
        post 'creates a user' do
            tags 'Users'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    email: { type: :string },
                    password: { type: :string },
                    password_confirmation: { type: :string }

                },
                require[ 'name', 'email', 'password', 'password_confirmation' ]
            }
            response '201', 'user created' do
                let(:user) { { name: 'Doe', email: 'jonhbosco@gmail.com', password: 'password', password_confirmation: 'password' } }
                run_test!

            end
            response '422', 'invalid request' do
                let(:user) { { name: 'Doe' } }
                run_test!
            end

        end
        end

        path '/api/v1/users/{id}' do
            get 'Retrieves a user' do 
                tags 'Users'
                produces 'application/json'
                parameter name: :id, :in => :path, :type => :string
                response '200', 'user found' do
                    schema type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
                        email: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string }
                    },
                    required: [ 'id', 'name', 'email', 'created_at', 'updated_at' ]

                    let(:id) { User.create(name: 'Doe', email: '', password: 'password', password_confirmation: 'password').id }
                    run_test!
            end
            response '404', 'user not found' do
                let(:id) { 'invalid' }
                run_test!
            end
            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/xml' }
                run_test!
            end
        end
    end
end
# rubocop:enable all