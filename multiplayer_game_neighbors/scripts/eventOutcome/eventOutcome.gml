
//needs to know how many "yeses" and "nos", what kind of event is it to give out the outcome

_numVotesOpt1=argument0//how many votes for option 1
_numVotesOpt2=argument1// how many votes for option 2
_eventNum=argument2//which event is it (1/2/3), (4/5 are the plumbing events part 2 and 3)

//DOG EVENT
if(_eventNum==1)
{
	//option 1 wins, everyone pays 50, everyone's health is full
	if(_numVotesOpt1>_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_1_straydog_keep)
		obj_player1.currentMoney-=50
		obj_player2.currentMoney-=50
		obj_player3.currentMoney-=50
		obj_player4.currentMoney-=50
		
		obj_player1.playerHealth=100
		obj_player2.playerHealth=100
		obj_player3.playerHealth=100
		obj_player4.playerHealth=100
		global.EVENT_OUTCOME_HAPPENED=true
	}
	//option 2 wins, no one pays, everyone's health decreases
	else if(_numVotesOpt1<_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_1_straydog_kickout)
		obj_player1.playerHealth-=40
		obj_player2.playerHealth-=40
		obj_player3.playerHealth-=40
		obj_player4.playerHealth-=40
		global.EVENT_OUTCOME_HAPPENED=true
	}
	else if(_numVotesOpt1==_numVotesOpt2 and _numVotesOpt1>0 and _numVotesOpt2>0)//draw and making sure everyone voted
	{//if it is a draw, everyone loses some health
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_1_straydog_tied)
		obj_player1.playerHealth-=20
		obj_player2.playerHealth-=20
		obj_player3.playerHealth-=20
		obj_player4.playerHealth-=20
		global.EVENT_OUTCOME_HAPPENED=true
	}

}

			
//PLUMBING EVENT, part 1
if(_eventNum==2)
{
	//option 1 wins, everyone pays 100, make sure all the players that are alive can play the amount, or if they player is dead
	if(_numVotesOpt1>_numVotesOpt2 and ((obj_player1.isAlive and obj_player1.currentMoney>=100) or obj_player1.isAlive==false) and ((obj_player2.isAlive and obj_player2.currentMoney>=100) or obj_player2.isAlive==false)and ((obj_player3.isAlive and obj_player3.currentMoney>=100) or obj_player3.isAlive==false) and ((obj_player4.isAlive and obj_player4.currentMoney>=100) or obj_player4.isAlive==false))
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_fix)
		obj_player1.currentMoney-=100
		obj_player2.currentMoney-=100
		obj_player3.currentMoney-=100
		obj_player4.currentMoney-=100
		global.EVENT_OUTCOME_HAPPENED=true
	}
	//option 2 wins, no one pays, but everyone's health decreases
	else if(_numVotesOpt1<_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_ignore)
		obj_player1.playerHealth-=20
		obj_player2.playerHealth-=20
		obj_player3.playerHealth-=20
		obj_player4.playerHealth-=20
		global.TRIGGER_PLUMBING_PART2=true//triggers part 2 because the pipes were not fixed
		global.EVENT_OUTCOME_HAPPENED=true
	}
	else if(_numVotesOpt1==_numVotesOpt2 and _numVotesOpt1>0 and _numVotesOpt2>0)//draw no one pays, but health decreases a little, the 
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_tied)
		obj_player1.playerHealth-=10
		obj_player2.playerHealth-=10
		obj_player3.playerHealth-=10
		obj_player4.playerHealth-=10
		global.TRIGGER_PLUMBING_PART2=true
		global.EVENT_OUTCOME_HAPPENED=true
	}
}
		
					
//LOTTERY
if(_eventNum==3)
{
	//option 1 wins, everyone get 100
	if(_numVotesOpt1>_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_3_lottery_individual)
		obj_player1.currentMoney+=100
		obj_player2.currentMoney+=100
		obj_player3.currentMoney+=100
		obj_player4.currentMoney+=100
		global.EVENT_OUTCOME_HAPPENED=true
	}
	//option 2 wins, 500 added to the total raised, everyone's individual raised goes up by 125
	else if(_numVotesOpt1<_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_3_lottery_group)
		obj_player1.amountRaised+=125
		obj_player2.amountRaised+=125
		obj_player3.amountRaised+=125
		obj_player4.amountRaised+=125
		global.EVENT_OUTCOME_HAPPENED=true
	}
	else if(_numVotesOpt1==_numVotesOpt2 and _numVotesOpt1>0 and _numVotesOpt2>0)//draw, everyone gets $50, you end up losing some money because th group was indecisive
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_3_lottery_tied)
		obj_player1.currentMoney+=50
		obj_player2.currentMoney+=50
		obj_player3.currentMoney+=50
		obj_player4.currentMoney+=50
		global.EVENT_OUTCOME_HAPPENED=true
	}
}



//if they decide not to fix the plumbing, the event occurs again, but with greater stakes	
//PLUMBING PART 2
if(_eventNum==4)
{
	//option 1 wins, everyone pays 150 now
	if(_numVotesOpt1>_numVotesOpt2 and ((obj_player1.isAlive and obj_player1.currentMoney>=150) or obj_player1.isAlive==false) and ((obj_player2.isAlive and obj_player2.currentMoney>=150) or obj_player2.isAlive==false)and ((obj_player3.isAlive and obj_player3.currentMoney>=150) or obj_player3.isAlive==false) and ((obj_player4.isAlive and obj_player4.currentMoney>=150) or obj_player4.isAlive==false))
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_fix)
		obj_player1.currentMoney-=150
		obj_player2.currentMoney-=150
		obj_player3.currentMoney-=150
		obj_player4.currentMoney-=150
		global.EVENT_OUTCOME_HAPPENED=true
	}
	//option 2 wins, no one pays, but everyone's health decreases
	else if(_numVotesOpt1<_numVotesOpt2)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_ignore)
		obj_player1.playerHealth-=20
		obj_player2.playerHealth-=20
		obj_player3.playerHealth-=20
		obj_player4.playerHealth-=20
		global.TRIGGER_PLUMBING_PART3=true
		global.EVENT_OUTCOME_HAPPENED=true
	}
	else if(_numVotesOpt1==_numVotesOpt2 and _numVotesOpt1>0 and _numVotesOpt2>0)//draw no one pays, but health decreases a little, the 
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_tied)
		obj_player1.playerHealth-=10
		obj_player2.playerHealth-=10
		obj_player3.playerHealth-=10
		obj_player4.playerHealth-=10
		global.TRIGGER_PLUMBING_PART3=true
		global.EVENT_OUTCOME_HAPPENED=true
	}
}

//PLUMBING PART 3

if(_eventNum==5)
{
	//option 1 wins, everyone pays 200 now
	if(_numVotesOpt1>_numVotesOpt2 and ((obj_player1.isAlive and obj_player1.currentMoney>=200) or obj_player1.isAlive==false) and ((obj_player2.isAlive and obj_player2.currentMoney>=200) or obj_player2.isAlive==false)and ((obj_player3.isAlive and obj_player3.currentMoney>=200) or obj_player3.isAlive==false) and ((obj_player4.isAlive and obj_player4.currentMoney>=200) or obj_player4.isAlive==false))
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_daystate2_2_plumbing_fix)
		obj_player1.currentMoney-=200
		obj_player2.currentMoney-=200
		obj_player3.currentMoney-=200
		obj_player4.currentMoney-=200
		global.EVENT_OUTCOME_HAPPENED=true
	}
	
	//IF THEY DO NOT CHOOSE TO FIX THE PIPES, THE GAME ENDS BECUSE THE APARTMENT WAS FLOODED AND DESTROYED
	//option 2 wins or there is a draw
	else if((_numVotesOpt1<_numVotesOpt2) or(_numVotesOpt1==_numVotesOpt2 and _numVotesOpt1>0 and _numVotesOpt2>0))
	{//GO TO LOSE SCREEN, CURRENT DAY=8
		global.CURRENT_DAY=8
		room_goto(screen_end_lose)
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_ending_lose_plumbing)
	}

}
