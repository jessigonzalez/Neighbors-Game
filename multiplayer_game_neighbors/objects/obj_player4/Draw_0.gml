/// @description Insert description here
// You can write your code in this editor
draw_self()

draw_set_color(c_black)
draw_text(860,515, "player 4:")
draw_text(860,545, "KEYS: B/N/M")
draw_text(860,575, "Salary:"+string(jobSalary))
draw_text(860,605, "Money:"+string(currentMoney))
draw_text(860,635, "madeDecision:"+string(madeDecision))

//shows what choice they voted for
draw_text(860,665, "Vote: "+string(voteOption))
draw_text(860,695, "Health: "+string(playerHealth))
//draw_text(860,725, "isAlive: "+string(isAlive))

//draw_text((room_width/2)-120, 190, "Player 4 raised:"+string(obj_player4.amountRaised))