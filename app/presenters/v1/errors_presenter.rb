class V1::ErrorsPresenter

  def initialize(errors)
    @errors = errors.full_messages
  end

  def as_json(options = {})
    {errors: @errors}
  end
end
