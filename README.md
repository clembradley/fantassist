fantassist2
===========

## Initial Setup
```bash
bundle install
rake db:create:all db:migrate
```

To load up stats into database:
* download csv file of stats. the headers for the csv should map like so:

```ruby
at_bats: row['AB'],
earned_runs: row['ER'],
name: row['Name'], # will be parsed to first_name and last_name
position: row['Pos'],
hit_by_pitch: row['HBP'],
hits: row['H_H'],
hits_given_up: row['P_H'],
home_runs: row['HR'],
innings_pitched: row['IP'],
plate_appearances: row['PA'],
quality_starts: row['QS'],
rbis: row['RBI'],
runs: row['R'],
saves: row['SV'],
stolen_bases: row['SB'],
strikeouts: row['K'],
walks_drawn: row['H_BB'],
walks_given_up: row['P_BB'],
wins: row['W']
```

then to import these stats, run:
```ruby
rake db:load_stats PATH=<path/to/csv> YEAR=<2013>
```
