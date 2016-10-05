# asm  
## Asm Vim -> Run  
```
vim main.s; gcc -c main.s -o obj; gcc obj -o bin; ./bin
```

## Asm C -> Asm Vim  
```
vim main.c; gcc -c -S -O3 main.c; vim main.s
```
