class V1::BasePresenter
  def ==(obj)
    self.as_json == obj.as_json
  end

  def self.from_list(resources)
    resources.map { |resource| self.new(resource) }
  end
end
