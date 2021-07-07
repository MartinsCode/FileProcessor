# frozen_string_literal: true

require 'world'

RSpec.describe World do
  context 'the_answer' do
    it 'the_answer should equal 42' do
      expect(World.the_answer).to eq 42
    end
  end
end
