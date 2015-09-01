class StatsImporter
  def self.call(filename:, year:)
    if !File.exists?(filename)
      raise ArgumentError, "File foo-bar-baz.csv does not exist!"
    end
  end  
end