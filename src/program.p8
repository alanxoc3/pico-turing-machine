-- todo: make a generic csv parser.
function load_program(prog_str)
	-- append a new line for loop logic.

	prog_str = prog_str.."\n"
	-- control vars
	local reading_header = true
	local read_state = true
	local trans_loc = 1

	-- tmp vars
	local t_curr_state = ""
	local t_read = ""
	local t_next_state = ""
	local t_write = ""
	local t_move = ""

	-- storage vars
	local trans = {}
	local final_states = {}

	for i=1,#prog_str do
		local let = sub(prog_str, i, i)

		if reading_header then
			if let == "," then
				read_state = true
			elseif let == "\n" then
				reading_header = false
				read_state = true
			elseif read_state then
				add(final_states, let)
				read_state = false
			else
				final_states[#final_states] = final_states[#final_states]..let
			end
		else
			if let == "\n" then
				if t_curr_state != "" and t_read != "" and t_next_state != "" and t_write != "" and t_move != "" then
					add(trans, { cur=t_curr_state, read=t_read, next=t_next_state, write=t_write, move=t_move })
				end

				trans_loc = 1
				t_curr_state = ""
				t_read = ""
				t_next_state = ""
				t_write = ""
				t_move = ""

			elseif let == "," then
				trans_loc += 1
			elseif trans_loc == 1 then t_curr_state = t_curr_state..let
			elseif trans_loc == 2 then t_read       = t_read..let
			elseif trans_loc == 3 then t_next_state = t_next_state..let
			elseif trans_loc == 4 then t_write      = t_write..let
			elseif trans_loc == 5 then t_move       = t_move..let
			else
				trans[#final_states] = trans[#final_states]..let
			end
		end
	end

	local initial_state = nil
	if #final_states > 0 then
		initial_state = final_states[1]
		del(final_states,final_states[1])
	end

	return initial_state, final_states, trans
end
