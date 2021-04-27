/// @description Insert description here
// You can write your code in this editor

//if the player "dies," no longer can play/contribute
if(playerHealth<0)
{
	isAlive=false
	currentMoney=0
	amountRaised=0
	madeDecision=true
	voteOption=0
	//their sprite is set to a death sprite
	image_index = 1
}

//while there are days left in the game and the player is still alive
if(global.CURRENT_DAY<global.TOTAL_DAYS+1 and isAlive)//when day 7 is over, cannot move to the next day
{	
	image_index = 0
	//before the game starts, reset the stats
	if(global.CURRENT_DAY==0)
	{
		currentMoney=startMoney
		amountRaised=0
		madeDecision=false
		isAlive=true
	}

	//start of day, ask player what they want task they want to do for the day
	if(global.STATE_OF_CURRENT_DAY==1)
	{
		//if they havent made a decision yet
		if(!madeDecision)
		{
			if(checkHealth=false)
			{
				if(playerHealth<=40 and jobSalary>=40)//everyday that they are at <=40 health, and their salary is >=40, decrease their salary
				{
					jobSalary-=30//has an issue that once the player health is <=40, the game continiously lowers their salary
				}
				checkHealth=true
			}
			if(keyboard_check_pressed(ord(key1)))//pressed option 1, work, eanrs theor salary, loses 20 health
			{
				currentMoney+=jobSalary
				playerHealth-=20
				//has to check in every instance that they are going to be losing health

				madeDecision=true
			}
			if(keyboard_check_pressed(ord(key2))and currentMoney>=30)//pressed option 2, eat, loses $30, but gains 20 health
			{
				currentMoney-=30
				playerHealth+=30
				madeDecision=true
			}
			if(keyboard_check_pressed(ord(key3)) and currentMoney>=10)//pressed option 3, sleep, loses no money, but gains 10 health
			{
				currentMoney+=0
				playerHealth+=10
				madeDecision=true
			}
			//player health cannot go above 100
			if(playerHealth>100)
			{
				playerHealth=100
			}
		}
		//if everyone has chosen, move to the next day state
		if(global.EVERYONE_MADE_DECISION)
		{
			madeDecision=false//resets their choice for the next decision
		}
	}

	//middle of the day, when the event would appear
	//ON DAY 2: Stray dog event, DAY 4: plumbing event, DAY 6: lottery event
	else if(global.STATE_OF_CURRENT_DAY==2)
	{
		checkHealth=false//check the health status at the start of every day
		if((global.CURRENT_DAY==2) or (global.CURRENT_DAY==4) or (global.CURRENT_DAY==6 and global.IS_EVERYONE_ALIVE) or(global.CURRENT_DAY==5 and global.TRIGGER_PLUMBING_PART2=true) or(global.CURRENT_DAY==7 and global.TRIGGER_PLUMBING_PART3=true))//only on days 2/4/6 are there events
		{
			if(madeDecision = false)
			{
				if(keyboard_check_pressed(ord(key1)))//vote yes
				{
					global.EVENT_VOTES_OPT1+=1
					madeDecision=true
					voteOption=1
				}
				else if(keyboard_check_pressed(ord(key2)))//vote no
				{
					global.EVENT_VOTES_OPT2+=1
					madeDecision=true
					voteOption=2
				}
			}
			//once the players made their decisions and once the space key is press(thus event outcome is reset to false)
			//the players decisions are reset and thus move to next screen
			else if(global.EVERYONE_MADE_DECISION = true and global.EVENT_OUTCOME_HAPPENED=false)
			{
				//voteOption=0
				madeDecision = false
			}
		}
	}
	
	//end of day, asks player if they want to donate
	else if(global.STATE_OF_CURRENT_DAY==3)
	{
		if(!madeDecision)
		{
			if(keyboard_check_pressed(ord(key1)) and currentMoney>=10)//every time they press key 1, -10 in their money, but +10 in amount they contributed
			{
				currentMoney-=10
				amountRaised+=10
			}
			else if(keyboard_check_pressed(ord(key2)))//they press key 2 when they are done with the decision
			{
			madeDecision=true
			//audio_play_sound(sfx_transcation,2000,true), not working as intended

			}
		//audio_pause_sound(sfx_transcation)
		}

		if(global.EVERYONE_MADE_DECISION = true)
		{
			madeDecision=false
		}
		
	}


}