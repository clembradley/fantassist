STATS_FILENAME = '2013_all_mlb_stats.csv'
PROJECTION = false
YEAR = 2013

def find_or_create_player!(row)
  name = row['Name'].match(/(.+), (.+)/)
  position = row['Pos'].match(/(.+?)\//).try(:[], 1) || row['Pos']
  Player.find_or_create_by!(first_name: name[2], last_name: name[1], position: position, organization: row['Team'])
end

def find_or_create_stat!(player, row)
  player.stats.find_or_create_by!(year: YEAR, projection: PROJECTION) do |s|
    s.at_bats = row['AB']
    s.earned_runs = row['ER']
    s.games_played = row['g']
    s.hit_by_pitch = row['HBP']
    s.hits = row['H_H']
    s.hits_given_up = row['P_H']
    s.home_runs = row['HR']
    s.innings_pitched = row['IP']
    s.plate_appearances = row['PA']
    s.quality_starts = row['QS']
    s.rbis = row['RBI']
    s.runs = row['R']
    s.saves = row['SV']
    s.stolen_bases = row['SB']
    s.strikeouts = row['K']
    s.walks_drawn = row['H_BB']
    s.walks_given_up = row['P_BB']
    s.wins = row['W']
  end
end

user = User.find_or_create_by!(email: 'default@example.com')
user.drafters.find_or_create_by!(name: 'default')

@count = 0
@failures = 0
CSV.read(STATS_FILENAME, :headers => true).each do |row|
  begin
    player = find_or_create_player!(row)
    stat = find_or_create_stat!(player, row)
    @count += 1
    puts "#{@count}) #{player.last_name}, #{player.first_name} #{stat.attributes.map {|k, v| "#{k}: #{v}"}.join(', ')}"
  rescue => e
    @failures << {record: e.try(:record), message: e.message}
  end
end
