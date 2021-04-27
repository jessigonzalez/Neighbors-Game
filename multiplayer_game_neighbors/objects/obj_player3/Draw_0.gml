/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_color(c_black)
draw_text(860,30, "player 3:")
draw_text(860,60, "KEYS: I/O/P")
draw_text(860,90, "Salary:"+string(jobSalary))
draw_text(860,120, "Money:"+string(currentMoney))
draw_text(860,150, "madeDecision:"+string(madeDecision))
//shows what choice they voted for
draw_text(860,180, "Vote: "+string(voteOption))
draw_text(860,210, "Health: "+string(playerHealth))
//draw_text(860,240, "isAlive: "+string(isAlive))

//draw_text((room_width/2)-120, 170, "Player 3 raised:"+string(obj_player3.amountRaised))