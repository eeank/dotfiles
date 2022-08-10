from pwn import *

{bindings}

context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-h"]

p = process({proc_args})

def choice(c):
	p.sendlineafter("", str(c))


gdb.attach(p)
p.interactive()
