/// @description Insert description here
// You can write your code in this editor

if (global.currentScreen == SCR_EDITOR) {
	icon(blockID,x,y,1,1)
	
	switch(blockID)
		{
			case 60:  
				icon(44,x,y-8,1,1);
			break;
		
			case 80:  
				icon(64,x,y-8,1,1); 
				icon(65,x+8,y-8,1,1);
				icon(81,x+8,y,1,1);
			break;
		
			case 86:
				icon(70,x,y-8,1,1); 
				icon(71,x+8,y-8,1,1);
				icon(87,x+8,y,1,1);
			break;
			
			case 112: 
				icon(96,x,y-8,1,1); 
				icon(97,x+8,y-8,1,1);
				icon(113,x+8,y,1,1);
			break;
		}
	
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true)
}