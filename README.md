# Pico-8 Turing Machine

I have the basic idea down.

TODO:
- memory warning.
- cpu warning.
- input below.
- symbol enter dialog boxes.
- initial tape, accept, and final state enabled.
- run turing (allocation included).
- title page, with about!
- run/stop buttons at the bottom.

Remember that each transition in the turing machine should have:
read symbol
write symbol
movement
next state

The whole input things will be at the bottom of the screen.

While the top half will be a tape. When you run it, it shakes for a second.
Same if you make it double speed. If you make it double speed, it has a speed
meter somewhere near the top.

The turing machine MUST make music! And you need background music while you are
programming your turing machine.

The music can be tied to which symbol you write. This means that every symbol
has a sound attached to it.

You CAN NOT edit while the turing machine is going.

If you read a symbol that you don't have an instruction for, then an error
occurs. Maybe the screen goes grey. And it mentions an error.

You could import with the clipboard and export with the clipboard. It needs a
strict file format though. Each transition is a csv line. There can be a
comment at the top of the export with the format.

Should the user be able to copy the code to the clipboard? Umm, where would
that button be? It could be on the right side....

The copy button will copy the turing results. Not the program code! But there
can be a save file for the program.

Controls are:
next, play, pause, stop, slow down, speed up, copy results.

There can be a tutorial screen also.
