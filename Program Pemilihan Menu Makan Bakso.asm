.model small
.code
org 100h
start:
    jmp mulai
menu    db 13,10,'+==================================+'
        db 13,10,'|      >> >> Menu Bakso << <<      |'
        db 13,10,'+==================================+'
        db 13,10,'|                                  |'
        db 13,10,'|  1. Bakso tulang                 |'
        db 13,10,'|  2. Bakso urat                   |'
        db 13,10,'|  3. Bakso sapi                   |'
        db 13,10,'|  4. Keluar                       |'
        db 13,10,'|                                  |'
        db 13,10,'+==================================+$'

pilih_menu  db 13,10,'MASUKKAN PILIHAN ANDA : $'
success     db 13,10,'SILAHKAN MELAKUKAN PEMBAYARAN PADA KASIR $'
error       db 13,10,'KODE SALAH $'


mulai:
    mov ah,09h
    mov dx,offset menu
    int 21h
    jmp proses 
    jmp error_msg
error_msg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h
proses:
    mov ah,09h
    mov dx,offset pilih_menu
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2

    cmp bh,'0'
    cmp bl,'3'
    je hasil3

    cmp bh,'0'
    cmp bl,'4'
    je hasil4

    jne error_msg

hasil1:
    mov ah,09h
    mov dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    mov dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    mov dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    mov dx,teks4
    int 21h
    int 20h


teks1:      db 13,10,''
            db 13,10,'========================================='
            db 13,10,'=Anda memilih Bakso Tulang untuk dimakan='
            db 13,10,'=             Selamat Makan             ='
            db 13,10,'========================================= $'

teks2:      db 13,10,''
            db 13,10,'======================================='
            db 13,10,'=Anda memilih Bakso Urat untuk dimakan='
            db 13,10,'=             Selamat Makan           ='
            db 13,10,'======================================= $'

teks3:      db 13,10,''
            db 13,10,'======================================='
            db 13,10,'=Anda memilih Bakso Sapi untuk dimakan='
            db 13,10,'=             Selamat Makan           ='
            db 13,10,'======================================= $'

teks4:      db 13,10,''
            db 13,10,'======================'
            db 13,10,'=Pesan Anda Diterima ='
            db 13,10,'=    Terima Kasih    ='
            db 13,10,'====================== $'

end start