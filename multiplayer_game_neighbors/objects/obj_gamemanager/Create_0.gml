/// @description Insert description here
// You can write your code in this editor


global.CURRENT_DAY=0//day 0 is the start screen
global.TOTAL_DAYS=7

global.STATE_OF_CURRENT_DAY=1//either 1,2,3 
//1=start of day, 2=middle of the day, 3=end of day

global.FUNDS_NEEDED=1000
global.FUNDS_RAISED=0//amount raised so far


//how many people chose for an event
global.EVENT_VOTES_OPT1=0//option 1
global.EVENT_VOTES_OPT2=0//option 2

global.EVERYONE_MADE_DECISION = false
global.EVENT_OUTCOME_HAPPENED = false

//for when the players decide to ignore the pipes
global.TRIGGER_PLUMBING_PART2=false//if they decide to ignore the first time, triggers the plumbing event again on day 5
global.TRIGGER_PLUMBING_PART3=false//if they decide to ignore the second time, triggers the plumbing event again on day 7
global.IS_EVERYONE_ALIVE=true//checks to see if everyone is alive, used for the lottery event


global.LOSE_BY_DEATH=false//if they lose because everyone died

audio_play_sound(bgm_elevatorMusic,1000,true)