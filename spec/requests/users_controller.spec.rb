require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET './index' page" do
    before(:all) do
      @address = get '/users'
    end
    it 'returns a valid status' do
      expect(@address).to eq(200)
    end

    it 'should render the template' do
      expect(get('/users')).to render_template('users/index')
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Users')
    end
  end

  describe "GET './index' page" do
    before(:all) do
      @address = get '/users/show'
    end
    it 'returns a valid status' do
      expect(@address).to eq(200)
    end

    it 'should render the template' do
      expect(get('/users/show')).to render_template('users/show')
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Users')
    end
  end
end
