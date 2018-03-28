function _init()
	g_alphabet=" abcdefghijklmnopqrstuvwxyz0123456789+-*/=<>,.!?'\"@#$%^&_~(){}[]"
	g_loc=0
	g_anim_off=0
	g_anim_spd=0
	g_anim_tim=0
	g_dim=16
	g_tape = {
		[-1]=1,
		[0]=1, [1]=1, [2]=0,
		[3]=1, [4]=1, [5]=0,
		[6]=0, [7]=1, [8]=1
	}

	g_initial_state, g_final_states, g_trans = load_program(dup_prog)
	printh("initial: "..g_initial_state)
	for i=1,#g_final_states do
		printh(g_final_states[i])
		--printh("cur: "..trans[i].cur.." read: "..trans[i].read)
	end


	g_input_stack = {}
end

function _update60()
	if btnp(0) then
		add(g_input_stack, -1)
	elseif btnp(1) then
		add(g_input_stack, 1)
	elseif btnp(2) or btnp(3) then
		add(g_input_stack, 0)
	end

	-- valid symbols
	update_tape(g_tape, g_input_stack, "a")
end

function update_tape(t, tin, symbol)
	-- input handling
	if g_anim_spd == 0 and #tin > 0 then
		g_anim_spd = tin[1]*2
		del(tin, tin[1]) -- to delete at the index, fine if non-existent.

		-- write symbol
		if symbol != nil then
			t[g_loc] = symbol
		end
	end

	-- animation handling
	g_anim_off += g_anim_spd
	if g_anim_off > g_dim or g_anim_off < -g_dim then
		g_anim_off = 0
		if g_anim_spd > 0 then
			g_loc += 1
		elseif g_anim_spd < 0 then
			g_loc -= 1
		end
		g_anim_spd = 0
	end
end

function draw_tape(dim, ind_on, tape, vert_off, anim_off, timer)
	hor_off = -1 - anim_off
	-- -2 is flr(5/2) is the text height
	text_off = vert_off - 2
	text_col, rect_col, bkgd_col = 4, 2, 15
	
	rectfill(0, vert_off-dim/2, 127, vert_off + dim/2, bkgd_col)

	for i=ind_on-5,ind_on+5 do
		loc_i=i-ind_on+4
		rect(loc_i*dim-dim/2+hor_off, vert_off-dim/2, loc_i*dim+dim/2+hor_off, vert_off+dim/2, rect_col)
		if tape[i] then
			print(tape[i], loc_i*dim-1+hor_off, text_off, text_col)
		end
	end
end

function draw_head(vert_off)
	spr(1, 56, vert_off+5, 2, 2)
end

function _draw()
	cls()
	print('pico project!', 20, 20, 7)
	off=43
	draw_tape(g_dim, g_loc, g_tape, off, g_anim_off, 0)
	draw_head(off)
	print("index: "..g_loc, 58, 4, 7)
	for i=1, #g_input_stack do
		print(g_input_stack[i], 0, 8*i, 6)
	end

	print(g_alphabet, -130, 64, 7)
	print(#g_alphabet, 0, 90, 7)
end
