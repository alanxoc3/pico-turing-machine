-- binary string duplication

-- init, final1, final2, final3...
dup_prog="q0,q5\n\
q0,0,q0,0,>\n\
q0,1,q0,1,>\n\
q0,o,q0,0,>\n\
q0,i,q0,1,>\n\
q0, ,q2, ,<\n\
q2,0,q1,o,>\n\
q2,1,q3,i,>\n\
q2,o,q2,o,<\n\
q2,i,q2,i,<\n\
q1, ,q2,o,<\n\
q3, ,q2,i,<\n\
q1,0,q1,0,>\n\
q1,1,q1,1,>\n\
q1,o,q1,o,>\n\
q1,i,q1,i,>\n\
q3,0,q3,0,>\n\
q3,1,q3,1,>\n\
q3,o,q3,o,>\n\
q3,i,q3,i,>\n\
q2, ,q4, ,>\n\
q4,o,q4,0,>\n\
q4,i,q4,1,>\n\
q4,0,q4,0,<\n\
q4,1,q4,1,<\n\
q4, ,q5, ,>"
