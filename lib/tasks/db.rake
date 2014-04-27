require 'csv'
namespace :db do

  desc 'load stats from a csv; PATH is required'
  task load_stats: :environment do
    if Rails.env.development?
      filename = ENV['FILENAME']
      raise '** FILENAME is required **' unless filename.present?
      @year = ENV['YEAR']
      raise '** YEAR is required **' unless @year.present?
      @projection = ENV['PROJECTION']
      raise '** PROJECTION is required **' unless @projection.present?
    else
      filename = '2013_all_mlb_stats.csv'
      @year = 2013
      @projection = false
    end

    if Rails.env.development?
      puts '****************************************************************************************************'
      puts 'Warning -- This will drop all current players in the db, their stats, and any associated draft picks'
      puts '****************************************************************************************************'
      print '> '
      confirm = STDIN.gets.chomp.downcase

      next unless confirm == 'y' or confirm == 'yes'
    end

    Player.destroy_all
    puts "--loading stats from #{filename}\n"

    @failures = []
    @count = 0

    CSV.read(filename, :headers => true).each do |row|
      begin
        player = Player.create!(_player_params(row))
        stat = Stat.create!(_stat_params(row, player.id))
        @count += 1
        puts "#{@count}) #{player.last_name}, #{player.first_name} #{stat.attributes.map {|k, v| "#{k}: #{v}"}.join(', ')}"
      rescue => e
        binding.pry
        @failures << {record: e.record, message: e.message}
      end
    end
    puts "successfully created #{@count} players"
    puts "failures: #{@failures.count}"
    puts @failures.inspect if @failures.present?
  end

  def _player_params(row)
    name = row['Name'].match(/(.+), (.+)/)
    position = row['Pos'].match(/(.+?)\//).try(:[], 1) || row['Pos']
    {
      first_name: name[2].strip,
      last_name: name[1].strip,
      organization: row['Team'].strip,
      position: position.strip
    }
  end

  def _stat_params(row, player_id)
    {
      at_bats: row['AB'],
      earned_runs: row['ER'],
      games_played: row['g'],
      hit_by_pitch: row['HBP'],
      hits: row['H_H'],
      hits_given_up: row['P_H'],
      home_runs: row['HR'],
      innings_pitched: row['IP'],
      plate_appearances: row['PA'],
      player_id: player_id,
      projection: @projection,
      quality_starts: row['QS'],
      rbis: row['RBI'],
      runs: row['R'],
      saves: row['SV'],
      stolen_bases: row['SB'],
      strikeouts: row['K'],
      walks_drawn: row['H_BB'],
      walks_given_up: row['P_BB'],
      wins: row['W'],
      year: @year
    }
  end
end
