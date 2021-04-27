/// @description Insert description here
// You can write your code in this editor

if((global.CURRENT_DAY==4 and global.STATE_OF_CURRENT_DAY==2) or (global.CURRENT_DAY==5 and global.STATE_OF_CURRENT_DAY==2 and global.TRIGGER_PLUMBING_PART2==true) or(global.CURRENT_DAY==7 and global.STATE_OF_CURRENT_DAY==2 and global.TRIGGER_PLUMBING_PART3==true))
{
	draw_self()
}

else
{
	instance_destroy(self)
}
