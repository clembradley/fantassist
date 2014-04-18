require 'spec_helper'

describe V1::ErrorsPresenter do
  describe 'returns errors in their expected format' do
    it 'accepts an ActiveModel::Errors object and returns the expected json representation of errors' do
      errors = ActiveModel::Errors.new(Player.new)
      errors.add(:first_name)
      errors.add(:last_name)

      errors_presenter = V1::ErrorsPresenter.new(errors)

      expect(errors_presenter.as_json).to eq(errors: ["First name is invalid", "Last name is invalid"])
    end
  end
end
