
function init_object(obj, x, y){
	var tile = (argument_count > 3) ? argument[3] : noone;
	var inst = instance_create_layer(x, y, E.Act_Layer, obj);
	with (inst) {
		if (inst != noone)
			E.objects.add(inst);
	}
	
	if (tile != noone)
		inst.spr = tile;
	inst.kind = obj
	inst.x = x;
	inst.y = y;

    return inst;
}

function destroy_object(obj){
	var index = E.objects.find(obj.id);
	if (index >= 0)
	{
		E.objects.remove(index);
		instance_destroy(obj);
	}
}
