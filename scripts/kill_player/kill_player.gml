function kill_player(obj) {
	E.deaths++
	E.shake = 10;
	
	E.dead_particles.clear();
	for (var dir = 0; dir <=7; dir++)
	{
		var angle = (dir / 8.0);
		E.dead_particles.add(new E.DeadParticle(
			obj.x + 4,
		    obj.y + 4,
		    10,
			new Vector2(Sin(angle) * 3, Cos(angle) * 3),
		)
		);

	}

	instance_destroy();
	restart_room();
}
