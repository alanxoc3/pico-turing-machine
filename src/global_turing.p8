-- note: nil is interpreted as a space!

function load_turing(prog)
	g_prog_name, g_initial_state, g_final_states, g_trans = load_program(prog)
	printh("'"..g_prog_name.."' executing")
	g_state = g_initial_state
end

function load_tape(tape_str)
	g_tape = {}

	for i=1,#tape_str do
		add(g_tape, sub(tape_str, i, i))
	end
end

function find_tran(trans, state, read)
	for tran in all(trans) do
		if tran.cur == state and (tran.read == read or tran.read == c_space and read == nil) then return tran end
	end
	return nil
end

-- returns false if there was an error.
function update_turing()
	local tran = find_tran(g_trans, g_state, g_tape[g_loc])
	if not tran then
		return "error"
	end

	-- next state, move, write
	g_state = tran.next

	-- check in final states
	for x in all(g_final_states) do
		if g_state == x then
			return "complete"
		end
	end

	if tran.move == "<" then
		g_input = -1
	elseif tran.move == ">" then
		g_input = 1
	else
		g_input = 0
	end

	g_tape[g_loc] = tran.write

	printh(tape_to_string())
	return nil
end

function tape_to_string()
	-- algorithm: find the lowest value and the highest value.
	-- do a for loop from the lowest to the highest.
	local lowest = nil
	local highest = nil
	for k,v in pairs(g_tape) do
		if v != c_space then
			if lowest  == nil or k < lowest  then lowest  = k end
			if highest == nil or k > highest then highest = k end
		end
	end

	local text = ""
	for i=lowest,highest do
		if g_tape[i] then
			text = text..g_tape[i]
		else
			text = text..c_space
		end
	end

	return text
end

function update_tape_anim(t)
	-- input handling
	if g_anim_spd == 0 then
		g_anim_spd = g_input
		g_input = 0
	end

	-- animation handling
	g_anim_off += g_head_spd*g_anim_spd
	if g_anim_off > c_dim or g_anim_off < -c_dim then
		g_anim_off = 0
		g_loc += g_anim_spd
		g_anim_spd = 0
	end

	return g_anim_spd == 0
end

