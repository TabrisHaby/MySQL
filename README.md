# MySQL


	# This is a repo for MySQL Exercise from SQLZoo with questions and answers

# Working Environment

	# http://sqlzoo.net/

	# MySQL 5.7.21

	# GUI : HeidiSQL 9.5.0.5196

	# OS : Windows 10 v1702

	# text editor : Atom Version 1.23.3

# Data Details

	# WORLD

		name	continent	area	population	gdp
		Afghanistan	Asia	652230	25500100	20343000000
		Albania		Europe	28748	2831741		12960000000
		Algeria		Africa	2381741	37100000	188681000000
		Andorra		Europe	468	78115		3712000000
		Angola		Africa	1246700	20609294	100990000000
		...

	# NOBEL

		yr	subject		winner
		1960	Chemistry	Willard F. Libby
		1960	Literature	Saint-John Perse
		1960	Medicine	Sir Frank Macfarlane Burnet
		1960	Medicine	Peter Madawar
		...

	# Game

		id	mdate		stadium				team1	team2
		1001	8 June 2012	National Stadium, Warsaw	POL	GRE
		1002	8 June 2012	Stadion Miejski (Wroclaw)	RUS	CZE
		1003	12 June 2012	Stadion Miejski (Wroclaw)	GRE	CZE
		1004	12 June 2012	National Stadium, Warsaw	POL	RUS
		...


	# Goal

		matchid	teamid	player			gtime
		1001	POL	Robert Lewandowski	17
		1001	GRE	Dimitris Salpingidis	51
		1002	RUS	Alan Dzagoev		15
		1002	RUS	Roman Pavlyuchenko	82
		...


	# Eteam

		id	teamname	coach
		POL	Poland		Franciszek Smuda
		RUS	Russia		Dick Advocaat
		CZE	Czech Republic	Michal Bilek
		GRE	Greece		Fernando Santos
		...


	# Movie

		id	title			yr	director	budget		gross
		10003	"Crocodile" Dundee II	1988	38		15800000	239606210
		10004	'Til There Was You	1997	49		10000000
		...


	# Actor

		id	name
		20	Paul Hogan
		50	Jeanne Tripplehorn
		...


	# Casting

		movieid	actorid	ord
		10003	20	4
		10004	50	1


	# Teacher

		id	dept		name			phone	mobile
		101	1		Shrivell		2753	07986 555 1234
		102	1		Throd			2754	07122 555 1920
		103	1		Splint			2293
		104			Spiregrain		3287
		105	2		Cutflower		3212	07996 555 6574
		106			Deadyawn		3345
		...


	# dept

		id	name
		1	Computing
		2	Design
		3	Engineering
		...


	# Edinburgh Buses.

		# stops

		Field	Type			Notes
		id 	INTEGER		Arbitrary value
		name	CHAR(30)	The name of an area served by at least one bus

		# route

		Field		Type					Notes
		num		CHAR(5)				The number of the bus - as it appears on the front of the vehicle. Oddly these numbers often include letters
		company		CHAR(3)				Several bus companies operate in Edinburgh. The main one is Lothian Region Transport - LRT
		pos		INTEGER				This indicates the order of the stop within the route. Some routes may revisit a stop. Most buses go in both directions.
		stop		INTEGER				This references the stops table
