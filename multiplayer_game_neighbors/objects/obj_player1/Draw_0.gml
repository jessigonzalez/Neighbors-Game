/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_color(c_black)
draw_text(30,30, "player 1:")
draw_text(30,60, "KEYS: Q/W/E")
draw_text(30,90, "Salary:"+string(jobSalary))
draw_text(30,120, "Money:"+string(currentMoney))
draw_text(30,150, "madeDecision:"+string(madeDecision))
//shows what choice they voted for
draw_text(30,180, "Vote: "+string(voteOption))
draw_text(30,210, "Health: "+string(playerHealth))
//draw_text(30,240, "isAlive: "+string(isAlive))


//draw_text((room_width/2)-120, 130, "Player 1 raised:"+string(obj_player1.amountRaised))

