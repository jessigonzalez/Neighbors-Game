/// @description Insert description here
// You can write your code in this editor
draw_self()

draw_set_color(c_black)
draw_text(30,515, "player 2:")
draw_text(30,545, "KEYS: Z/X/C")
draw_text(30,575, "Salary:"+string(jobSalary))
draw_text(30,605, "Money:"+string(currentMoney))
draw_text(30,635, "madeDecision:"+string(madeDecision))
//shows what choice they voted for
draw_text(30,665, "Vote: "+string(voteOption))
draw_text(30,695, "Health: "+string(playerHealth))
//draw_text(30,725, "isAlive: "+string(isAlive))


//draw_text((room_width/2)-120, 150, "Player 2 raised:"+string(obj_player2.amountRaised))