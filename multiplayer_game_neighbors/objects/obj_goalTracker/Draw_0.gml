/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_text(400, 185, "$"+string(obj_player1.amountRaised))

draw_text(445, 185, "$"+string(obj_player2.amountRaised))

draw_text(490, 185, "$"+string(obj_player3.amountRaised))

draw_text(545, 185, "$"+string(obj_player4.amountRaised))

draw_text(585,180, "$"+string(global.FUNDS_NEEDED-global.FUNDS_RAISED))