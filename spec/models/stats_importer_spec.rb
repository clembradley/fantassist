require "spec_helper"

describe StatsImporter do
  describe ".call" do
    it "requires filename and year arguments" do
      expect {
        StatsImporter.call
      }.to raise_error(ArgumentError, "missing keywords: filename, year")
    end

    it "raises an error if the stats file does not exist" do
      expect {
        StatsImporter.call(filename: "foo-bar-baz.csv", year: 2015)
      }.to raise_error(ArgumentError, "File foo-bar-baz.csv does not exist!")
    end

    it "raises an error if the headers are invalid" do
      expect {
        StatsImporter.call(filename: invalid_stats_filename, year: 2015)
      }.to raise_error(StandardError, "Invalid headers")
    end

    it "creates a new player with the expected attributes" do
      StatsImporter.call(filename: valid_stats_filename, year: 2015)

      player = Player.where(first_name: "Mike", last_name: "Trout").first
      expect(player).to be_present
    end

    it "associates a new stat row with expected attributes to a player" do

    end
  end

  def valid_stats_filename
    "/Users/clement/Dev/fantassist/spec/models/valid_test_stats.csv"
  end

  def invalid_stats_filename
    "/Users/clement/Dev/fantassist/spec/models/invalid_test_stats.csv"
  end
end
