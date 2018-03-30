-- see source code at:
-- github.com/alanxoc3/pico-turing-machine

-- I want a pause in between each frame.

c_space = "_"

-- no underscore
c_alphabet=" abcdefghijklmnopqrstuvwxyz0123456789+-*/=<>,.!?'\"@#$%^&~(){}[]"
c_dim=16
c_pause_min=2
c_pause_max=60

function _init()
	reset_turing()
end

function reset_turing()
	g_state=""
	g_anim_off=0
	g_loc=1
	g_head_spd=1
	g_anim_spd=0
	g_cell_pause=31
	g_anim_timer=g_cell_pause
	g_input = 0
	g_can_step=true
	g_is_complete = false
	g_paused = false
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

	update_input()

	g_can_step = update_tape_anim()

end

function _draw()
	cls()
	off=43
	print("turing machine v.0.1", 1, 1, 7)
	print("up = faster, dwn = slower", 1, 7, 6)
	print("z  = reset,  x   = stop/play", 1, 13, 6)
	draw_tape(c_dim, g_loc, g_tape, off, g_anim_off, 0)
	draw_head(off)

	print("prog: "..g_prog_name, 1, 23, 12)
	local text = g_is_complete
	if not text then
		text = "working "

		if not g_paused then
			local spd = 100 - flr(100 * (g_cell_pause-c_pause_min) / (c_pause_max - c_pause_min))
			text = text..spd.."% speedup"
		else
			text = text.."paused"
		end
	end

	print(text, 1, 29, 13)

	print("state: "..g_state, 1, 66, 7)
	rect(0, 72, 127, 72, 6)
	print("results:", 1, 74, 7)
	print(tape_to_string(), 1, 80, 6)
end
