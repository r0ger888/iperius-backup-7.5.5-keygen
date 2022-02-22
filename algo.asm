include sha1.asm

Hex2ch 		PROTO	:DWORD,:DWORD,:DWORD
GenKey		PROTO	:DWORD

.data
Magicbytes	db	051h,075h,065h,073h,074h,061h,020h,0C3h,0A8h,020h,06Ch,061h,020h,076h,065h,072h
		    db	073h,069h,06Fh,06Eh,065h,020h,063h,06Fh,06Dh,070h,06Ch,065h,074h,061h,020h,064h
			db	065h,06Ch,020h,070h,072h,06Fh,067h,072h,061h,06Dh,06Dh,061h

ShaCodehash	db	100h dup(0)
Nocode		db	"Copy ur computer code from the app & paste it here.",0
Toolong		db	"too long.",0
Dashh		db	"-",0

.data?
Codebuff	db	60h	dup(?)
Srlbuff		db	60h dup(?)
ShaHash		db  60h dup(?)
part1		db	60h	dup(?)
part2		db	60h	dup(?)
part3		db	60h	dup(?)
part4		db	60h	dup(?)
part5		db	60h	dup(?)
part6		db	60h	dup(?)
part7		db	60h	dup(?)
part8		db	60h	dup(?)
hLen		dd	?

.code
Hex2ch proc HexValue:DWORD,CharValue:DWORD,HexLength:DWORD
    mov esi,[ebp+8]
    mov edi,[ebp+0Ch]
    mov ecx,[ebp+10h]
    @HexToChar:
      lodsb
      mov ah, al
      and ah, 0Fh
      shr al, 4
      add al, '0'
      add ah, '0'
       .if al > '9'
          add al, 'A'-'9'-1
       .endif
       .if ah > '9'
          add ah, 'A'-'9'-1
       .endif
      stosw
    loopd @HexToChar
    ret
Hex2ch endp

GenKey proc hWin:DWORD
	
	invoke GetDlgItemText,hWin,IDC_CODE,addr Codebuff,256
	.if eax == 0
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr Nocode
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,FALSE
	.elseif eax > 54
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr Toolong
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,FALSE
	.elseif
		invoke lstrcat,addr ShaHash,addr Codebuff
		invoke lstrcat,addr ShaHash,addr Magicbytes
		invoke lstrlen,addr ShaHash
		mov hLen,eax
		invoke SHA1Init
		invoke SHA1Update,addr ShaHash,hLen
		invoke SHA1Final
		invoke Hex2ch,addr SHA1Digest,addr ShaCodehash,32
		invoke lstrcpyn,addr part1,addr ShaCodehash,6
		invoke lstrcat,addr Srlbuff,addr part1
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part2,addr ShaCodehash+5,6
		invoke lstrcat,addr Srlbuff,addr part2
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part3,addr ShaCodehash+10,6
		invoke lstrcat,addr Srlbuff,addr part3
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part4,addr ShaCodehash+15,6
		invoke lstrcat,addr Srlbuff,addr part4
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part5,addr ShaCodehash+20,6
		invoke lstrcat,addr Srlbuff,addr part5
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part6,addr ShaCodehash+25,6
		invoke lstrcat,addr Srlbuff,addr part6
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part7,addr ShaCodehash+30,6
		invoke lstrcat,addr Srlbuff,addr part7
		invoke lstrcat,addr Srlbuff,addr Dashh
		invoke lstrcpyn,addr part8,addr ShaCodehash+35,6
		invoke lstrcat,addr Srlbuff,addr part8
		invoke SetDlgItemText,hWin,IDC_SERIAL,addr Srlbuff
		call Clean
		invoke GetDlgItem,hWin,IDB_COPY
		invoke EnableWindow,eax,TRUE
	.endif
	Ret
GenKey endp

Clean proc

	invoke RtlZeroMemory,addr Codebuff,sizeof Codebuff
	invoke RtlZeroMemory,addr ShaCodehash,sizeof ShaCodehash
	invoke RtlZeroMemory,addr Srlbuff,sizeof Srlbuff
	invoke RtlZeroMemory,addr ShaHash,sizeof ShaHash
	Ret
Clean endp

