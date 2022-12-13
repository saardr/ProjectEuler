# ProjectEulerAsm
Solutions to Project Euler problems (at https://projecteuler.net) (as stated on the site, it is allowed to publish solutions for the first 100 problems)

Compile assembly on linux with: (requires yasm and gcc; for debian based distros use: "sudo apt-get install gcc yasm")

yasm -g dwarf2 -f elf64 file_name1.asm file_name2.asm [...] file_nameN.asm
(-g is for debugging, dwarf2 is a debugging format https://en.wikipedia.org/wiki/DWARF)

this will result in several Object files (ending with .o), to get an executable:
gcc -g file_name1.o file_name2.o [...] file_nameN.o -o YourExecutableName
