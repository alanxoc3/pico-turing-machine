-- binary string duplication

-- init, final1, final2, final3...
dup_prog="binary duplication\
q0,q5\
q0,0,q0,0,>\
q0,1,q0,1,>\
q0,o,q0,0,>\
q0,i,q0,1,>\
q0,_,q2,_,<\
q2,0,q1,o,>\
q2,1,q3,i,>\
q2,o,q2,o,<\
q2,i,q2,i,<\
q1,_,q2,o,<\
q3,_,q2,i,<\
q1,0,q1,0,>\
q1,1,q1,1,>\
q1,o,q1,o,>\
q1,i,q1,i,>\
q3,0,q3,0,>\
q3,1,q3,1,>\
q3,o,q3,o,>\
q3,i,q3,i,>\
q2,_,q4,_,>\
q4,o,q4,0,>\
q4,i,q4,1,>\
q4,0,q4,0,<\
q4,1,q4,1,<\
q4,_,q5,_,>"
