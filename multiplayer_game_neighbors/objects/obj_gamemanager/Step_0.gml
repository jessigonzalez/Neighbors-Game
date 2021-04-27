
//press mouse button to make full screen
if mouse_check_button_pressed(mb_left)
   {
   if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
   else
      {
      window_set_fullscreen(true);
      }
   }


//start screen
if(room==screen_start)
{
	//resetting the stats when the game is replayed, make sure that player stats are alse reset
	global.CURRENT_DAY=0
	global.STATE_OF_CURRENT_DAY=1
	global.TOTAL_DAYS=7
	global.FUNDS_RAISED=0//amount raised so far
	global.EVERYONE_MADE_DECISION = false
	global.EVENT_OUTCOME_HAPPENED = false
	global.TRIGGER_PLUMBING_PART2=false
	global.TRIGGER_PLUMBING_PART3=false
	global.LOSE_BY_DEATH=false
	global.IS_EVERYONE_ALIVE=true
	
	if(keyboard_check_pressed(vk_space))
	{
		room_goto(screen_game)
		global.CURRENT_DAY+=1
	}
}


//when we are playing the game
if(room==screen_game)
{
	//the funds raised as the sum of what everyone raised so far
	global.FUNDS_RAISED=(obj_player1.amountRaised + obj_player2.amountRaised + obj_player3.amountRaised + obj_player4.amountRaised)
	global.EVERYONE_MADE_DECISION = (obj_player1.madeDecision and obj_player2.madeDecision and obj_player3.madeDecision and obj_player4.madeDecision)
	
	//checks to see if everyone is alive
	if((obj_player1.playerHealth<0) or (obj_player2.playerHealth<0) or (obj_player3.playerHealth<0) or (obj_player4.playerHealth<0))
	{
		global.IS_EVERYONE_ALIVE=false
	}
	
	//making sure everyone is alive, if everyone's health is below zero, the game ends, everyone loses
	if((obj_player1.playerHealth<0) and (obj_player2.playerHealth<0) and (obj_player3.playerHealth<0) and (obj_player4.playerHealth<0))
	{
		global.LOSE_BY_DEATH=true//the players lost because everyone died
		room_goto(screen_end_lose)
	}

	//day state 1 
	if(global.CURRENT_DAY<global.TOTAL_DAYS+1)//when day 7 is over, cannot move to the next day
	{
		//start of day, ask player what they want task they want to do for the day
		if(global.STATE_OF_CURRENT_DAY==1)
		{
			//change the backround into day state 1
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate1)
			if(global.EVERYONE_MADE_DECISION = true)
			{
				global.STATE_OF_CURRENT_DAY +=1
			}
		}
	//day state 2, when the event would appear
	//ON DAY 2: Stray dog event, DAY 4: plumbing event, DAY 6: lottery event, DAY 5: plumbing part 2, DAY 7: plumbing part 3
		else if(global.STATE_OF_CURRENT_DAY==2)
		{
			if(global.CURRENT_DAY==2 or global.CURRENT_DAY==4 or (global.CURRENT_DAY==6 and global.IS_EVERYONE_ALIVE=true) or (global.CURRENT_DAY==5 and global.TRIGGER_PLUMBING_PART2=true) or(global.CURRENT_DAY==7 and global.TRIGGER_PLUMBING_PART3=true))//only on these days have events
			{
				if(global.EVERYONE_MADE_DECISION = false and global.EVENT_OUTCOME_HAPPENED = false)//if the event has just started and not everyone made a desicion yet
				{
					if(global.CURRENT_DAY==2)
					{
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_1_straydog)
					}
					if(global.CURRENT_DAY==4)
					{
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_part1)
						instance_create_depth(900,400,0,obj_pipe)
					}
					if(global.CURRENT_DAY==6 and global.IS_EVERYONE_ALIVE=true)
					{
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_3_lottery)
					}
					if(global.CURRENT_DAY==5 and global.TRIGGER_PLUMBING_PART2=true)
					{
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_part2)
						instance_create_depth(900,400,0,obj_pipe)////
					}
					if(global.CURRENT_DAY==7 and global.TRIGGER_PLUMBING_PART3=true)
					{
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_part3)
						instance_create_depth(900,400,0,obj_pipe)////
					}
				}
				if(global.EVERYONE_MADE_DECISION = true)
				{
					if(global.CURRENT_DAY==2)
					{
						eventOutcome(global.EVENT_VOTES_OPT1,global.EVENT_VOTES_OPT2,1)
						//after the outcomes are made, reset vote counts
						global.EVENT_VOTES_OPT1=0
						global.EVENT_VOTES_OPT2=0
						if(keyboard_check_pressed(vk_space) and global.EVENT_OUTCOME_HAPPENED=true)
						{
						//move to the next state of the day
							global.STATE_OF_CURRENT_DAY+=1
							global.EVENT_OUTCOME_HAPPENED=false	
						}
					}
					if(global.CURRENT_DAY==4)
					{
						eventOutcome(global.EVENT_VOTES_OPT1,global.EVENT_VOTES_OPT2,2)
						global.EVENT_VOTES_OPT1=0
						global.EVENT_VOTES_OPT2=0
						if(keyboard_check_pressed(vk_space) and global.EVENT_OUTCOME_HAPPENED=true)
						{
							//move to the next state of the day
							global.STATE_OF_CURRENT_DAY+=1
							global.EVENT_OUTCOME_HAPPENED=false
						}
					}
					if(global.CURRENT_DAY==6 and global.IS_EVERYONE_ALIVE=true)
					{
						eventOutcome(global.EVENT_VOTES_OPT1,global.EVENT_VOTES_OPT2,3)
						global.EVENT_VOTES_OPT1=0
						global.EVENT_VOTES_OPT2=0
						if(keyboard_check_pressed(vk_space) and global.EVENT_OUTCOME_HAPPENED=true)
						{
							//move to the next state of the day
							global.STATE_OF_CURRENT_DAY+=1
							global.EVENT_OUTCOME_HAPPENED=false	
						}
					}
					
					if(global.CURRENT_DAY==5 and global.TRIGGER_PLUMBING_PART2=true)
					{
						eventOutcome(global.EVENT_VOTES_OPT1,global.EVENT_VOTES_OPT2,4)
						global.EVENT_VOTES_OPT1=0
						global.EVENT_VOTES_OPT2=0
						if(keyboard_check_pressed(vk_space) and global.EVENT_OUTCOME_HAPPENED=true)
						{
							//move to the next state of the day
							global.STATE_OF_CURRENT_DAY+=1
							global.EVENT_OUTCOME_HAPPENED=false	
						}
					}
					if(global.CURRENT_DAY==7 and global.TRIGGER_PLUMBING_PART2=true)
					{
						eventOutcome(global.EVENT_VOTES_OPT1,global.EVENT_VOTES_OPT2,5)
						global.EVENT_VOTES_OPT1=0
						global.EVENT_VOTES_OPT2=0
						if(keyboard_check_pressed(vk_space) and global.EVENT_OUTCOME_HAPPENED=true)
						{
							//move to the next state of the day
							global.STATE_OF_CURRENT_DAY+=1
							global.EVENT_OUTCOME_HAPPENED=false	
						}
					}
				}
			}
			//if the day does not have an event, move onto the next state of the day
			else if(global.CURRENT_DAY==1 or global.CURRENT_DAY==3 or(global.CURRENT_DAY==5 and global.TRIGGER_PLUMBING_PART2=false) or(global.CURRENT_DAY==7 and global.TRIGGER_PLUMBING_PART3=false) or (global.CURRENT_DAY==6 and global.IS_EVERYONE_ALIVE=false))//nothing happens on day 1 or 3
			{
				global.STATE_OF_CURRENT_DAY+=1
			}

		}
		
		//day state 3
		else if(global.STATE_OF_CURRENT_DAY = 3)
		{
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate3)
			if(global.EVERYONE_MADE_DECISION = true)
			{
				global.STATE_OF_CURRENT_DAY=1//resets to the beginning of the next day
				global.CURRENT_DAY+=1//go to the next day
			}
		}
	}
	//once the 7 days are over, are on the 8th day
	//figure out the outcome of the game
	if(global.CURRENT_DAY==global.TOTAL_DAYS+1)
	{
	//if we have raised enough, go to win ending
		if(global.FUNDS_RAISED>=global.FUNDS_NEEDED)
		{
			room_goto(screen_end_win)
		}
	//else, did not raise enough, go to lose ending
		else
		{	
			global.LOSE_BY_DEATH=false//did not lose because everyone died
			room_goto(screen_end_lose)
		}
	}
}

//going back to the beginning of the end, restarting the game
if(room==screen_end_lose)

{
		if(global.LOSE_BY_DEATH=true)//if the game ended because everyone died
		{
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_ending_lose_everyonedies)
		}
	
		else if(global.LOSE_BY_DEATH=false)//they lost for another reason
		{
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_ending_lose)
		}
	if(keyboard_check_pressed(vk_space))
	{
		room_goto(screen_start)
	}
}

if(room==screen_end_win)
{
	if(keyboard_check_pressed(vk_space))
	{
		room_goto(screen_start)
	}
}


	
