" 'Silent' command, can be used to run stuff silently then redrawing

command! -nargs=* -bang Silent execute ':silent<bang>'.' '.<q-args> | execute ':redraw!'
