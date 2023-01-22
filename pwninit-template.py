from pwn import *

{bindings}

p = None
context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-h"]

REMOTE = 0
DEBUG = 0
IP = ""
PORT = 0


if REMOTE:
	p = remote(IP, PORT)
else:
	p = process({proc_args})

def choice(c):
	p.sendlineafter("", str(c))


def main():
	global p
	if DEBUG:
		gdb.attach(p)


if __name__ == "__main__":
	main()

p.interactive()
