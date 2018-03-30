-- see source code at:
-- github.com/alanxoc3/pico-turing-machine

-- I want a pause in between each frame.

c_space = "_"

-- no underscore
c_alphabet=" abcdefghijklmnopqrstuvwxyz0123456789+-*/=<>,.!?'\"@#$%^&~(){}[]"
c_dim=16
g_cell_pause=60

function _init()
	reset_turing()
end

function reset_turing()
	g_state=""
	g_anim_off=0
	g_loc=1
	g_head_spd=1
	g_anim_spd=0
	g_anim_timer=60
	g_input = 0
	g_can_step=true
	g_is_complete = false
	g_pause_speed = 0
	g_prog_name = ""

	load_turing(dup_prog)
	load_tape("1101")
end

function _update60()
	if btnp(0) then
		g_input = -1
	elseif btnp(1) then
		g_input = 1
	elseif btnp(2) or btnp(3) then
		g_input = 0
	end

	-- valid symbols
	if not g_is_complete then
		if g_can_step then g_is_complete = update_turing() end
	end

	g_can_step = update_tape_anim()

	if g_pause_speed == 0 then
		if btn(2) then
			g_cell_pause = max(g_cell_pause-2, 2)
		end

		if btn(3) then
			g_cell_pause = min(g_cell_pause+2, 60)
		end
	end

	-- reset
	if btnp(4) then
		reset_turing()
	end

	-- pause
	if btnp(5) then
		if g_pause_speed == 0 then
			g_pause_speed = g_anim_timer
			g_head_spd = 0
		else
			g_head_spd = g_pause_speed
			g_pause_speed = 0
		end
	end
end

function _draw()
	cls()
	off=43
	print("turing machine v.0.1", 1, 1, 7)
	print("up = faster, dwn = slower", 1, 7, 6)
	print("z  = reset,  x   = stop", 1, 13, 6)
	draw_tape(c_dim, g_loc, g_tape, off, g_anim_off, 0)
	draw_head(off)

	if g_is_complete then
		print(g_is_complete, 1, 60, 8)
	end
	print("state: "..g_state, 1, 66, 7)
	rect(0, 72, 127, 72, 6)
	print("results:", 1, 74, 7)
	print(tape_to_string(), 1, 80, 6)
	print(g_anim_timer,100,100, 7)
	print(g_anim_off,100,110, 7)

end
