# ProjectEulerAsm
Solutions to Project Euler problems (at https://projecteuler.net) in x86-64 assembly language.

I solved said problems with assembly because i wanted to practice it, and the challenges seemed like a good and fun opportunity to do so.
I chose to use 64 bit assembly because of the many large number operations.

Compile on linux with: (requires yasm and gcc, for debian based distros use: "sudo apt-get install gcc yasm")

yasm -g dwarf2 file_name1.asm file_name2.asm [...] file_nameN.asm
(-g is for debugging, dwarf2 is a debugging format https://en.wikipedia.org/wiki/DWARF)

this will result in several Object files (ending with .o), to get an executable:
gcc -g file_name1.o file_name2.o [...] file_nameN.o -o YourExecutableName
