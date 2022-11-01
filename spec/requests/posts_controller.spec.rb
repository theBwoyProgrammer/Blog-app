require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe "GET './index' page" do
    before(:all) do
      @address = get '/posts'
    end
    it 'returns a valid status' do
      expect(@address).to eq(200)
    end

    it 'should render the template' do
      expect(get('/posts')).to render_template('posts/index')
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end

  describe "GET './index' page" do
    before(:all) do
      @address = get '/posts/show'
    end
    it 'returns a valid status' do
      expect(@address).to eq(200)
    end

    it 'should render the template' do
      expect(get('/posts/show')).to render_template('posts/show')
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end
end
