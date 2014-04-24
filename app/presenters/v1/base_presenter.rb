class V1::BasePresenter
  def ==(obj)
    self.as_json == obj.as_json
  end
end
