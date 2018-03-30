function draw_tape(dim, ind_on, tape, vert_off, anim_off, timer)
	hor_off = -1 - anim_off
	-- -2 is flr(5/2) is the text height
	text_off = vert_off - 2
	text_col, rect_col, bkgd_col = 5, 1, 6
	
	rectfill(0, vert_off-dim/2, 127, vert_off + dim/2, bkgd_col)

	for i=ind_on-5,ind_on+5 do
		loc_i=i-ind_on+4
		rect(loc_i*dim-dim/2+hor_off, vert_off-dim/2, loc_i*dim+dim/2+hor_off, vert_off+dim/2, rect_col)
		if tape[i] and tape[i] != c_space then
			print(tape[i], loc_i*dim-1+hor_off, text_off, text_col)
		end
	end
end

function draw_head(vert_off)
	spr(1, 56, vert_off+5, 2, 2)
end

