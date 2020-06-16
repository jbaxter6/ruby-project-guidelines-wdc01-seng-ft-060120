# Clearing table
Team.destroy_all
Player.destroy_all
PlayerTeam.destroy_all

# Creating teams
was = Team.find_or_create_by(name: "Redskins", city: "Washington")
cin = Team.find_or_create_by(name: "Bengals", city: "Cincinnati")
phi = Team.find_or_create_by(name: "Eagles", city: "Philadelphia")
ari = Team.find_or_create_by(name: "Cardinals", city: "Arizona")
las = Team.find_or_create_by(name: "Raiders", city: "Las Vegas")

# Creating players
dh = Player.find_or_create_by(name: "Dwyane Haskins", position: "QB")
dg = Player.find_or_create_by(name: "Derrius Guise", position: "RB")
jb = Player.find_or_create_by(name: "Joe Burrow", position: "QB")
jm = Player.find_or_create_by(name: "Joe Mixon", position: "RB")
cw = Player.find_or_create_by(name: "Carson Wentz", position: "QB")
ms = Player.find_or_create_by(name: "Miles Sanders", position: "RB")
km = Player.find_or_create_by(name: "Kyler Murray", position: "QB")
kd = Player.find_or_create_by(name: "Kenyan Drake", position: "RB")
dc = Player.find_or_create_by(name: "Derrick Carr", position: "QB")
jj = Player.find_or_create_by(name: "Josh Jacobs", position: "RB")

# Creating player_teams
PlayerTeam.create(team: was, player: dh, is_current_team: true)
PlayerTeam.create(team: was, player: dg, is_current_team: true)
PlayerTeam.create(team: cin, player: jb, is_current_team: true)
PlayerTeam.create(team: cin, player: jm, is_current_team: true)
PlayerTeam.create(team: phi, player: cw, is_current_team: true)
PlayerTeam.create(team: phi, player: ms, is_current_team: true)
PlayerTeam.create(team: ari, player: km, is_current_team: true)
PlayerTeam.create(team: ari, player: kd, is_current_team: true)
PlayerTeam.create(team: las, player: dc, is_current_team: true)
PlayerTeam.create(team: las, player: jj, is_current_team: true)
