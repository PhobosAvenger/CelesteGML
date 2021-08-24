event_inherited();
score = 0;
show  = false;

x += 5;

for (var i = 0; i < array_length(E.got_fruit); i++){
	if (E.got_fruit[i])
		score++;
}

//Stats.Increment(Stat.PICO_COMPLETES);
//Achievements.Register(Achievement.PICO8);