[org 100h]

                               JMP main
;;//////////////////////////////////////////NAME BUFFER///////////////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////////////
NAME_OF_PLAYER: times 20 db 0
NAME_BUFFER_COUNTER: dw 0

Ballon_pop: dw 0
BG_BUFFER: times 4000 dw 0
PAUSE_BUUFER: times 4000 dw 0
; STRAT_SCREEN_BUUFER: times 4000 dw 0
; GAME_OVER_SCREEN_BUUFER: times 4000 dw 0
PLAYER_SCORE_BUFFER: times 40 db 0

SCORE_BUFFER_COUNTER: dw 0 					   
;;;==============END BACKSPACE CHECK FOR ENTER YOUR NAME LABEL ON NAME INPUT SCREEN============
;;;============================================================================================								   
							   
END_SPACE: dw 0							   
							   
;;;=============================LABEL/VARIABLES FOR INSTRUCTION SCREEN============================
;;;===============================================================================================

GUIDELINE_MSG1: db 'ABOUT GAME',0	
GUIDELINE_MSG2: db '1.Ballons will float from bottom with a character at centre.',0 
GUIDELINE_MSG3: db '2.Position of Ballon is random.',0 
GUIDELINE_MSG4: db '3.Enter character to pop ballon.',0 
GUIDELINE_MSG5: db '4.Your score will increased by 1 for every pop.',0
GUIDELINE_MSG6: db '5.Your have total of 2:00 minutes for 1 game.',0
GUIDELINE_MSG7: db '6.The characters in Baloon are Lower case.',0  	 
GUIDELINE_MSG8: db 'Hope you guys will enjoy the game.',0 
GUIDELINE_MSG9: db 'BRACE YOURSELF- An epic Adventure Awaits for you.',0
GUIDELINE_MSG10: db 'Press Enter To Countinue.',0  	 	 					
							   
;;;=============================LABEL/VARIABLES FOR GET NAME OF PLAYER SCREEN============================
;;;======================================================================================================	
							   
get_name: db 'ENTER YOUR NAME:'				
len_input: dw 15

;;;=============================THANK YOU MSG FOR AFTER EXIT SCREEN============================
;;;============================================================================================		

thank: db 'Thank You'

;;;=============================NAVIGATION FOR END SCREEN=============================
;;;====================================================================================		

navigation1end: db 0x0F
navigation2end: db 0x2F
navigation12end: db 0x2F
navigation22end: db 0x0F
nav_countend: db 0
first_movementend: db 0

;;;=============================NAVIGATION FOR START SCREEN============================
;;;====================================================================================		

navigation1: db 0x00
navigation2: db 0x40
navigation12: db 0x4F
navigation22: db 0x0F
nav_count: db 0
first_movement: db 0

;;;=============================GAME SCREEN WORDS============================
;;;==========================================================================		

; Variables
minutes: db 0
seconds: db 1
score: dw 0

; Messages
timeMsg: db 'TIME: ', 0
scoreMsg: db 'SCORE: ', 0


;;;====================START/EXIT/INSTRUCTION---RESTART/EXIT/PLAYER_SCORE/ISTRUCTION=====================
;;;======================================================================================================		

msg1_: db 'Restart'
size1_: dw 6
msg2_: db 'Exit'
size2_: dw 3
msg3_: db 'Please select an option and Press Enter'
size3_: dw 38
msg4_: db 'YOUR_SCORE:'
size4_: dw 10
msg1: db 'Start'
size1: dw 4
msg2: db 'Exit'
size2: dw 3
msg3: db 'Please select an option and Press Enter'
size3: dw 38


;;;=============================INPUT FUNCTION TO GET INPUT FROM USER============================
;;;==============================================================================================		


input: 
       mov ah,0x01
       int 0x16
	   jnz get
	   jz doneinput
	   
get:   mov ah,0x00
	   int 0x16
	   
doneinput:
             ret	

;;;=============================SLEEP FUNCTION FOR DELAY============================
;;;=================================================================================		

sleep: pusha
       mov cx,0xFFFF
delay:
      sub cx,1
	  cmp cx,0
	  jne delay
	  popa
	  ret
	  
;;;=============================CLEAR SCREEN FOR INSTRUCTION SCREEN============================
;;;============================================================================================		 
	  
clearscreen_GUIDELINE: push ES
					 push AX
					 push di
					 
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
nextloc_GUIDELINE:    mov word[es:di]	,0x0720
					add di,2
					cmp di,4000
					jne nextloc_GUIDELINE


					pop di
					pop AX
					pop ES

					ret			
	  
 
;;;=============================CLEAR SCREEN FOR START SCREEN============================
;;;======================================================================================		 

clrscr:pusha
	push ax
	push es
	
	push di
	
	mov ax , 0xb800
	mov di , 0
	mov es , ax
	
	nextchar:
		mov ax , 0x00DB
		mov word [es:di] , ax
		add di , 2
		cmp di , 4000
		jne nextchar	

      pop di
	  pop es
	  pop ax
	  popa
      ret  
	  
;;;=============================CLEAR SCREEN FOR NAME INPUT SCREEN============================
;;;===========================================================================================		  
	  
 clearscreen_input: push ES
					 push AX
					 push di
					 
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
		nextloc_input:    mov word[es:di]	,0x0EDB
					add di,2
					cmp di,4000
					jne nextloc_input


					pop di
					pop AX
					pop ES

					ret	 

;;;=============================START SCREEN LETTERS============================
;;;=============================================================================			  
	  
print_P1:
        pusha
		
		
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		
		mov word[es:490],ax
		mov word[es:492],ax
		mov word[es:494],ax
		mov word[es:496],ax
		mov word[es:498],ax
		mov word[es:500],ax
		
		mov word[es:650],ax
		mov word[es:652],ax
		mov word[es:664],ax
		mov word[es:660],ax
		mov word[es:662],ax
		
		mov word[es:810],ax
		mov word[es:812],ax
		mov word[es:820],ax
		mov word[es:822],ax
		mov word[es:824],ax
		mov word[es:826],ax
		
		mov word[es:970],ax
		mov word[es:972],ax
		mov word[es:974],ax
		mov word[es:976],ax
		mov word[es:978],ax
		mov word[es:980],ax
		mov word[es:982],ax
		mov word[es:984],ax
		
		mov word[es:1130],ax
		mov word[es:1132],ax
		mov word[es:1134],ax
		mov word[es:1136],ax
		mov word[es:1138],ax
		mov word[es:1140],ax
		
		mov word[es:1290],ax
		mov word[es:1292],ax
		

		mov word[es:1450],ax
		mov word[es:1452],ax
		
		
		mov word[es:1610],ax
		mov word[es:1612],ax
		
	  popa
	  ret
	  
print_O:
        pusha
		
		
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,22
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax
		mov word[es:di+1452],ax
		mov word[es:di+1462],ax
		
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		mov word[es:di+1620],ax
	  popa
	  ret
	  
print_P2:
        pusha
		
		mov ah,0x4E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,44
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+664],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		
		
		mov word[es:di+1610],ax
		mov word[es:di+1612],ax

		
	  popa
	  ret
	  
print_R:
        pusha
		
		mov ah,0x09
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1448
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+664],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		
		mov word[es:di+1610],ax
		mov word[es:di+1612],ax
		mov word[es:di+1622],ax
		mov word[es:di+1624],ax
		
	  popa
	  ret
	  	  
print_U:
        pusha
		
		mov ah,0x09
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1470
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+502],ax
		mov word[es:di+504],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax
		
		
		mov word[es:di+1452],ax

		mov word[es:di+1462],ax

		
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		mov word[es:di+1620],ax

	  popa
	  ret
	  
print_S:
        pusha
		
		mov ah,0x09
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1492
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+808],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		
		
		mov word[es:di+1302],ax
		mov word[es:di+1300],ax
		mov word[es:di+1304],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		
		mov word[es:di+1612],ax
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1620],ax
		mov word[es:di+1618],ax
		
	  popa
	  ret
	  
print_H:
        pusha
		
		mov ah,0x09
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1512
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+502],ax
		mov word[es:di+504],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1462],ax
		mov word[es:di+1464],ax
		
		
		mov word[es:di+1610],ax
		mov word[es:di+1612],ax
		mov word[es:di+1622],ax
		mov word[es:di+1624],ax
		
		
	  popa
	  ret
	  
TITLE_BALLON_CURR_POS: dw 0	  
TITLE_BALOON_CLEAR:pusha

         mov di,[TITLE_BALLON_CURR_POS]
		 add di,160
         mov ax,0x0720
		 mov cx,0x0720
		 mov dx,0x0720
     	mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+966],ax
		mov word[es:di+970],dx
		mov word[es:di+974],dx
		mov word[es:di+972],dx
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1138],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1294],ax
		mov word[es:di+1296],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1452],ax
		
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		
        mov word[es:di+1776],cx
		mov word[es:di+1774+160-4],cx
		mov word[es:di+1774+160-2],cx
		mov word[es:di+1774+160],cx
		mov word[es:di+1776+320],cx
		mov word[es:di+1778+480+4],cx
		mov word[es:di+1778+480+2],cx
		mov word[es:di+1778+480],cx
		mov word[es:di+1776+640],cx
		mov word[es:di+1776+640-4],cx
		mov word[es:di+1776+640-2],cx
		mov word[es:di+1776+640+2],cx
		mov word[es:di+1776+640+4],cx

popa 
ret		
;;;=============================START SCREEN============================
;;;=====================================================================			  
	  
Draw_title_Baloon:	
  pusha
		
		mov ah,0x05
		mov al,0xDB
		mov dh,0x0f
		mov dl,0xDB
		mov ch,0x0f
		mov cl,0x05
		mov si,0xb800
		mov es,si
		mov word[TITLE_BALLON_CURR_POS],-220
		
		mov bx,0
		mov bp,0
	;call sleep
		
        call clrscr
       	call print_P1
			call print_O
			call print_P2
			call  print_R
			call print_U
			call print_S
			call print_H
			call Instruction
redraw:			
			call START
			call EXIT

		call TITLE_BALOON_CLEAR	
		mov di,[TITLE_BALLON_CURR_POS]
         mov ah,0x05
		mov al,0xDB
     	mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+966],ax
		mov word[es:di+970],dx
		mov word[es:di+974],dx
		mov word[es:di+972],dx
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1138],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1294],ax
		mov word[es:di+1296],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1452],ax
		
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		
        mov word[es:di+1776],cx
		mov word[es:di+1774+160+bx],cx
		mov word[es:di+1776+320],cx
		mov word[es:di+1778+480+bp],cx
		mov word[es:di+1776+640],cx
		
		call sleep
        sub word[TITLE_BALLON_CURR_POS],160
		sub bp,4
		add bx,4
		call sleep
		
		call input
		cmp al,13
		je done
		cmp al,'s'
		je update_nav
		cmp al,'w'
		je update_nav
retu1:		call sleep
cmp al,13
		jne up
retu:		cmp bx,4
		jg update_BX
again1:		cmp bp,-4
		jl update_BP
again:		cmp word[TITLE_BALLON_CURR_POS],-2460
		jge redraw
		cmp word[TITLE_BALLON_CURR_POS],-2460
		je update_DI
update_DI: mov word[TITLE_BALLON_CURR_POS],3780
           jmp redraw		
update_BP: mov bp,0
           jmp  again    
update_BX: mov bx,0
           jmp  again1   		   
up:jmp retu
	 update_nav: cmp byte[first_movement],0
	 je lets_start
	 cmp byte[first_movement],1
	 jge lets_start2
				 cmp byte[nav_count],1
				 je last
	lets_start:			cmp al,'s'
				je count_inc
	back_to_1:	cmp byte[nav_count],0
				 je last
	lets_start2:            cmp al,'w'
				je count_dec
	back_to_2:     push ax
			   mov al,byte[navigation22]	  
			  XCHG al,[navigation12]
			  mov byte[navigation22],al
			   mov al,byte[navigation2]	  
			  XCHG al,[navigation1]
			  mov byte[navigation2],al
			  pop ax
	last:		  jmp  retu1
	count_inc:  mov byte[nav_count],1
				add byte[first_movement],1
			   jmp back_to_1
	 count_dec:cmp byte[first_movement],1
				 mov byte[nav_count],0
				 mov byte[first_movement],0
			   jmp back_to_2
		   
done: popa
      cmp byte[first_movement],1
	  jge the_end
	  ret  

;;;=============================START MSG ON SCREEN============================
;;;============================================================================			  
	  
START:
        pusha
		mov di,2544
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,[navigation2]
		mov cl,' '
		mov  word[es:di+10],cx
		mov  word[es:di+1],cx
		mov  word[es:di-2],cx
		mov ch,[navigation12]
loop1:		mov cl,[msg1+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size1]
		jle loop1
     popa 
     ret	 

;;;=============================EXIT MSG ON START SCREEN============================
;;;=================================================================================		
	 
EXIT:
        pusha
		mov di,2866
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,[navigation1]
		mov cl,' '
		mov  word[es:di+8],cx
		mov  word[es:di-2],cx
		mov ch,[navigation22]
loop2:		mov cl,[msg2+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size2]
		jle loop2
     popa 
     ret
	 
;;;=============================INSTRUCTION ON START SCREEN============================
;;;====================================================================================		
	 
Instruction:
        pusha
		mov di,3692
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x0A
loop3:		mov cl,[msg3+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size3]
		jle loop3
     popa 
     ret 

;;;=============================CLEAR SCREEN FOR GAME OVER============================
;;;===================================================================================		

clrscr_:
	push ax
	push es
	
	push di
	
	mov ax , 0xb800
	mov di , 0
	mov es , ax
	
	nextchar_:
		mov ah , 0x00
		mov al,' '
		mov word [es:di] , ax
		add di , 2
		cmp di , 4000
		jne nextchar_	

      pop di
	  pop es
	  pop ax
      ret  
	  
	  
;;;=============================GAME OVER SCREEN LETTERS============================
;;;=================================================================================

			  
print_G_:
        pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-88
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+808],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+984],ax
		mov word[es:di+968],ax
		mov word[es:di+982],ax
		mov word[es:di+980],ax
		mov word[es:di+978],ax
		
		 mov word[es:di+1132],ax
		 mov word[es:di+1130],ax
		 mov word[es:di+1142],ax
		 mov word[es:di+1144],ax
		
		 mov word[es:di+1294],ax
		 mov word[es:di+1296],ax
		 mov word[es:di+1298],ax
		 mov word[es:di+1300],ax

		
	  popa
	  ret
	  
print_A_:
        pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-230
	
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+658],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1462],ax
		mov word[es:di+1464],ax

		
	  popa
	  ret	  
print_M_:
        pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-210
	    
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		 mov word[es:di+652],ax
		 mov word[es:di+652+160],ax
		 mov word[es:di+654+160],ax
		 mov word[es:di+656+320],ax
		 mov word[es:di+658+320],ax
		 mov word[es:di+660+160],ax
		 mov word[es:di+662+160],ax
		 mov word[es:di+664+160],ax
		  mov word[es:di+662],ax
		mov word[es:di+664],ax
		mov word[es:di+666],ax
		
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		
		mov word[es:di+968],ax
		mov word[es:di+970],ax
		mov word[es:di+984],ax
		mov word[es:di+986],ax
		
		mov word[es:di+1128],ax
		mov word[es:di+1130],ax
		mov word[es:di+1144],ax
		mov word[es:di+1146],ax
		
		mov word[es:di+1288],ax
		mov word[es:di+1290],ax
		mov word[es:di+1304],ax
		mov word[es:di+1306],ax

		mov word[es:di+1448],ax
		mov word[es:di+1450],ax
		mov word[es:di+1464],ax
		mov word[es:di+1466],ax
		
		
	  popa
	  ret	  	  
	  
print_E1_:
        pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-190
        
        mov word[es:di+650],ax		
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+658],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		mov word[es:di+1464],ax

		
	  popa
	  ret	  
	  
print_O_:
        pusha
		
		
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1020
		mov word[es:di+494+160],ax
		mov word[es:di+496+160],ax
		mov word[es:di+498+160],ax
		mov word[es:di+500+160],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		 mov word[es:di+1290],ax
		 mov word[es:di+1292],ax
		 mov word[es:di+1302],ax
		 mov word[es:di+1304],ax

		
		mov word[es:di+1614-160],ax
		mov word[es:di+1616-160],ax
		mov word[es:di+1618-160],ax
		mov word[es:di+1620-160],ax
	  popa
	  ret

print_V_:
        pusha
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1040
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		 mov word[es:di+1292],ax
		 mov word[es:di+1302],ax
        mov word[es:di+1454-160],ax
		mov word[es:di+1460-160],ax

		mov word[es:di+1616-160],ax
		mov word[es:di+1618-160],ax
		

	  popa
	  ret
	  
print_E2_:
        pusha
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1058
        
        mov word[es:di+650],ax		
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+658],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		mov word[es:di+1464],ax

		
	  popa
	  ret	

print_R_:
        pusha
		
		mov ah,0x0E
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,1078
		mov word[es:di+490+160],ax
		mov word[es:di+492+160],ax
		mov word[es:di+494+160],ax
		mov word[es:di+496+160],ax
		mov word[es:di+498+160],ax
		mov word[es:di+500+160],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
				
	  popa
	  ret


END_BALLON_CURR_POS: dw 0	  
END_BALOON_CLEAR:pusha

         mov di,[END_BALLON_CURR_POS]
		 add di,160
         mov ax,0x0720
		 mov cx,0x0720
		 mov dx,0x0720
     	mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+966],ax
		mov word[es:di+970],dx
		mov word[es:di+974],dx
		mov word[es:di+972],dx
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1138],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1294],ax
		mov word[es:di+1296],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1452],ax
		
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		
        mov word[es:di+1776],cx
		mov word[es:di+1774+160-4],cx
		mov word[es:di+1774+160-2],cx
		mov word[es:di+1774+160],cx
		mov word[es:di+1776+320],cx
		mov word[es:di+1778+480+4],cx
		mov word[es:di+1778+480+2],cx
		mov word[es:di+1778+480],cx
		mov word[es:di+1776+640],cx
		mov word[es:di+1776+640-4],cx
		mov word[es:di+1776+640-2],cx
		mov word[es:di+1776+640+2],cx
		mov word[es:di+1776+640+4],cx
		mov word[es:di+1776+800+4],cx
		mov word[es:di+1776+800+2],cx
		mov word[es:di+1776+800],cx
		mov word[es:di+1776+800-4],cx
		mov word[es:di+1776+800-2],cx

popa 
ret	

;;;=============================GAME OVER SCREEN============================
;;;=========================================================================		

Draw_end_Baloon:	
  pusha
		
		mov ah,0x0C
		mov al,0xDB
		mov dh,0x0f
		mov dl,0xDB
		mov ch,0x0F
		mov cl,0x06
		mov si,0xb800
		mov es,si
		mov word[END_BALLON_CURR_POS],-300
		mov bx,0
		mov bp,0
	




        call clrscr_
       	call print_G_		  
	      call print_A_
		  call print_M_
		  call print_E1_
		  call print_O_
		  call print_V_
		  call print_E2_
		  call print_R_
		  call Y_S
			call Instruction_
redraw_:			
			call START_
			call EXIT_
			mov di,[END_BALLON_CURR_POS]
			call END_BALOON_CLEAR
			        mov ah,0x0C
		mov al,0xDB
     	mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+966],ax
		mov word[es:di+970],dx
		mov word[es:di+974],dx
		mov word[es:di+972],dx
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1138],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1294],ax
		mov word[es:di+1296],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax

		mov word[es:di+1452],ax
		
		mov word[es:di+1454],ax
		mov word[es:di+1456],ax
		mov word[es:di+1458],ax
		
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
	
		mov word[es:di+1776],cx
		mov word[es:di+1774+160+bx],cx
		mov word[es:di+1778+318],cx
		mov word[es:di+1780+478+bp],cx
		mov word[es:di+1778+638],cx
		
			 call sleep
        sub word[END_BALLON_CURR_POS],160
		sub bp,4
		add bx,4
        call sleep		
	    call sleep
		call input
		cmp al,13
		je doneend
		cmp al,'s'
		je update_navend
		cmp al,'w'
		je update_navend
		cmp al,'S'
		je update_navend
		cmp al,'W'
		je update_navend
retu1end:		cmp al,13
		jne upend
		call sleep
retuend:		cmp bx,4
		jg update_BXend
again1end:		cmp bp,-4
		jl update_BPend
againend:		cmp word[END_BALLON_CURR_POS],-2680
		jge redraw_
		cmp word[END_BALLON_CURR_POS],-2520
		je update_DIend
update_DIend: mov word[END_BALLON_CURR_POS],2900
           jmp redraw_		
update_BPend: mov bp,0
           jmp  againend    
update_BXend: mov bx,0
           jmp  again1end   		   
upend:     jmp retuend
	 update_navend: cmp byte[first_movementend],0
	 je lets_startend
	 cmp byte[first_movementend],1
	 jge lets_start2end
				 cmp byte[nav_countend],1
				 je lastend
	lets_startend:			cmp al,'s'
				je count_incend
				cmp al,'S'
				je count_incend
	back_to_1end:	cmp byte[nav_count],0
				 je lastend
	lets_start2end:            cmp al,'w'
				je count_decend
				 cmp al,'W'
				je count_decend
	back_to_2end:     push ax
			   mov al,byte[navigation22end]	  
			  XCHG al,[navigation12end]
			  mov byte[navigation22end],al
			   mov al,byte[navigation2end]	  
			  XCHG al,[navigation1end]
			  mov byte[navigation2end],al
			  pop ax
	lastend:		  jmp  retu1end
	count_incend:  mov byte[nav_countend],1
				add byte[first_movementend],1
			   jmp back_to_1end
	 count_decend:cmp byte[first_movementend],1
				 mov byte[nav_countend],0
				 mov byte[first_movementend],0
			   jmp back_to_2end
		   
doneend: popa
      cmp byte[first_movementend],1
	  jge the_end
	  ret

	  
;;;=============================RE_START MSG ON SCREEN============================
;;;===============================================================================			  
START_:
        pusha
		mov di,2404
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,[navigation2end]
		mov cl,' '
		mov  word[es:di+10],cx
		mov  word[es:di+1],cx
		mov  word[es:di-2],cx
		mov ch,[navigation12end]
loop1_:		mov cl,[msg1_+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size1_]
		jle loop1_
     popa 
     ret	 
;;;=============================EXIT ON  SCREEN============================
;;;========================================================================			 
EXIT_:
        pusha
		mov di,2726
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,[navigation1end]
		mov cl,' '
		mov  word[es:di+8],cx
		mov  word[es:di-2],cx
		mov ch,[navigation22end]
loop2_:		mov cl,[msg2_+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size2_]
		jle loop2_
     popa 
     ret
	 
Y_S:
        pusha
		mov di,3438
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x01
		mov cl,' '
		mov  word[es:di+8],cx
		mov  word[es:di-2],cx
		mov ch,0xE
loop4_:		mov cl,[msg4_+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size4_]
		jle loop4_
		mov si,0
loop4_1:		mov cl,[SCORE_digit_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		;cmp byte[SCORE_digit_GAME+si],0
		cmp si,3
		jl loop4_1		
		
     popa 
     ret	 
Instruction_:
        pusha
		mov di,3110
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x0A
loop3_:		mov cl,[msg3_+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size3_]
		jle loop3_
     popa 
     ret

;;;=============================GET NAME OF PLAYER SCREEN============================
;;;==================================================================================

print_input:
          pusha
		  	MOV		AX, 0xB800
			MOV		ES, AX
			mov si,0
			mov di,0
				
next_input:         mov bh,0x0e
         			mov bl,[get_name+si]
          			mov word[es:1650+di],bx
					add di,2
					add si,1
					cmp si,[len_input]
					jle next_input
					
                    popa
                    ret
GET_PLAYER_NAME:          pusha  
					      call clearscreen_input
						  call print_input
						  mov di,32
						 
retake:	            call input
		   			jz retake
					cmp al,8
					je DELETE
					cmp al,13
					je INPUT_END
print1:                 
                        mov ah,0x0f
						mov bx,[NAME_BUFFER_COUNTER]
						mov byte[NAME_OF_PLAYER+bx],al
						add word[NAME_BUFFER_COUNTER],1
          				mov word[es:1650+di],ax
						add di,2
						add word[END_SPACE],1
                        jmp retake						
DELETE:    sub word[NAME_BUFFER_COUNTER],1
            cmp word[END_SPACE],0
            je retake
			sub word[END_SPACE],1
          	sub di,2
          	mov word[es:1650+di],0x0EDB
		    jmp retake			
INPUT_END: popa 
           ret		

;;;=============================GAME INSTRUCTION SCREEN============================
;;;================================================================================

	 
PRINT_I_GUIDELINE:
        pusha
      		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-326
	
	
	    mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax		
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		
		mov word[es:di+1448],ax
		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1454],ax
		
		
	  popa
	  ret	

PRINT_N_GUIDELINE:	 
	   pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-316
	    
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		 mov word[es:di+652],ax
		 mov word[es:di+652+160],ax
		 mov word[es:di+654+160],ax
		 mov word[es:di+656+320],ax
		mov word[es:di+664],ax
		mov word[es:di+666],ax
		
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		
		mov word[es:di+968],ax
		mov word[es:di+970],ax
		mov word[es:di+984],ax
		mov word[es:di+986],ax
		
		mov word[es:di+1128],ax
		mov word[es:di+1130],ax
		mov word[es:di+1138],ax
		mov word[es:di+1144],ax
		mov word[es:di+1146],ax
		
		mov word[es:di+1288],ax
		mov word[es:di+1290],ax
		mov word[es:di+1300],ax
		mov word[es:di+1304],ax
		mov word[es:di+1306],ax

		mov word[es:di+1448],ax
		mov word[es:di+1450],ax
		mov word[es:di+1462],ax
		mov word[es:di+1464],ax
		mov word[es:di+1466],ax
		
		
	  popa
	  ret	  	  
	  
PRINT_S_GUIDELINE:
         pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-136
		mov word[es:di+492],0x0FDC
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],0x0FDC
		mov word[es:di+500+160],0x0FDF
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		
		mov word[es:di+972-160],0x0FDF
		mov word[es:di+976-160],0x0FDC
		mov word[es:di+974-160],ax
		
		mov word[es:di+818+160],0x0FDF
		mov word[es:di+820+160],ax
		mov word[es:di+822+160],0x0FDC
		
		mov word[es:di+1142-2],0x0FDB
		mov word[es:di+1142],0x0FDF
	
		  mov word[es:di+1292],0x0FDF
		 mov word[es:di+1294],ax
		 mov word[es:di+1296],ax
		 mov word[es:di+1298],0x0FDF
		 mov word[es:di+1290-160],0x0FDC

		
	  popa
	  ret


PRINT_T_GUIDELINE:		
	 pusha
      		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-278
	
	    	
		mov word[es:di+646],ax
	    mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax		
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
	
		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		
		
		
	  popa
	  ret

PRINT_R_GUIDELINE:
	   pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-270

		mov word[es:di+492+160],0x0FDC
		mov word[es:di+494+160],ax
		mov word[es:di+496+160],ax
		mov word[es:di+498+160],ax
		mov word[es:di+500+160],ax
		mov word[es:di+662],0x0FDC
	
		mov word[es:di+812],ax
		mov word[es:di+822],ax

		mov word[es:di+972],ax
		mov word[es:di+982],ax
	
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],0x0FDF

		mov word[es:di+1292],ax
		mov word[es:di+1296],0x0FDF
		mov word[es:di+1298],0x0FDC

		mov word[es:di+1452],ax
		mov word[es:di+1460],0x0FDF
		mov word[es:di+1462],0x0FDC
				
	  popa
	  ret
	  
PRINT_U_GUIDELINE:
pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-254
	
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax
		
		
		mov word[es:di+1452],0x0FDF

		mov word[es:di+1462],0x0FDF

		
		mov word[es:di+1614-160],ax
		mov word[es:di+1616-160],ax
		mov word[es:di+1618-160],ax
		mov word[es:di+1620-160],ax

	  popa
	  ret

PRINT_C_GUIDELINE:pusha
        mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-238
	
		mov word[es:di+652],0x0FDC
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+658],ax
		mov word[es:di+660],0x0FDC
		mov word[es:di+662+160],0x0FDF
		
		mov word[es:di+812],ax
		
		mov word[es:di+972],ax
		
		mov word[es:di+1132],ax
	
		mov word[es:di+1292],ax
		
		mov word[es:di+1452],0x0FDF
        mov word[es:di+1462-160],0x0FDC
		
		mov word[es:di+1614-160],ax
		mov word[es:di+1616-160],ax
		mov word[es:di+1618-160],ax
		mov word[es:di+1620-160],0x0FDF

	  popa
	  ret

PRINT_T2_GUIDELINE:
         pusha
      		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-218
	
	    	
		mov word[es:di+646],ax
	    mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax		
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
	
		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		
		
		
	  popa
	  ret

PRINT_I2_GUIDELINE:
         pusha
      	mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-206
	
	
	    mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax		
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		
		mov word[es:di+1448],ax
		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1454],ax
		
		
	  popa
	  ret	

PRINT_O_GUIDELINE:
        pusha
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-200
		mov word[es:di+496+160],ax
		mov word[es:di+498+160],ax
		mov word[es:di+500+160],ax

		mov word[es:di+814],ax
		mov word[es:di+822],ax

		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+984],ax
		mov word[es:di+982],ax
	
		mov word[es:di+1134],ax
		mov word[es:di+1132],ax
		mov word[es:di+1144],ax
		mov word[es:di+1142],ax

		mov word[es:di+1294],ax
		mov word[es:di+1302],ax

		mov word[es:di+1616-160],ax
		mov word[es:di+1618-160],ax
		mov word[es:di+1620-160],ax
	  popa
	  ret


PRINT_N2_GUIDELINE:
	  pusha
		
		mov ah,0x0F
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,-182
	    
		mov word[es:di+650],ax
		 mov word[es:di+652+160],ax
		 mov word[es:di+654+320],ax
		mov word[es:di+660],ax
		
		mov word[es:di+810],ax
		mov word[es:di+820],ax

		mov word[es:di+970],ax
		mov word[es:di+980],ax

		mov word[es:di+1130],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax

		mov word[es:di+1290],ax
		mov word[es:di+1300],ax
		mov word[es:di+1300],ax

		mov word[es:di+1450],ax
		mov word[es:di+1460],ax
        mov word[es:di+1458-160],ax						
		
	  popa
	  ret	  	

PRINT_GUIDELINES:
                 pusha
				 mov ax,0xb800
                 mov es,AX
				 mov si,0
				 mov di,1674
				 
				 mov ah,0x0F
				 
GUIDE_REPEAT:        mov al,byte[GUIDELINE_MSG1+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT
					 
				mov si,0
				mov di,1920
					 
GUIDE_REPEAT1:        mov al,byte[GUIDELINE_MSG2+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT1 

				mov si,0
				mov di,2080
					 
GUIDE_REPEAT2:        mov al,byte[GUIDELINE_MSG3+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT2	

				mov si,0
				mov di,2240
					 
GUIDE_REPEAT3:        mov al,byte[GUIDELINE_MSG4+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT3

                mov si,0
				mov di,2400
					 
GUIDE_REPEAT4:        mov al,byte[GUIDELINE_MSG5+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT4
					 
					 mov si,0
				     mov di,2560

GUIDE_REPEAT5:        mov al,byte[GUIDELINE_MSG6+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT5						 
					 
					 
					 mov si,0
				     mov di,2720

GUIDE_REPEAT6:        mov al,byte[GUIDELINE_MSG7+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT6						 

                     mov si,0
				     mov di,3090
					 mov ah,0x0C

GUIDE_REPEAT7:        mov al,byte[GUIDELINE_MSG8+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT7
					 
					 
					 mov si,0
				     mov di,3716
					 mov ah,0x09
					 
GUIDE_REPEAT8:        mov al,byte[GUIDELINE_MSG9+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp al,0
					 jne GUIDE_REPEAT8
                     
					 mov ah,0x30
					 mov si,0
				     mov di,3418
					 
GUIDE_REPEAT9:        mov al,byte[GUIDELINE_MSG10+si]
      				 mov word[es:di],ax
				     add di,2
					 add si,1
					 cmp byte[GUIDELINE_MSG10+si],0
					 jne GUIDE_REPEAT9						 					 
					 
                popa  
				ret
	  
GAME_GUIDE: pusha
call clearscreen_GUIDELINE
      call PRINT_I_GUIDELINE
	  call PRINT_N_GUIDELINE
	  call PRINT_S_GUIDELINE
	  call PRINT_T_GUIDELINE
	  call PRINT_R_GUIDELINE
      call PRINT_U_GUIDELINE
	  call PRINT_C_GUIDELINE
	  call PRINT_T2_GUIDELINE
	  call PRINT_I2_GUIDELINE
	  call PRINT_O_GUIDELINE
	  call PRINT_N2_GUIDELINE
	  call PRINT_GUIDELINES
       
GUIDE_RE_ENTER:	  call input
	   cmp al,13
	   jne GUIDE_RE_ENTER


 popa 
 ret  
						  
;;;=============================MAIN============================
;;;=============================================================
main:     mov al,00110110b
         out 0x43,al
           mov ax,0
           out 0x40,al
		   mov al,ah
		   out 0x40,al

            
	        call clrscr
		
			call Draw_title_Baloon
			call GET_PLAYER_NAME
			;call PLAY_START_SOUND
			call GAME_GUIDE
			
REBACK:		mov byte[gameOver_],0
            call SELECTING_mode
            cmp  word[CURRENT_mode],3
			jne TIME_NHI_HA
            call SELECTING_LEVEL
TIME_NHI_HA:call PLAY_BG_SOUND_FORGAME
            call Print_secren2
			mov byte[gameOver_],1
			call stopMusic
            mov byte[GAME_END_SO],0
			mov byte[TIME_DIGIT],'2'
			mov byte[TIME_DIGIT+2],'0'
			mov byte[TIME_DIGIT+3],'0'
			call SAVE_MAX_SCORES
			call play_gameover_sound
			call Draw_end_Baloon
			mov byte[SCORE_digit_GAME],'0'
			mov byte[SCORE_digit_GAME+2],'0'
			mov byte[SCORE_digit_GAME+1],'0'
			xor ax,ax
			 
              call unhookTimerInterrupt
            jmp REBACK


the_end: call clearscreen_LEADER
         call DISPLAY_MAX_SCORES 
         
          mov ax, 0xb800
		  mov es,ax
		  mov di,3898
		  mov bx,0
		  mov ah,0x0F
		 mov si,0
loooooop:	     mov al,[thank+si]
             	  mov word[es:di+bx],ax
                 add bx,2
				 add si,1
                  cmp bx,18
				  jl loooooop 
				  mov si,0
				   mov word[es:di+bx],0x0720
				   add bx,2
	             cmp cx,7;[NAME_BUFFER_COUNTER]
NMAE:	         mov al,[NAME_OF_PLAYER+si]
             	  mov word[es:di+bx],ax
                 add bx,2
				 add si,1
				 cmp byte[NAME_OF_PLAYER+si-1],0
				 jne NMAE
 			mov ax,0x4C00
			int 21h
			

;;;=============================CLEARS SCREEN FOR GAME SCREEN============================
;;;======================================================================================		
	  
clrscr_sky:
	push ax
	push es
	
	push di
	
	mov ax , 0xb800
	mov di , 0
	mov es , ax
	
	nextchar_sky:
		mov ah,0x30
        mov al,' '
		mov word [es:di] , ax
		add di , 2
		cmp di , 4000
		jne nextchar_sky	

      pop di
	  pop es
	  pop ax
      ret  
	  
			
;;;=============================GAME SCREEN============================
;;;====================================================================			

            
		
msg_score_GAME: db 'SCORE:',0
SCORE_digit_GAME:	db 48,48 ,48,0,0			
msg1_GAME: db 'Resume'
size1_GAME: dw 5
msg2_GAME: db 'End'
size2_GAME: dw 2
msg3_GAME: db 'Press SPACE to Resume and 1 to End'
size3_GAME: dw 33
msg4_GAME: db 'Remaining Time:'
size4_GAME: dw 14
msg5_GAME: db 'Current Score:'
size5_GAME: dw 13
tick_count: db 0
TIME_DIGIT: db 50,':',48,48,0x00	
TIME_DIGIT_VAR: db 'TIME:',0		

POSITION_OF_BALLON_1: dw  4006,4184,4360,4712
POSITION_OF_BALLON_2: dw  4210,4402,4710,4350
POSITION_OF_BALLON_3: dw  4732,5026,4788,4166
POSITION_OF_BALLON_4: dw  4296,4756,4108,4606	
POSITION_OF_BALLON_5: dw  4438,4936,4054,4570	
POSITION_OF_BALLON_6: dw  4670,4650,4582,4434	

CURRENT_POS_B1: dw 0
CURRENT_POS_B2: dw 0
CURRENT_POS_B3: dw 0
CURRENT_POS_B4: dw 0
CURRENT_POS_B5: dw 0
CURRENT_POS_B6: dw 0

B1_COUNTER: dw 0
B2_COUNTER: dw 0
B3_COUNTER: dw 0
B4_COUNTER: dw 0
B5_COUNTER: dw 0
B6_COUNTER: dw 0

B1_CHARACTER: db 'azqxswedcvfrbgtyhnmjuikolp'
B2_CHARACTER: db 'mjuikolpyhntgbvfredcxswqaz'
B3_CHARACTER: db 'qweasdzxcrtyfghvbnuiopjklm'
B4_CHARACTER: db 'mqnwbevrctxyzuaisodpflgkhj'
B5_CHARACTER: db 'qpalmzwoksnxbcdjieruhfbvgt'
B6_CHARACTER: db 'zxsaqwerfdcvtynbghuioplkjm'
; BONUS_NO_CHARACTER: db '1234567898765432345677888'
; BONUS_UPPER_CHARACTER: db 'QWERTYUJHVCDSDFGHNHBVCFXD'


B1_CHARACTER_COUNTER: dw 0
B2_CHARACTER_COUNTER: dw 0
B3_CHARACTER_COUNTER: dw 0
B4_CHARACTER_COUNTER: dw 0
B5_CHARACTER_COUNTER: dw 0
B6_CHARACTER_COUNTER: dw 0

GAME_END_SO: db 0
	   
CURRENT_ENTERED_CHARACTER: db 0
B1_CURRENT_CHARACTER: db 0
B2_CURRENT_CHARACTER: db 0
B3_CURRENT_CHARACTER: db 0
B4_CURRENT_CHARACTER: db 0
B5_CURRENT_CHARACTER: db 0
B6_CURRENT_CHARACTER: db 0    

B1_COLOR_COUNTER: dw 0 
B2_COLOR_COUNTER: dw 4
B3_COLOR_COUNTER: dw 3 
B4_COLOR_COUNTER: dw 5 
B5_COLOR_COUNTER: dw 1 
B6_COLOR_COUNTER: dw 6 

B1_COLOR: db 0x01,0x04,0x05,0x06,0x08,0x0C,0x0D
B2_COLOR: db 0x01,0x04,0x05,0x06,0x08,0x0C,0x0D
B3_COLOR: db 0x01,0x04,0x05,0x06,0x08,0x0C,0x0D
B4_COLOR: db 0x01,0x04,0x05,0x06,0x08,0x0C,0x0D
B5_COLOR: db 0x01,0x02,0x04,0x05,0x06,0x0C,0x0D
B6_COLOR: db 0x01,0x02,0x04,0x05,0x06,0x0C,0x0D

SURVIVAL_COUNTER: dw 0
LIFE_LENGTH: dw 3
LIFE_LABEl: db 'LIFE:'

;;//////////////////////////ENDLESS MODE///////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////
clearscreen_ENDLESS: 
					pusha
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
		 nextloc_ENDLESS:  
					mov word[es:di]	,0x0ADC
					add di,2
					mov word[es:di]	,0x0ADF
					add di,2
					cmp di,4000
					jne nextloc_ENDLESS


					popa

					ret			
	   
;;//////////////////SURVIVAL SCREEN////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
CREATE_HURDLES:pusha
                    
					
					mov ax,0xb800
					mov es,ax
					mov di,0
					
					mov si,25
					cld 
DRAWING_SURVIVAL:	mov ax,0x05B0
                    mov cx,80
					rep stosw
					mov cx,80
					mov ax,0x0Cb1
					rep stosw
			        sub si,1
					cmp si,0
					jne DRAWING_SURVIVAL
					
					mov di,836
					mov ax,0x041f
					mov cx,5
					rep stosw
					
					mov di,1704
					mov ax,0x041f
					mov cx,5
					rep stosw
					
					mov di,1930
					mov ax,0x041f
					mov cx,5
					rep stosw
					
					mov di,2520
					mov ax,0x041f
					mov cx,5
					rep stosw
					
					
					mov di,154
					mov cx,[LIFE_LENGTH]
					mov ax,0x0C03
					rep stosw
					std
					mov di,144
					mov si,0
					mov bx,0
					mov ah,0x0f
DRAW_CONTINUE_LIFE_LABEL:mov al,[LIFE_LABEl+si]
					mov word[es:di+bx],ax
					add si,1
					add bx,2
					cmp si,5
					jl DRAW_CONTINUE_LIFE_LABEL
					
					mov ax,0xb800
					mov es,ax
					mov di,20
					mov cx,62
					mov ax,0x041f
					cld
					rep stosw

					std
					
popa
ret

;;/////////////////////////////////CLR SCREEN FUNCTION FOR GAME SCREEN//////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////////////////		
clearscreen_GAME: push ES
					 push AX
					 push di
					 
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
		nextloc_GAME:    mov word[es:di]	,0x0720
					add di,2
					cmp di,4000
					jne nextloc_GAME


					pop di
					pop AX
					pop ES

					ret			
					
;;///////////////////////////////////////SCORE TEMPLATE/////////////////////////////////
;;//////////////////////////////////////////////////////////////////////////////////////					
Draw_SCORE_TEMPLATE:pusha 
                 	MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				mov ah,0x0F
				mov si,0
		REPEAT_NEXT_SC: mov al,[msg_score_GAME+si]
              		mov word[es:di]	,ax
					add di,2
					add si,1
					cmp al,0
					jne REPEAT_NEXT_SC
					mov si,0
		REPEAT_NEXT_SC2: mov al,[SCORE_digit_GAME+si]
              		mov word[es:di]	,ax
					add di,2
					add si,1
					cmp byte[SCORE_digit_GAME+si],0
					jne REPEAT_NEXT_SC2			
					
					

            popa
			ret


;////////////////////////////////////TIME TEMPLATE FUNCTION/////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////
Draw_TIME_TEMPLATE:pusha 
                 	MOV		AX, 0xB800
				MOV		ES, AX
				mov di,140
				mov ah,0x0E
				mov si,0
		REPEAT_NEXT_SC11: mov al,[TIME_DIGIT_VAR+si]
              		mov word[es:di]	,ax
					add di,2
					add si,1
					cmp al,0
					jne REPEAT_NEXT_SC11
					mov di,150
					mov si,0
		REPEAT_NEXT_SC21: mov al,[TIME_DIGIT+si]
              		mov word[es:di]	,ax
					add di,2
					add si,1
					cmp byte[TIME_DIGIT+si],0
					jne REPEAT_NEXT_SC21			
					 add byte[tick_count],1
				 cmp byte[tick_count],8
				 je ooho
				 cmp byte[tick_count],8
				 jne ooho_end
				 
ooho: call UPDATE_TIME
      					

ooho_end            popa
			ret
				
;;////////////////////////////////////////////UPDATE TIME///////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////////////
UPDATE_TIME:pusha		 				 
	mov byte[tick_count],0
R1_M_SEC: cmp byte[TIME_DIGIT+3],'0'
         je R2_M_SEC
		 sub byte[TIME_DIGIT+3],1
		 jmp retur_BACK_end
R2_M_SEC: cmp byte[TIME_DIGIT+2],'0'
          je  MIN_CHECK
		  mov byte[TIME_DIGIT+3],'9'
		  sub byte[TIME_DIGIT+2],1
		  jmp retur_BACK_end
MIN_CHECK: cmp byte[TIME_DIGIT],'0'
           je game_end
		   mov byte[TIME_DIGIT+3],'9'
		   mov byte[TIME_DIGIT+2],'5'
		   sub byte[TIME_DIGIT],1


retur_BACK_end: popa
                ret		   
;;////////////////////////////////////updating score FUNCTION/////////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////////////

UPDATE_SCORE:
    pusha
    
    ; Increment rightmost digit (ones place)
    cmp byte[SCORE_digit_GAME+2],'9'
    jne inc_ones
    
    ; Ones overflow - reset to 0 and carry to tens
    mov byte[SCORE_digit_GAME+2],'0'
    
    cmp byte[SCORE_digit_GAME+1],'9'
    jne inc_tens
    
    ; Tens overflow - reset to 0 and carry to hundreds
    mov byte[SCORE_digit_GAME+1],'0'
    
    cmp byte[SCORE_digit_GAME+0],'9'
    jne inc_hundreds
    
    ; All digits at 9 - max score reached
    jmp done_SCORPDATION
    
inc_hundreds:
    add byte[SCORE_digit_GAME+0],1
    jmp done_SCORPDATION
    
inc_tens:
    add byte[SCORE_digit_GAME+1],1
    jmp done_SCORPDATION
    
inc_ones:
    add byte[SCORE_digit_GAME+2],1
    
done_SCORPDATION:
    popa
    ret   
	
B1_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B1]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B1
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B1:
popa
ret	

B2_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B2]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B2
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B2:
popa
ret	

B3_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B3]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B3
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B3:
popa
ret	

B4_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B4]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B4
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B4:
popa
ret	


B5_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B5]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B5
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B5:
popa
ret		


B6_CLEAR:pusha
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
                 mov di,[CURRENT_POS_B6]
				 add di,160
             mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
			mov dx,[BG_BUFFER+di+316]
			mov word[es:di+316]	,dx
			mov dx,[BG_BUFFER+di+318]
			mov word[es:di+318]	,dx
			mov dx,[BG_BUFFER+di+320]
			mov word[es:di+320]	,dx
			mov dx,[BG_BUFFER+di+322]
			mov word[es:di+322]	,dx
			mov dx,[BG_BUFFER+di+324]
            mov word[es:di+324]	,dx
			mov dx,[BG_BUFFER+di+326]
			mov word[es:di+326]	,dx
			mov dx,[BG_BUFFER+di+328]
			mov word[es:di+328]	,dx
			mov dx,[BG_BUFFER+di+478]
			mov word[es:di+478]	,dx
			mov dx,[BG_BUFFER+di+480]
			mov word[es:di+480]	,dx
			mov dx,[BG_BUFFER+di+482]
			mov word[es:di+482]	,dx
			mov dx,[BG_BUFFER+di+484]
			mov word[es:di+484]	,dx
			mov dx,[BG_BUFFER+di+486]
			mov word[es:di+486]	,dx
			mov dx,[BG_BUFFER+di+640]
			mov word[es:di+640]	,dx
			mov dx,[BG_BUFFER+di+642]
			mov word[es:di+642]	,dx
			mov dx,[BG_BUFFER+di+644]
			mov word[es:di+644]	,dx
			mov dx,[BG_BUFFER+di+802]
			mov word[es:di+802]	,dx
            cmp word[Ballon_pop],1
			jne CLEAR_END_B6
			sub di,160
			 mov dx,[BG_BUFFER+di-2]
             mov word[es:di-2]	,dx
			 mov dx,[BG_BUFFER+di]
		     mov word[es:di]	,dx
			 mov dx,[BG_BUFFER+di+2]
			 mov word[es:di+2]	,dx
			 mov dx,[BG_BUFFER+di+4]
		     mov word[es:di+4]	,dx
			 mov dx,[BG_BUFFER+di+6]
			 mov word[es:di+6]	,dx
			 mov dx,[BG_BUFFER+di+156]
			 mov word[es:di+156]	,dx
			 mov dx,[BG_BUFFER+di+158]
		     mov word[es:di+158]	,dx
			 mov dx,[BG_BUFFER+di+160]
		     mov word[es:di+160]	,dx
			 mov dx,[BG_BUFFER+di+162]
			 mov word[es:di+162]	,dx
             mov dx,[BG_BUFFER+di+164]
			mov word[es:di+164]	,dx
			mov dx,[BG_BUFFER+di+166]
			mov word[es:di+166]	,dx
			mov dx,[BG_BUFFER+di+168]
			mov word[es:di+168]	,dx
CLEAR_END_B6:
popa
ret	
;;////////////////////////////////////////BALLON///////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////					 
		DrawBaloon_GAME:
					push bp
					mov bp,sp
					push ES
					push AX
					push di
					push dx
					
					
					MOV		AX, 0xB800
					MOV		ES, AX
					mov dh,0x0C
				    mov si,0
					mov ax,[POSITION_OF_BALLON_1+si]
					mov word[CURRENT_POS_B1],AX
					mov ax,[POSITION_OF_BALLON_2+si]
					mov word[CURRENT_POS_B2],AX
					mov ax,[POSITION_OF_BALLON_3+si]
					mov word[CURRENT_POS_B3],AX
					mov ax,[POSITION_OF_BALLON_4+si]
					mov word[CURRENT_POS_B4],AX
					mov ax,[POSITION_OF_BALLON_5+si]
					mov word[CURRENT_POS_B5],AX
					mov ax,[POSITION_OF_BALLON_6+si]
					mov word[CURRENT_POS_B6],AX
					;wedwe
					
					
					
			cmp word[CURRENT_mode],1
			je  SURVIVAL_WALA_SCENE_HA_S

          	cmp word[CURRENT_mode],2
			je TIME_WALA_KOI_SCENE_NHI_S
			
         	;call clearscreen_GAME
		    cmp word[CURRENT_LEVEL],1
			je DRAW_LEVEL_1
			cmp word[CURRENT_LEVEL],2
			je DRAW_LEVEL_2
			call LEVEL_3_THEME
					jmp DRAWING_OF_LEVEL_COMPLETE
					
DRAW_LEVEL_1: call LEVEL_1_THEME
               jmp DRAWING_OF_LEVEL_COMPLETE		

DRAW_LEVEL_2: call LEVEL_2_THEME
               jmp DRAWING_OF_LEVEL_COMPLETE						
					
TIME_WALA_KOI_SCENE_NHI_S: call clearscreen_ENDLESS
                           jmp DRAWING_OF_LEVEL_COMPLETE
						   
SURVIVAL_WALA_SCENE_HA_S: call CREATE_HURDLES
                           jmp DRAWING_OF_LEVEL_COMPLETE

                            mov di,0
DRAWING_OF_LEVEL_COMPLETE: 	mov ax,[es:di]
                            mov [BG_BUFFER+di],AX
                            add di,2
                            cmp di,8000
                            jne DRAWING_OF_LEVEL_COMPLETE     							

						   
		LOOP1_GAME:  cmp byte[GAME_END_SO],1
		            je game_end
					cmp word[CURRENT_mode],1
					je check_for_survival_condition
survival_check_complete:  	cmp word[CURRENT_mode],3
                            jne TIME_WALA_KOI_SCENE_NHI
                              call Draw_TIME_TEMPLATE
TIME_WALA_KOI_SCENE_NHI:           
                         call Draw_SCORE_TEMPLATE
                 
			   mov bx,0xb800
			   xor di,di
			   ;xor dx,dx
			   xor ax,AX
			   
				MOV		ES, bx
				call B1_CLEAR
                 mov di,[CURRENT_POS_B1]
				 mov  bp,[B1_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B1_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B1_CHARACTER_COUNTER]
				 mov        cl,[B1_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B1_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B1_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B1_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx
			
							 	
			;;B2_
			call B2_CLEAR
			mov di,[CURRENT_POS_B2]
				 mov  bp,[B2_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B2_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B2_CHARACTER_COUNTER]
				 mov        cl,[B2_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B2_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B2_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B2_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx
			
             ;B3_
			 call B3_CLEAR
			mov di,[CURRENT_POS_B3]
				 mov  bp,[B3_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B3_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B3_CHARACTER_COUNTER]
				 mov        cl,[B3_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B3_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B3_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B3_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx	 
			
            ;B4_			
		       call B4_CLEAR
			mov di,[CURRENT_POS_B4]
				 mov  bp,[B4_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B4_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B4_CHARACTER_COUNTER]
				 mov        cl,[B4_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B4_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B4_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B4_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx	 

				 
				;///sleep 2 times call for level 1 and 1 time for level 2 and no sleep will call for level 3
			; cmp word[CURRENT_LEVEL],3
            ; je DRAW_5T_and_6TH_BALLON_FOR_LEVEL_3
            ; cmp word[CURRENT_LEVEL],2
            ; je DRAW_5TH_BALLON_FOR_LEVEL_2

            cmp word[CURRENT_mode],3
            jne SLOWES_THE_SPEED_1
            cmp word[CURRENT_LEVEL],1
            je SLOWES_THE_SPEED_1
           
                 ;B5_
				 call B5_CLEAR
             	mov di,[CURRENT_POS_B5]
				 mov  bp,[B5_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B5_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B5_CHARACTER_COUNTER]
				 mov        cl,[B5_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B5_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B5_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B5_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx	
				 

                  cmp word[CURRENT_LEVEL],2
                  je SLOWES_THE_SPEED_2
           
             ;B6_ 
                call B6_CLEAR			 
				mov di,[CURRENT_POS_B6]
				 mov  bp,[B6_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B6_COLOR+bp]
                mov word[es:di-2]	,dx
		     mov word[es:di]	,dx
			 mov word[es:di+2]	,dx
		     mov word[es:di+4]	,dx
			 mov word[es:di+6]	,dx
			 mov word[es:di+156]	,dx
		     mov word[es:di+158]	,dx
		     mov word[es:di+160]	,dx
			  mov        bp,[B6_CHARACTER_COUNTER]
				 mov        cl,[B6_CHARACTER+bp]
				 mov ch,0x0F
				 mov byte[B6_CURRENT_CHARACTER],cl
			 mov word[es:di+162]	,dx
			  mov  bp,[B6_COLOR_COUNTER]
				 mov dl,0xDB
				 mov dh,[B6_COLOR+bp]
			mov word[es:di+164]	,dx
			mov word[es:di+166]	,dx
			mov word[es:di+168]	,dx
			
			mov word[es:di+316]	,dx
			mov word[es:di+318]	,dx
			mov word[es:di+320]	,dx
			mov word[es:di+322]	,cx
            mov word[es:di+324]	,dx
			mov word[es:di+326]	,dx
			mov word[es:di+328]	,dx
			
			mov word[es:di+478]	,dx
			mov word[es:di+480]	,dx
			mov word[es:di+482]	,dx
			mov word[es:di+484]	,dx
			mov word[es:di+486]	,dx
			
			mov word[es:di+640]	,dx
			mov word[es:di+642]	,dx
			mov word[es:di+644]	,dx
			
			mov word[es:di+802]	,dx		  
				  
                  
				  jmp  EXTRA_BALLONS_DRAWING_COMPLETE
				  
SLOWES_THE_SPEED_1:			 call sleep
SLOWES_THE_SPEED_2:			 call sleep
			;call GRASS
EXTRA_BALLONS_DRAWING_COMPLETE:				 xor ax,ax
				 call sleep
				 call input
				 cmp al,32
				 je stop
				 mov byte[CURRENT_ENTERED_CHARACTER],al
				 mov bx,[B1_CHARACTER_COUNTER]
      			 cmp byte[B1_CHARACTER+bx],al
				 je update_B1_
				  mov bx,[B2_CHARACTER_COUNTER]
      			  cmp byte[B2_CHARACTER+bx],al
				  je update_B2_
				  mov bx,[B3_CHARACTER_COUNTER]
      			  cmp byte[B3_CHARACTER+bx],al
				  je update_B3_
				  mov bx,[B4_CHARACTER_COUNTER]
      			  cmp byte[B4_CHARACTER+bx],al
				  je update_B4_
				  
				  cmp word[CURRENT_LEVEL],1
				je COUNTINE_YOU_WORK
				
				  mov bx,[B5_CHARACTER_COUNTER]
				  cmp byte[B5_CHARACTER+bx],al
				  je update_B5_
				  
				  cmp word[CURRENT_LEVEL],2
				je COUNTINE_YOU_WORK
				
				  mov bx,[B6_CHARACTER_COUNTER]
				  cmp byte[B6_CHARACTER+bx],al
				  je update_B6_
 
COUNTINE_YOU_WORK:				call sleep
				sub word[CURRENT_POS_B1],160
				sub word[CURRENT_POS_B2],160
                sub word[CURRENT_POS_B3],160
                sub word[CURRENT_POS_B4],160 
				
                cmp word[CURRENT_mode],1
				je UPDATE_BALLONS_FOR_SURVIVAL_MODE
				
                cmp word[CURRENT_LEVEL],1
				je COUNTINUE_BRO
                  				
				sub word[CURRENT_POS_B5],160
				
				cmp word[CURRENT_LEVEL],2
				je COUNTINUE_BRO
				
				sub word[CURRENT_POS_B6],160
				
				
COUNTINUE_BRO:				
                cmp word[CURRENT_POS_B1],18;160;-730
				jl  update_di_B1
				cmp word[CURRENT_mode],3
				je TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_1
TIME_END_CHECKED_1:				
				cmp word[CURRENT_POS_B1],0;160;-730
				jl  update_di_B1
				
				cmp word[CURRENT_POS_B2],18;160;-730
				jl  update_di_B2
				cmp word[CURRENT_mode],3
				je TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_2
TIME_END_CHECKED_2:					
				cmp word[CURRENT_POS_B2],0;160;-730
				jl  update_di_B2
				
				cmp word[CURRENT_POS_B3],18;160;-730
				jl  update_di_B3
				cmp word[CURRENT_mode],3
				je TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_3
TIME_END_CHECKED_3:					
				cmp word[CURRENT_POS_B3],0;160;-730
				jl  update_di_B3
				
				cmp word[CURRENT_POS_B4],18;160;-730
				jl  update_di_B4
				cmp word[CURRENT_mode],3
				je TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_4
TIME_END_CHECKED_4:					
				cmp word[CURRENT_POS_B4],0;160;-730
				jl  update_di_B4
				
				cmp word[CURRENT_LEVEL],1
				je REPEAT_THE_GAME_LOOP
TIME_END_CHECKED_5:
                cmp word[CURRENT_POS_B5],18;-730
				jl  update_di_B5				
				cmp word[CURRENT_POS_B5],0;-730
				jl  update_di_B5
				cmp word[CURRENT_POS_B5],138;160;-730
				                               je  update_di_B5
                                               cmp word[CURRENT_POS_B5],140;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],142;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],144;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],146;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],148;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],150;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],152;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],154;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],156;160;-730
				                               je  update_di_B5
											   cmp word[CURRENT_POS_B5],158;160;-730
				                               je  update_di_B5
				cmp word[CURRENT_LEVEL],2
				je REPEAT_THE_GAME_LOOP
				cmp word[CURRENT_POS_B6],18;160;-730
				jl  update_di_B6
				cmp word[CURRENT_POS_B6],0;160;-730
				jl  update_di_B6
				cmp word[CURRENT_POS_B6],138;160;-730
				                               je  update_di_B6
                                               cmp word[CURRENT_POS_B6],140;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],142;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],144;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],146;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],148;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],150;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],152;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],154;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],156;160;-730
				                               je  update_di_B6
											   cmp word[CURRENT_POS_B6],158;160;-730
				                               je  update_di_B6
				
REPEAT_THE_GAME_LOOP:				jmp LOOP1_GAME
				
TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_1: cmp word[CURRENT_POS_B1],138;160;-730
				                               je  update_di_B1
                                               cmp word[CURRENT_POS_B1],140;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],142;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],144;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],146;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],148;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],150;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],152;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],154;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],156;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],158;160;-730
				                               je  update_di_B1
											   jmp TIME_END_CHECKED_1

TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_2: cmp word[CURRENT_POS_B2],138;160;-730
				                               je  update_di_B2
                                               cmp word[CURRENT_POS_B2],140;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],142;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],144;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],146;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],148;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],150;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],152;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],154;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],156;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],158;160;-730
				                               je  update_di_B2
											   jmp TIME_END_CHECKED_2

TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_3:cmp word[CURRENT_POS_B3],138;160;-730
				                               je  update_di_B3
                                               cmp word[CURRENT_POS_B3],140;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],142;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],144;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],146;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],148;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],150;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],152;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],154;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],156;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],158;160;-730
				                               je  update_di_B3
											   jmp TIME_END_CHECKED_3

TIME_MODE_KE_LIA_NO_BALLON_POP_ON_TIME_SIDE_4:cmp word[CURRENT_POS_B4],138;160;-730
				                               je  update_di_B4
                                                cmp word[CURRENT_POS_B4],140;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],142;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],144;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],146;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],148;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],150;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],152;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],154;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],156;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],158;160;-730
				                               je  update_di_B4
                                               jmp TIME_END_CHECKED_4


; TIME_WALA_KOI_SCENE_NHI_S: call clearscreen_ENDLESS
                           ; jmp TIME_WALA_KOI_SCENE_NHI
						   
; SURVIVAL_WALA_SCENE_HA_S: call CREATE_HURDLES
                           ; jmp TIME_WALA_KOI_SCENE_NHI						   

check_for_survival_condition: cmp word[SURVIVAL_COUNTER],8
                              je SURVIVAL_DEAD_PREV
                              jmp survival_check_complete

SURVIVAL_DEAD_PREV: sub word[LIFE_LENGTH],1
                    call play_life_lost_sound
                    mov word[SURVIVAL_COUNTER],0
                    cmp word[LIFE_LENGTH],0
                    jne LOOP1_GAME					
SURVIVAL_DEAD: mov byte[GAME_END_SO],1
               jmp LOOP1_GAME


;;////////////////////////////////////////////////////////////////////////////////
UPDATE_BALLONS_FOR_SURVIVAL_MODE: cmp word[CURRENT_POS_B1],18;160;-730
				                 jl  update_di_B1
                                 cmp word[CURRENT_POS_B1],0;160;-730
				                 jl  update_di_B1
								mov si, [CURRENT_POS_B1]
								add si,6
								 cmp si,292;160;-730
				                               jle  update_di_B1
								 
								               cmp word[CURRENT_POS_B1],132;160;-730
				                               je  update_di_B1
                                                cmp word[CURRENT_POS_B1],140;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],142;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],144;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],146;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],148;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],150;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],152;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],154;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],156;160;-730
				                               je  update_di_B1
											   cmp word[CURRENT_POS_B1],158;160;-730
				                               je  update_di_B1
								
								mov si,[CURRENT_POS_B1]
								 sub si,4
								 cmp si,836
								 je update_di_B1
								
								mov si,[CURRENT_POS_B1]
								 sub si,2
								 cmp si,836
								 je update_di_B1
								
								 cmp word[CURRENT_POS_B1],836;160;-730
				                 je  update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,836
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,836
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,836
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,836
								 je update_di_B1
								 
								  cmp word[CURRENT_POS_B1],838;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,838
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,838
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,838
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,838
								 je update_di_B1

								  cmp word[CURRENT_POS_B1],840;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,840
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,840
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,840
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,840
								 je update_di_B1
								 
								 
								 cmp word[CURRENT_POS_B1],842;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,842
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,842
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,842
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,842
								 je update_di_B1
								
								 
								  cmp word[CURRENT_POS_B1],844;160;-730
				                 je  update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,844
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,844
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,844
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,844
								 je update_di_B1
								 
								 cmp word[CURRENT_POS_B1],846;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,846
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,846
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,846
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,846
								 je update_di_B1
								 
								 
								  cmp word[CURRENT_POS_B1],1704;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1704
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1704
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,1
								 cmp si,1704
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1704
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],1706;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1706
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1706
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1706
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1706
								 je update_di_B1
								
								  cmp word[CURRENT_POS_B1],1708;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1708
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1708
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1708
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1708
								 je update_di_B1
								 
								 
								  cmp word[CURRENT_POS_B1],1710;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1710
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1710
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1710
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1710
								 je update_di_B1
								
								 
								  cmp word[CURRENT_POS_B1],1712;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1712
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1712
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1712
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1712
								 je update_di_B1

								 
								 cmp word[CURRENT_POS_B1],1714;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1714
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1714
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1714
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1714
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],1930;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1930
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1930
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1930
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1930
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],1932;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1932
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1932
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1932
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1932
								 je update_di_B1
								 
								 
								  cmp word[CURRENT_POS_B1],1934;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1934
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1934
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1934
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1934
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],1936;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1936
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1936
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1936
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1936
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],1938;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1938
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1938
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1938
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1938
								 je update_di_B1

								 
								 cmp word[CURRENT_POS_B1],1940;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,1940
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,1940
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,1940
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,1940
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],2520;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2520
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2520
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2520
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2520
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],2522;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2522
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2522
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2522
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2522
								 je update_di_B1
								 
								 
								  cmp word[CURRENT_POS_B1],2524;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2524
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2524
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2524
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2524
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],2526;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2526
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2526
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2526
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2526
								 je update_di_B1

								 
								  cmp word[CURRENT_POS_B1],2528;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2528
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2528
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2528
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2528
								 je update_di_B1
								
								 
								 cmp word[CURRENT_POS_B1],2530;160;-730
				                 je  update_di_B1
								  mov si,[CURRENT_POS_B1]
								 add si,2
								 cmp si,2530
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,4
								 cmp si,2530
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,158
								 cmp si,2530
								 je update_di_B1
								 mov si,[CURRENT_POS_B1]
								 add si,166
								 cmp si,2530
								 je update_di_B1
								 
								 
								 
				                 cmp word[CURRENT_POS_B2],18;160;-730
				                 jl  update_di_B2
				                 cmp word[CURRENT_POS_B2],0;160;-730
				                 jl  update_di_B2
								 mov si, [CURRENT_POS_B2]
								add si,6
								 cmp si,292;160;-730
				                               jle  update_di_B2
								 cmp word[CURRENT_POS_B2],134;160;-730
				                               je  update_di_B2
                                                cmp word[CURRENT_POS_B2],140;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],142;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],144;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],146;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],148;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],150;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],152;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],154;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],156;160;-730
				                               je  update_di_B2
											   cmp word[CURRENT_POS_B2],158;160;-730
				                               je  update_di_B2
								 
								 
								  mov si,[CURRENT_POS_B2]
								 sub si,4
								 cmp si,836
								 je update_di_B2
								 
								 mov si,[CURRENT_POS_B2]
								 sub si,2
								 cmp si,836
								 je update_di_B2
								 cmp word[CURRENT_POS_B2],836;160;-730
				                 je  update_di_B2
								  mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,836
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,836
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,836
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,836
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],838;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,838
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,838
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,838
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,838
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],840;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,840
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,840
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,840
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,840
								 je update_di_B2
								 
								 cmp word[CURRENT_POS_B2],842;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,842
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,842
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,842
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,842
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],844;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,844
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,844
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,844
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,844
								 je update_di_B2
								 
								 cmp word[CURRENT_POS_B2],846;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,846
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,846
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,846
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,846
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1704;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1704
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1704
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1704
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1704
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1706;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1706
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1706
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1706
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1706
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1708;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1708
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1708
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1708
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1708
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1710;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1710
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1710
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1710
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1710
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1712;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1712
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1712
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1712
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1712
								 je update_di_B2
								 
								 cmp word[CURRENT_POS_B2],1714;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1714
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1714
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1714
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1714
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1930;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1930
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1930
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1930
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1930
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1932;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1932
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1932
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1932
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1932
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1934;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1934
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1934
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1934
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1934
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1936;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1936
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1936
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1936
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1936
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],1938;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1938
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1938
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1938
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1938
								 je update_di_B2
								 
								 cmp word[CURRENT_POS_B2],1940;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,1940
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,1940
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,1940
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,1940
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],2520;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2520
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2520
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2520
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2520
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],2522;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2522
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2522
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2522
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2522
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],2524;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2524
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2524
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2524
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2524
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],2526;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2526
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2526
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2526
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2526
								 je update_di_B2
								 
								  cmp word[CURRENT_POS_B2],2528;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2528
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2528
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2528
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2528
								 je update_di_B2
								 
								 cmp word[CURRENT_POS_B2],2530;160;-730
				                 je  update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,2
								 cmp si,2530
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,4
								 cmp si,2530
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,158
								 cmp si,2530
								 je update_di_B2
								 mov si,[CURRENT_POS_B2]
								 add si,166
								 cmp si,2530
								 je update_di_B2
								 
				                cmp word[CURRENT_POS_B3],18;160;-730
				                 jl  update_di_B3
				                 cmp word[CURRENT_POS_B3],0;160;-730
				                 jl  update_di_B3
								 mov si, [CURRENT_POS_B3]
								add si,6
								 cmp si,292;160;-730
				                               jle  update_di_B3
								 				cmp word[CURRENT_POS_B3],134;160;-730
				                               je  update_di_B3
                                                cmp word[CURRENT_POS_B3],140;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],142;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],144;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],146;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],148;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],150;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],152;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],154;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],156;160;-730
				                               je  update_di_B3
											   cmp word[CURRENT_POS_B3],158;160;-730
				                               je  update_di_B3
								 
								 mov si,[CURRENT_POS_B3]
								 sub si,4
								 cmp si,836
								 je update_di_B3
								 
								 mov si,[CURRENT_POS_B3]
								 sub si,2
								 cmp si,836
								 je update_di_B3
								 cmp word[CURRENT_POS_B3],836;160;-730
				                 je  update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,836
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,836
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,836
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,836
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],838;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,838
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,838
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,838
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,838
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],840;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,840
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,840
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,840
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,840
								 je update_di_B3
								 
								 cmp word[CURRENT_POS_B3],842;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,842
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,842
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,842
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,842
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],844;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,844
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,844
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,844
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,844
								 je update_di_B3
								 
								 cmp word[CURRENT_POS_B3],846;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,846
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,846
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,846
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,846
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1704;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1704
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1704
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1704
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1704
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1706;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1706
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1706
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1706
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1706
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1708;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1708
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1708
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1708
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1708
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1710;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1710
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1710
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1710
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1710
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1712;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1712
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1712
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1712
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1712
								 je update_di_B3
								 
								 cmp word[CURRENT_POS_B3],1714;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1714
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1714
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1714
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1714
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1930;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1930
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1930
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1930
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1930
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1932;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1932
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1932
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1932
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1932
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1934;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1934
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1934
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1934
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1934
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1936;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1936
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1936
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1936
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1936
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],1938;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1938
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1938
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1938
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1938
								 je update_di_B3
								 
								 cmp word[CURRENT_POS_B3],1940;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,1940
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,1940
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,1940
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,1940
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],2520;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2520
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2520
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2520
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2520
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],2522;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2522
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2522
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2522
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2522
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],2524;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2524
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2524
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2524
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2524
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],2526;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2526
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2526
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2526
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2526
								 je update_di_B3
								 
								  cmp word[CURRENT_POS_B3],2528;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2528
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2528
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2528
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2528
								 je update_di_B3
								 
								 cmp word[CURRENT_POS_B3],2530;160;-730
				                 je  update_di_B3
								  mov si,[CURRENT_POS_B3]
								 add si,2
								 cmp si,2530
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,4
								 cmp si,2530
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,158
								 cmp si,2530
								 je update_di_B3
								 mov si,[CURRENT_POS_B3]
								 add si,166
								 cmp si,2530
								 je update_di_B3
								 
                                  cmp word[CURRENT_POS_B4],18;160;-730
				                 jl  update_di_B4
				                 cmp word[CURRENT_POS_B4],0;160;-730
				                 jl  update_di_B4
								mov si, [CURRENT_POS_B4]
								add si,6
								 cmp si,292;160;-730
				                               jle  update_di_B4
                                                cmp word[CURRENT_POS_B4],140;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],142;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],144;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],146;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],148;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],150;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],152;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],154;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],156;160;-730
				                               je  update_di_B4
											   cmp word[CURRENT_POS_B4],158;160;-730
				                               je  update_di_B4
								 
								  mov si,[CURRENT_POS_B4]
								 sub si,4
								 cmp si,836
								 je update_di_B4
								 
							     mov si,[CURRENT_POS_B4]
								 sub si,2
								 cmp si,836
								 je update_di_B4
								 cmp word[CURRENT_POS_B4],836;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,836
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,836
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,836
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,836
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],838;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,838
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,838
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,838
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,838
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],840;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,840
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,840
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,840
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,840
								 je update_di_B4
								 
								 cmp word[CURRENT_POS_B4],842;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,842
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,842
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,842
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,842
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],844;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,844
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,844
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,844
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,844
								 je update_di_B4
								 
								 cmp word[CURRENT_POS_B4],846;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,846
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,846
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,846
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,846
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1704;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1704
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1704
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1704
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1704
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1706;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1706
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1706
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1706
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1706
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1708;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1708
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1708
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1708
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1708
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1710;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1710
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1710
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1710
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1710
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1712;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1712
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1712
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1712
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1712
								 je update_di_B4
								 
								 cmp word[CURRENT_POS_B4],1714;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1714
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1714
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1714
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1714
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1930;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1930
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1930
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1930
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1930
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1932;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1932
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1932
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1932
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1932
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1934;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1934
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1934
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1934
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1934
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1936;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1936
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1936
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1936
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1936
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],1938;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1938
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1938
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1938
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1938
								 je update_di_B4
								 
								 cmp word[CURRENT_POS_B4],1940;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,1940
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,1940
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,1940
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,1940
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],2520;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2520
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2520
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2520
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2520
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],2522;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2522
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2522
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2522
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2522
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],2524;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2524
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2524
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2524
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2524
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],2526;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2526
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2526
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2526
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2526
								 je update_di_B4
								 
								  cmp word[CURRENT_POS_B4],2528;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2528
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2528
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2528
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2528
								 je update_di_B4
								 
								 cmp word[CURRENT_POS_B4],2530;160;-730
				                 je  update_di_B4
								  mov si,[CURRENT_POS_B4]
								 add si,2
								 cmp si,2530
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,4
								 cmp si,2530
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,158
								 cmp si,2530
								 je update_di_B4
								 mov si,[CURRENT_POS_B4]
								 add si,166
								 cmp si,2530
								 je update_di_B4
								 
			   jmp LOOP1_GAME
;;//////////////////////////////BALLON1 LOGIC////////////////////////////////				
;;///////////////////////////////////////////////////////////////////////////				
update_di_B1: call B1_CLEAR 
              add word[B1_COUNTER],2
              add word[B1_COLOR_COUNTER],1
			  cmp word[B1_COLOR_COUNTER],8
			  je UPDATE_B1_COLOR_COUNTER
B1_COLOR_COUNTER_UPDATED:              cmp word[B1_COUNTER],8
              je POSITION_OF_BALLON_1_WRAPPER_B1			  
WRRAPER_DONE_B1: mov si,[B1_COUNTER]
                    mov ax,[POSITION_OF_BALLON_1+si]
					mov word[CURRENT_POS_B1],AX
              add byte[B1_CHARACTER_COUNTER],1
			  cmp byte[B1_CHARACTER_COUNTER],26
			  je reload_B1

		return_B1:  cmp word[CURRENT_mode],1
                      je  update_SURVIVOR_END_1		
        RET_B1:            		jmp LOOP1_GAME

		reload_B1:  mov byte[B1_CHARACTER_COUNTER],0
				  jmp return_B1
				  
POSITION_OF_BALLON_1_WRAPPER_B1:     mov word[B1_COUNTER],0
                                   jmp WRRAPER_DONE_B1 		

UPDATE_B1_COLOR_COUNTER: mov word[B1_COLOR_COUNTER],0
                         jmp B1_COLOR_COUNTER_UPDATED

update_SURVIVOR_END_1: add word[SURVIVAL_COUNTER],1
							  jmp RET_B1
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON1//////////////////////////////////////
;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B1_:   mov word[Ballon_pop],1
call B1_CLEAR
call play_pop_sound
               add word[B1_COUNTER],2 
               add word[B1_COLOR_COUNTER],1
			  cmp word[B1_COLOR_COUNTER],8
			  je UPDATE_B1_COLOR_COUNTER_
B1_COLOR_COUNTER_UPDATED_:       cmp word[B1_COUNTER],8
              jge POSITION_OF_BALLON_1_WRAPPER_B1_			  
WRRAPER_DONE_B1_:   mov si,[B1_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_1+si]
					mov word[CURRENT_POS_B1],AX
			  call UPDATE_SCORE
			  mov byte[B1_CURRENT_CHARACTER],0				
			  
done_THIS_B1_:				  
				add byte[B1_CHARACTER_COUNTER],1
			  cmp byte[B1_CHARACTER_COUNTER],26
				je reload_B1_
				
		return_B1_: ;.............;;.............
				  mov cl,[CURRENT_ENTERED_CHARACTER]
				  
      			  cmp byte[B2_CURRENT_CHARACTER],cl
				  je update_B2_
      			  cmp byte[B3_CURRENT_CHARACTER],cl
				  je update_B3_
      			  cmp byte[B4_CURRENT_CHARACTER],cl
				  je update_B4_
				  
				  cmp word[CURRENT_LEVEL],2
				  je OOHO_LEVEL_2_HA_1
				   cmp word[CURRENT_LEVEL],3
				  je OOHO_LEVEL_3_HA_1
				  
			  ;;;..........................................  
		jmp LOOP1_GAME

		reload_B1_: mov byte[B1_CHARACTER_COUNTER],0; 
				 jmp return_B1_

POSITION_OF_BALLON_1_WRAPPER_B1_: mov word[B1_COUNTER],0
                              jmp WRRAPER_DONE_B1_  
							  
OOHO_LEVEL_2_HA_1: cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
                    jmp LOOP1_GAME

OOHO_LEVEL_3_HA_1:cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
					cmp byte[B6_CURRENT_CHARACTER],cl
                    je update_B6_
                    jmp LOOP1_GAME 		


UPDATE_B1_COLOR_COUNTER_: mov word[B1_COLOR_COUNTER],0
                         jmp B1_COLOR_COUNTER_UPDATED_					
;;//////////////////////////////BALLON2 LOGIC////////////////////////////////////
;;//////////////////////////////////////////////////////////////////////////////
				
				
update_di_B2: call B2_CLEAR
 add word[B2_COUNTER],2
add word[B2_COLOR_COUNTER],1
			  cmp word[B2_COLOR_COUNTER],8
			  je UPDATE_B2_COLOR_COUNTER
B2_COLOR_COUNTER_UPDATED:
              cmp word[B2_COUNTER],8
              je POSITION_OF_BALLON_1_WRAPPER_B2			  
WRRAPER_DONE_B2: mov si,[B2_COUNTER]
                    mov ax,[POSITION_OF_BALLON_2+si]
					mov word[CURRENT_POS_B2],AX
			  	add byte[B2_CHARACTER_COUNTER],1
			  cmp byte[B2_CHARACTER_COUNTER],26
			  je reload_B2
		return_B2:    cmp word[CURRENT_mode],1
                      je  update_SURVIVOR_END_2		
        RET_B2:            		jmp LOOP1_GAME

		reload_B2:  mov byte[B2_CHARACTER_COUNTER],0;
				  jmp return_B2
				  
POSITION_OF_BALLON_1_WRAPPER_B2:     mov word[B2_COUNTER],0
                                   jmp WRRAPER_DONE_B2 	

UPDATE_B2_COLOR_COUNTER: mov word[B2_COLOR_COUNTER],0
                         jmp B2_COLOR_COUNTER_UPDATED

update_SURVIVOR_END_2: add word[SURVIVAL_COUNTER],1
							  jmp RET_B2								   
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON2//////////////////////////////////////
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B2_: mov word[Ballon_pop],1
            call B2_CLEAR
 call play_pop_sound
 add word[B2_COUNTER],2 
add word[B2_COLOR_COUNTER],1
			  cmp word[B2_COLOR_COUNTER],8
			  je UPDATE_B2_COLOR_COUNTER_
B2_COLOR_COUNTER_UPDATED_:
              cmp word[B2_COUNTER],8
              jge POSITION_OF_BALLON_1_WRAPPER_B2_			  
WRRAPER_DONE_B2_:   mov si,[B2_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_2+si]
					mov word[CURRENT_POS_B2],AX
			  call UPDATE_SCORE
			  			  mov byte[B2_CURRENT_CHARACTER],0				
			 
done_THIS_B2_:	
				add byte[B2_CHARACTER_COUNTER],1
			  cmp byte[B2_CHARACTER_COUNTER],26
				je reload_B2_
				
		return_B2_: ;...............................................
  mov cl,[CURRENT_ENTERED_CHARACTER]
				  
      			  cmp byte[B1_CURRENT_CHARACTER],cl
				  je update_B1_
      			  cmp byte[B3_CURRENT_CHARACTER],cl
				  je update_B3_
      			  cmp byte[B4_CURRENT_CHARACTER],cl
				  je update_B4_
				  
				  cmp word[CURRENT_LEVEL],2
				  je OOHO_LEVEL_2_HA_2
				   cmp word[CURRENT_LEVEL],3
				  je OOHO_LEVEL_3_HA_2
				  ;..........................................  
        jmp LOOP1_GAME

		reload_B2_:  mov byte[B2_CHARACTER_COUNTER],0
				 jmp return_B2_

POSITION_OF_BALLON_1_WRAPPER_B2_: mov word[B2_COUNTER],0
                              jmp WRRAPER_DONE_B2_
							  
OOHO_LEVEL_2_HA_2: cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
                    jmp LOOP1_GAME

OOHO_LEVEL_3_HA_2:cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
					cmp byte[B6_CURRENT_CHARACTER],cl
                    je update_B6_
                    jmp LOOP1_GAME 			

UPDATE_B2_COLOR_COUNTER_: mov word[B2_COLOR_COUNTER],0
                         jmp B2_COLOR_COUNTER_UPDATED_					
;;//////////////////////////////BALLON3 LOGIC///////////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////				
				
update_di_B3:  call B3_CLEAR
add word[B3_COUNTER],2
add word[B3_COLOR_COUNTER],1
			  cmp word[B3_COLOR_COUNTER],8
			  je UPDATE_B3_COLOR_COUNTER
B3_COLOR_COUNTER_UPDATED:
              cmp word[B3_COUNTER],8
			  
              je POSITION_OF_BALLON_1_WRAPPER_B3			  
WRRAPER_DONE_B3: mov si,[B3_COUNTER]
                    mov ax,[POSITION_OF_BALLON_3+si]
					mov word[CURRENT_POS_B3],AX
			  add byte[B3_CHARACTER_COUNTER],1
			  cmp byte[B3_CHARACTER_COUNTER],26
			  je reload_B3
		return_B3:    cmp word[CURRENT_mode],1
                      je  update_SURVIVOR_END_3		
        RET_B3:            		jmp LOOP1_GAME

		reload_B3:  mov byte[B3_CHARACTER_COUNTER],0
				  jmp return_B3
				  
POSITION_OF_BALLON_1_WRAPPER_B3:     mov word[B3_COUNTER],0
                                   jmp WRRAPER_DONE_B3 									  

UPDATE_B3_COLOR_COUNTER: mov word[B3_COLOR_COUNTER],0
                         jmp B3_COLOR_COUNTER_UPDATED

update_SURVIVOR_END_3: add word[SURVIVAL_COUNTER],1
							  jmp RET_B3								   
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON3//////////////////////////////////////
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B3_:  mov word[Ballon_pop],1
              call B3_CLEAR
call play_pop_sound
 add word[B3_COUNTER],2 
add word[B3_COLOR_COUNTER],1
			  cmp word[B3_COLOR_COUNTER],8
			  je UPDATE_B3_COLOR_COUNTER_
B3_COLOR_COUNTER_UPDATED_:
              cmp word[B3_COUNTER],8
              jge POSITION_OF_BALLON_1_WRAPPER_B3_			  
WRRAPER_DONE_B3_:   mov si,[B3_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_3+si]
					mov word[CURRENT_POS_B3],AX
			  call UPDATE_SCORE
			  			  mov byte[B3_CURRENT_CHARACTER],0				
			 
done_THIS_B3_:		
				add byte[B3_CHARACTER_COUNTER],1
			  cmp byte[B3_CHARACTER_COUNTER],26
				je reload_B3_
				
		return_B3_: ;.........................................
			    mov cl,[CURRENT_ENTERED_CHARACTER]
				  
      			  cmp byte[B2_CURRENT_CHARACTER],cl
				  je update_B2_
      			  cmp byte[B1_CURRENT_CHARACTER],cl
				  je update_B1_
      			  cmp byte[B4_CURRENT_CHARACTER],cl
				  je update_B4_
				  
				  cmp word[CURRENT_LEVEL],2
				  je OOHO_LEVEL_2_HA_3
				   cmp word[CURRENT_LEVEL],3
				  je OOHO_LEVEL_3_HA_3
				  ;....................................... 
 		jmp LOOP1_GAME

		reload_B3_:  mov byte[B3_CHARACTER_COUNTER],0
				 jmp return_B3_

POSITION_OF_BALLON_1_WRAPPER_B3_: mov word[B3_COUNTER],0
                              jmp WRRAPER_DONE_B3_
							  
OOHO_LEVEL_2_HA_3: cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
                    jmp LOOP1_GAME

OOHO_LEVEL_3_HA_3:cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
					cmp byte[B6_CURRENT_CHARACTER],cl
                    je update_B6_
                    jmp LOOP1_GAME 			

UPDATE_B3_COLOR_COUNTER_: mov word[B3_COLOR_COUNTER],0
                         jmp B3_COLOR_COUNTER_UPDATED_					
;;//////////////////////////////BALLON4 LOGIC///////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////				
				
update_di_B4: call B4_CLEAR
 add word[B4_COUNTER],2
add word[B4_COLOR_COUNTER],1
			  cmp word[B4_COLOR_COUNTER],8
			  je UPDATE_B4_COLOR_COUNTER
B4_COLOR_COUNTER_UPDATED:
              cmp word[B4_COUNTER],8
              je POSITION_OF_BALLON_1_WRAPPER_B4			  
WRRAPER_DONE_B4: mov si,[B4_COUNTER]
                    mov ax,[POSITION_OF_BALLON_4+si]
					mov word[CURRENT_POS_B4],AX
			  add byte[B4_CHARACTER_COUNTER],1
			  cmp byte[B4_CHARACTER_COUNTER],26
			  je reload_B4
		return_B4:    cmp word[CURRENT_mode],1
                      je  update_SURVIVOR_END_4		
        RET_B4:            		jmp LOOP1_GAME

		reload_B4:  mov byte[B4_CHARACTER_COUNTER],0
				  jmp return_B4
				  
POSITION_OF_BALLON_1_WRAPPER_B4:     mov word[B4_COUNTER],0
                                   jmp WRRAPER_DONE_B4 	

UPDATE_B4_COLOR_COUNTER: mov word[B4_COLOR_COUNTER],0
                         jmp B4_COLOR_COUNTER_UPDATED

update_SURVIVOR_END_4: add word[SURVIVAL_COUNTER],1
							  jmp RET_B4								   
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON4//////////////////////////////////////
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B4_: mov word[Ballon_pop],1
              call B4_CLEAR
 call play_pop_sound
add word[B4_COUNTER],2 
add word[B4_COLOR_COUNTER],1
			  cmp word[B4_COLOR_COUNTER],8
			  je UPDATE_B4_COLOR_COUNTER_
B4_COLOR_COUNTER_UPDATED_:
              cmp word[B4_COUNTER],8
              jge POSITION_OF_BALLON_1_WRAPPER_B4_			  
WRRAPER_DONE_B4_:   mov si,[B4_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_4+si]
					mov word[CURRENT_POS_B4],ax
			  call UPDATE_SCORE
			  			  mov byte[B4_CURRENT_CHARACTER],0				
			 
done_THIS_B4_:	
				add byte[B4_CHARACTER_COUNTER],1
			  cmp byte[B4_CHARACTER_COUNTER],26
				je reload_B4_
				
		return_B4_: ;.......................................
		  mov cl,[CURRENT_ENTERED_CHARACTER]
				  
      			  cmp byte[B2_CURRENT_CHARACTER],cl
				  je update_B2_
      			  cmp byte[B3_CURRENT_CHARACTER],cl
				  je update_B3_
      			  cmp byte[B1_CURRENT_CHARACTER],cl
				  je update_B1_
				  
				  cmp word[CURRENT_LEVEL],2
				  je OOHO_LEVEL_2_HA_4
				   cmp word[CURRENT_LEVEL],3
				  je OOHO_LEVEL_3_HA_4
				  ;...................................... 
		jmp LOOP1_GAME

		reload_B4_:  mov byte[B4_CHARACTER_COUNTER],0
				 jmp return_B4_

POSITION_OF_BALLON_1_WRAPPER_B4_: mov word[B4_COUNTER],0
                              jmp WRRAPER_DONE_B4_ 

OOHO_LEVEL_2_HA_4: cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
                    jmp LOOP1_GAME

OOHO_LEVEL_3_HA_4:cmp byte[B5_CURRENT_CHARACTER],cl
                    je update_B5_
					cmp byte[B6_CURRENT_CHARACTER],cl
                    je update_B6_
                    jmp LOOP1_GAME    

UPDATE_B4_COLOR_COUNTER_: mov word[B4_COLOR_COUNTER],0
                         jmp B4_COLOR_COUNTER_UPDATED_					
;;;;;///////////////////////////////////////CALLING PAUSE  SCREEN//////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////
				 
stop:                       mov di,0
DRAWING_OF_LEVEL_COMPLETE_:	mov ax,[es:di]
                            mov [PAUSE_BUUFER+di],AX
                            add di,2
                            cmp di,8000
                            jne DRAWING_OF_LEVEL_COMPLETE_ 
        push di
		push dx
		mov byte[pauseGame_],1
        call pause
mov di,0
DRAWING_OF_LEVEL_COMPLETE__: 
                            mov ax,[PAUSE_BUUFER+di]
								mov [es:di],ax
                            add di,2
                            cmp di,8000
                            jne DRAWING_OF_LEVEL_COMPLETE__ 		
		mov byte[pauseGame_],0
        xor ax,ax
		 
		pop dx
		pop di
        jmp LOOP1_GAME		
		
;;		
		
; DRAW_LEVEL_1: call LEVEL_1_THEME
              ; jmp DRAWING_OF_LEVEL_COMPLETE		

; DRAW_LEVEL_2: call LEVEL_2_THEME
              ; jmp DRAWING_OF_LEVEL_COMPLETE	
			  
;/////////////////////////////////////////////lEVEL 2 EXTRA BALLON///////////////////////////////			  
;///////////////////////////////////////////////////////////////////////////////////////////////

			  ;;//////////////////////////////BALLON5 LOGIC////////////////////////////////				
;;///////////////////////////////////////////////////////////////////////////				
update_di_B5:  call B5_CLEAR
add word[B5_COUNTER],2
add word[B5_COLOR_COUNTER],1
cmp word[B5_CHARACTER_COUNTER],8
              je B5_UPDATE_COLOR		  
B5_COLOR_UPDATED:              je POSITION_OF_BALLON_5_WRAPPER_B5			  
WRRAPER_DONE_B5: mov si,[B5_COUNTER]
                    mov ax,[POSITION_OF_BALLON_5+si]
					mov word[CURRENT_POS_B5],AX
              add byte[B5_CHARACTER_COUNTER],1
			  cmp byte[B5_CHARACTER_COUNTER],26
			  je reload_B5

		return_B5:    jmp LOOP1_GAME

		reload_B5:  mov byte[B5_CHARACTER_COUNTER],0
				  jmp return_B5
				  
POSITION_OF_BALLON_5_WRAPPER_B5:     mov word[B5_COUNTER],0
                                   jmp WRRAPER_DONE_B5 		



B5_UPDATE_COLOR: mov word[B5_COLOR_COUNTER],0
                 jmp B5_COLOR_UPDATED
							  
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON5//////////////////////////////////////
;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B5_: mov word[Ballon_pop],1
            call B5_CLEAR
 call play_pop_sound
add word[B5_COUNTER],2 
add word[B5_COLOR_COUNTER],1
cmp word[B5_CHARACTER_COUNTER],8
              je B5_UPDATE_COLOR_			  
B5_COLOR_UPDATED_:              
              cmp word[B5_COUNTER],8
              jge POSITION_OF_BALLON_5_WRAPPER_B5_			  
WRRAPER_DONE_B5_:   mov si,[B5_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_5+si]
					mov word[CURRENT_POS_B5],AX
			  call UPDATE_SCORE
			  mov byte[B5_CURRENT_CHARACTER],0				
			  
done_THIS_B5_:				  
				add byte[B5_CHARACTER_COUNTER],1
			  cmp byte[B5_CHARACTER_COUNTER],26
				je reload_B5_
				
		return_B5_: ;.............;;.............
				  mov cl,[CURRENT_ENTERED_CHARACTER]
				  cmp byte[B1_CURRENT_CHARACTER],cl
				  je update_B1_
      			  cmp byte[B2_CURRENT_CHARACTER],cl
				  je update_B2_
      			  cmp byte[B3_CURRENT_CHARACTER],cl
				  je update_B3_
      			  cmp byte[B4_CURRENT_CHARACTER],cl
				  je update_B4_
				  
				
				   cmp word[CURRENT_LEVEL],3
				  je OOHO_LEVEL_3_HA_5
			  ;;;..........................................  
		jmp LOOP1_GAME

		reload_B5_: mov byte[B5_CHARACTER_COUNTER],0; 
				 jmp return_B5_

POSITION_OF_BALLON_5_WRAPPER_B5_: mov word[B5_COUNTER],0
                              jmp WRRAPER_DONE_B5_  
							  

OOHO_LEVEL_3_HA_5:cmp byte[B6_CURRENT_CHARACTER],cl
                    je update_B6_
                    jmp LOOP1_GAME    							  							  
							  
							  
B5_UPDATE_COLOR_: mov word[B5_COLOR_COUNTER],0
                 jmp B5_COLOR_UPDATED_							  
			  ;;//////////////////////////////BALLON6 LOGIC////////////////////////////////				
;;///////////////////////////////////////////////////////////////////////////				
update_di_B6:  call B6_CLEAR
add word[B6_COUNTER],2
              cmp word[B6_COUNTER],8
              je POSITION_OF_BALLON_6_WRAPPER_B6			  
WRRAPER_DONE_B6: mov si,[B6_COUNTER]
                    mov ax,[POSITION_OF_BALLON_6+si]
					mov word[CURRENT_POS_B6],AX
              add byte[B6_CHARACTER_COUNTER],1
			  cmp byte[B6_CHARACTER_COUNTER],26
			  je reload_B6

		return_B6:    jmp LOOP1_GAME

		reload_B6:  mov byte[B6_CHARACTER_COUNTER],0
				  jmp return_B6
				  
POSITION_OF_BALLON_6_WRAPPER_B6:     mov word[B6_COUNTER],0
                                   jmp WRRAPER_DONE_B6 		




							  
;;;;;//////////////////////////////UPDATING SCORE DUE TO BALLON5//////////////////////////////////////
;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////				 
update_B6_: mov word[Ballon_pop],1
            call B6_CLEAR
 call play_pop_sound  
 add word[B6_COUNTER],2 
              cmp word[B6_COUNTER],8
              jge POSITION_OF_BALLON_6_WRAPPER_B6_			  
WRRAPER_DONE_B6_:   mov si,[B6_COUNTER]           
				    mov ax,[POSITION_OF_BALLON_6+si]
					mov word[CURRENT_POS_B6],AX
			  call UPDATE_SCORE
			  mov byte[B6_CURRENT_CHARACTER],0				
			  
done_THIS_B6_:				  
				add byte[B6_CHARACTER_COUNTER],1
			  cmp byte[B6_CHARACTER_COUNTER],26
				je reload_B6_
				
		return_B6_: ;.............;;.............
				  mov cl,[CURRENT_ENTERED_CHARACTER]
				  
				  cmp byte[B1_CURRENT_CHARACTER],cl
				  je update_B1_
      			  cmp byte[B2_CURRENT_CHARACTER],cl
				  je update_B2_
      			  cmp byte[B3_CURRENT_CHARACTER],cl
				  je update_B3_
      			  cmp byte[B4_CURRENT_CHARACTER],cl
				  je update_B4_
				  cmp byte[B5_CURRENT_CHARACTER],cl
				  je update_B5_
			  ;;;..........................................  
		jmp LOOP1_GAME

		reload_B6_: mov byte[B6_CHARACTER_COUNTER],0; 
				 jmp return_B6_

POSITION_OF_BALLON_6_WRAPPER_B6_: mov word[B6_COUNTER],0
                              jmp WRRAPER_DONE_B6_  							  
			  
;;//////////////////////////////////////Ending Game/////////////////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////////////////



				
game_end:		pop dx
				pop di
				pop AX
				pop es
				pop bp
		 
				ret
;;//////////////////////////////CLEAR SCREEN FUNCTION FOR PAUSE SCREEN//////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////
clrscr_PAUSE:
	push ax
	push es
	
	push di
	
	mov ax , 0xb800
	mov di , 0
	mov es , ax
	
	nextchar_pause:
		mov ax , 0x0ADB
		mov word [es:di] , ax
		add di , 2
		cmp di , 4000
		jne nextchar_pause	

      pop di
	  pop es
	  pop ax
      ret  


;;//////////////////////////////PAUSE SCREEN////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////	  
print_P1_PAUSE:
        pusha
		
		
		
		mov ah,0x02
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,24
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+664],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		
		
		mov word[es:di+1610],ax
		mov word[es:di+1612],ax
		
	  popa
	  ret
print_A_PAUSE:
        pusha
		
		mov ah,0x02
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,44
		mov word[es:di+490+4],ax
		mov word[es:di+490+6],ax
		mov word[es:di+490+8],ax
		mov word[es:di+504-4],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax
		
		
		mov word[es:di+1452],ax
		mov word[es:di+1452-2],ax
	    mov word[es:di+1462+2],ax
		mov word[es:di+1462],ax

		
		mov word[es:di+1614-2],ax
		mov word[es:di+1614-4],ax
		mov word[es:di+1620+2],ax
		mov word[es:di+1620+4],ax

	  popa
	  ret
	  
	  
	  	  
print_U_PAUSE:
        pusha
		
		mov ah,0x02
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,64
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+502],ax
		mov word[es:di+504],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+662],ax
		mov word[es:di+664],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax
		mov word[es:di+1302],ax
		mov word[es:di+1304],ax
		
		
		mov word[es:di+1452],ax

		mov word[es:di+1462],ax

		
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		mov word[es:di+1620],ax

	  popa
	  ret
	  
print_S_PAUSE:
        pusha
		
		mov ah,0x02
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,86
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		mov word[es:di+660],ax
		mov word[es:di+662],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+808],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		mov word[es:di+1142],ax
		
		
		mov word[es:di+1302],ax
		mov word[es:di+1300],ax
		mov word[es:di+1304],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		mov word[es:di+1460],ax
		mov word[es:di+1462],ax
		
		
		mov word[es:di+1612],ax
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1620],ax
		mov word[es:di+1618],ax
		
	  popa
	  ret
	  
print_E_PAUSE:
        pusha
		
		mov ah,0x02
		mov al,0xDB
		
		mov si,0xb800
		mov es,si
		mov di,104
		mov word[es:di+490],ax
		mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		mov word[es:di+502],ax
		mov word[es:di+504],ax
		
		mov word[es:di+650],ax
		mov word[es:di+652],ax
		
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		
		mov word[es:di+970],ax
		mov word[es:di+972],ax
		mov word[es:di+974],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+980],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1138],ax
		mov word[es:di+1140],ax
		
		mov word[es:di+1290],ax
		mov word[es:di+1292],ax

		mov word[es:di+1450],ax
		mov word[es:di+1452],ax
		
		
		mov word[es:di+1610],ax
		mov word[es:di+1612],ax
		mov word[es:di+1614],ax
		mov word[es:di+1616],ax
		mov word[es:di+1618],ax
		mov word[es:di+1620],ax
		mov word[es:di+1622],ax
		mov word[es:di+1624],ax
		
		
	  popa
	  ret
	  

RESUME_PAUSE:
        pusha
		mov di,2436
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x07
		mov cl,' '
		mov  word[es:di+10],cx
		mov  word[es:di+1],cx
		mov  word[es:di-2],cx
		mov ch,0x0F
loop1_PAUSE:		mov cl,[msg1_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size1_GAME]
		jle loop1_PAUSE
     popa 
     ret	 
	 
END_PAUSE:
        pusha
		mov di,2756
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x07
		mov cl,' '
		mov  word[es:di+6],cx
		mov  word[es:di-2],cx
		mov ch,0x0F
loop2_PAUSE:		mov cl,[msg2_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size2_GAME]
		jle loop2_PAUSE
     popa 
     ret
	 
	 
R_TIME_PAUSE:
 pusha
		mov di,2820
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x07
		mov cl,' '
		mov  word[es:di+6],cx
		mov  word[es:di-2],cx
		mov ch,0x0F
loop_R:		mov cl,[msg4_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size4_GAME]
		jle loop_R
        mov si,0  
loop_REM_TIME:		mov cl,[TIME_DIGIT+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp byte[TIME_DIGIT+si],0x00
		jne loop_REM_TIME	
		
		
     popa 
     ret
	 
C_SCORE_PAUSE:
 pusha
		mov di,2500
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x07
		mov cl,' '
		mov  word[es:di+6],cx
		mov  word[es:di-2],cx
		mov ch,0x0F
loop_S:		mov cl,[msg5_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size5_GAME]
		jle loop_S
		mov si,0
loop_REM_SCORE:		mov cl,[SCORE_digit_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,2
		jle loop_REM_SCORE
     popa 
     ret
	 

	 
Instruction_PAUSE:
        pusha
		mov di,3720
		mov si,0
		mov ax,0xb800
		mov es,ax
		mov ch,0x0F
loop3_INSTRUCTION:		mov cl,[msg3_GAME+si]
		mov  word[es:di],cx
		add di,2
		add si,1
		cmp si,[size3_GAME]
		jle loop3_INSTRUCTION
     popa 
     ret   		
pause:      pusha

             call stop_sound
	        call clrscr_PAUSE
			call print_P1_PAUSE
			call print_A_PAUSE
			
			call print_U_PAUSE
			call print_S_PAUSE
			call print_E_PAUSE
			
			call RESUME_PAUSE
			call END_PAUSE
			call R_TIME_PAUSE
			call C_SCORE_PAUSE
			call Instruction_PAUSE			
		    xor ax,ax
retu1_pause: mov ah,0x00		;call input	
            int 16h
            cmp al,32
            je back_FROM_PAUSE
			cmp al,27
			je GAME_END_SO_RETURN;GAME_END
			
			jmp retu1_pause
			; cmp al,32
			; jne retu1_pause
GAME_END_SO_RETURN: mov byte[GAME_END_SO],1			
back_FROM_PAUSE: popa
          ret 				
;/////////////////////////////////////////////////END_OF_GAME//////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////	
Print_secren2:	pusha		
			   call clearscreen_GAME

				call DrawBaloon_GAME
			
GAME_END:                popa
				ret
				
;;////////////////////////////////////////LEVEL 1 SCREEN//////////////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////////////				

CLOUD_1_LEVEL_1_POS: dw 320
CLOUD_2_LEVEL_1_POS: dw -140
CLOUD_3_LEVEL_1_POS: dw -200


clscr_LEVEL_1: pusha
mov di,0
       mov ax,0xb800
	   mov es,ax
	   mov ax,0x0BDB
       mov cx,2000
	   cld
	   rep stosw
       std  
       popa 
	   ret


GRASS: pusha
       mov ax,0xb800
	   mov es,ax
	   mov ah,0x02
	   mov al,0xDB
       mov cx,6
	   mov di,3040
F_G_1_LEVEL_1:  mov word[es:di],ax
        add di,160
        loop F_G_1_LEVEL_1

       mov cx,5
	   mov di,3202
F_G_2_LEVEL_1:  mov word[es:di],ax
        add di,160
        loop F_G_2_LEVEL_1
      
	  mov ah,0x0A
       mov cx,5
	   mov di,3204
F_G_3_LEVEL_1:  mov word[es:di],ax
        add di,160
        loop F_G_3_LEVEL_1
		
       mov cx,4
	   mov di,3366
F_G_4_LEVEL_1:  mov word[es:di],ax
        add di,160
        loop F_G_4_LEVEL_1

mov ah,0x02
       mov cx,3
	   mov di,3528
F_G_5_LEVEL_1:  mov word[es:di],ax
        add di,160
        loop F_G_5_LEVEL_1

       mov cx,3
	   mov di,3850
F_G_6_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_6_LEVEL_1
		
       mov cx,2
	   mov di,3852
F_G_7_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_7_LEVEL_1

mov ah,0x0A
       mov cx,2
	   mov di,3854
F_G_8_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_8_LEVEL_1

       mov cx,2
	   mov di,3856
F_G_9_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_9_LEVEL_1

mov ah,0x02
       mov cx,2
	   mov di,3858
F_G_10_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_10_LEVEL_1

       mov cx,3
	   mov di,3860
F_G_11_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_11_LEVEL_1

mov ah,0x0A
       mov cx,3
	   mov di,3862
F_G_12_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_12_LEVEL_1

    mov cx,3
	   mov di,3864
F_G_13_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_13_LEVEL_1

mov ah,0x02
        mov cx,3
	   mov di,3866
F_G_14_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_14_LEVEL_1
				
		    mov cx,3
	   mov di,3868
F_G_15_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_15_LEVEL_1
		
		mov ah,0x0A
		    mov cx,3
	   mov di,3870
F_G_16_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_16_LEVEL_1
		
		mov cx,4
	   mov di,3872
F_G_17_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_17_LEVEL_1

mov ah,0x02
		mov cx,4
	   mov di,3874
F_G_18_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_18_LEVEL_1

		mov cx,4
	   mov di,3876
F_G_19_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_19_LEVEL_1
		
		mov ah,0x0A
		mov cx,4
	   mov di,3878
F_G_20_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_20_LEVEL_1		
		
		mov cx,4
	   mov di,3880
F_G_21_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_21_LEVEL_1		
		
		mov ah,0x02
			mov cx,4
	   mov di,3882
F_G_22_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_22_LEVEL_1	
		
		mov cx,4
	   mov di,3884
F_G_23_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_23_LEVEL_1

mov ah,0x0A
		mov cx,4
	   mov di,3886
F_G_24_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_24_LEVEL_1		
		
		mov cx,5
	   mov di,3888
F_G_25_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_25_LEVEL_1		
		
		mov ah,0x02
	mov cx,5
	   mov di,3890
F_G_26_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_26_LEVEL_1			
		
	mov cx,5
	   mov di,3892
F_G_27_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_27_LEVEL_1			
		
		mov ah,0x0A
	mov cx,5
	   mov di,3894
F_G_28_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_28_LEVEL_1			
		
	mov cx,5
	   mov di,3896
F_G_29_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_29_LEVEL_1			
		
		mov ah,0x02
	mov cx,5
	   mov di,3898
F_G_30_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_30_LEVEL_1			
		
	mov cx,5
	   mov di,3900
F_G_31_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_31_LEVEL_1			
		
		mov ah,0x0A
mov cx,5
	   mov di,3902
F_G_32_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_32_LEVEL_1					
		
mov cx,5
	   mov di,3904
F_G_33_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_33_LEVEL_1					
		
		mov ah,0x02
	mov cx,5
	   mov di,3906
F_G_34_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_34_LEVEL_1				
		
mov cx,5
	   mov di,3908
F_G_35_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_35_LEVEL_1					
		
		mov ah,0x0A
mov cx,5
	   mov di,3910
F_G_36_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_36_LEVEL_1					
		
mov cx,5
	   mov di,3912
F_G_37_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_37_LEVEL_1					
		
		mov ah,0x02
mov cx,5
	   mov di,3914
F_G_38_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_38_LEVEL_1
		
mov cx,4
	   mov di,3916
F_G_39_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_39_LEVEL_1

mov ah,0x0A
mov cx,4
	   mov di,3918
F_G_40_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_40_LEVEL_1					
		
mov cx,4
	   mov di,3920
F_G_41_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_41_LEVEL_1
		
		mov ah,0x02
mov cx,4
	   mov di,3922
F_G_42_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_42_LEVEL_1
						
mov cx,4
	   mov di,3924
F_G_43_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_43_LEVEL_1
				
				mov ah,0x0A
mov cx,4
	   mov di,3926
F_G_44_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_44_LEVEL_1
						
mov cx,4
	   mov di,3928
F_G_45_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_45_LEVEL_1
		
		mov ah,0x0A		
mov cx,4
	   mov di,3930
F_G_46_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_46_LEVEL_1		
		
mov cx,3
	   mov di,3932
F_G_47_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_47_LEVEL_1				
		
		mov ah,0x02
mov cx,3
	   mov di,3934
F_G_48_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_48_LEVEL_1			
		
mov cx,3
	   mov di,3936
F_G_49_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_49_LEVEL_1			
		
		mov ah,0x0A
mov cx,3
	   mov di,3938
F_G_50_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_50_LEVEL_1			
		
mov cx,3
	   mov di,3940
F_G_51_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_51_LEVEL_1		
		
		mov ah,0x02
mov cx,3
	   mov di,3942
F_G_52_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_52_LEVEL_1		
		
mov cx,2
	   mov di,3944
F_G_53_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_53_LEVEL_1		
		
mov cx,2
	   mov di,3946
F_G_54_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_54_LEVEL_1				
		
mov cx,2
	   mov di,3948
F_G_55_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_55_LEVEL_1				
		
		mov ah,0x02
mov cx,1
	   mov di,3950
F_G_56_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_56_LEVEL_1				
		
mov cx,1
	   mov di,3952
F_G_57_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_57_LEVEL_1			
		
		mov ah,0x0A
mov cx,1
	   mov di,3954
F_G_58_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_58_LEVEL_1		
		
mov cx,1
	   mov di,3956
F_G_59_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_59_LEVEL_1	      

mov ah,0x02
mov cx,2
	   mov di,3958
F_G_60_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_60_LEVEL_1	

mov cx,2
	   mov di,3960
F_G_61_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_61_LEVEL_1	

mov ah,0x0A
mov cx,2
	   mov di,3962
F_G_62_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_62_LEVEL_1	
mov cx,2
	   mov di,3964
F_G_63_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_63_LEVEL_1	

mov ah,0x0A
mov cx,2
	   mov di,3966
F_G_64_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_64_LEVEL_1	

mov cx,3
	   mov di,3968
F_G_65_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_65_LEVEL_1	

mov ah,0x02
mov cx,3
	   mov di,3970
F_G_66_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_66_LEVEL_1	
		
mov cx,3
	   mov di,3972
F_G_67_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_67_LEVEL_1			

mov ah,0x0A
mov cx,3
	   mov di,3974
F_G_68_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_68_LEVEL_1	

mov cx,3
	   mov di,3976
F_G_69_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_69_LEVEL_1

mov ah,0x02
mov cx,3
	   mov di,3978
F_G_70_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_70_LEVEL_1	

mov cx,4
	   mov di,3980
F_G_71_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_71_LEVEL_1

mov ah,0x0A
mov cx,4
	   mov di,3982
F_G_72_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_72_LEVEL_1
		
mov cx,4
	   mov di,3984
F_G_73_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_73_LEVEL_1

mov ah,0x02
mov cx,4
	   mov di,3986
F_G_74_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_74_LEVEL_1


mov cx,4
	   mov di,3988
F_G_75_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_75_LEVEL_1

mov ah,0x0A
mov cx,5
	   mov di,3990
F_G_76_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_76_LEVEL_1

mov cx,5
	   mov di,3992
F_G_77_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_77_LEVEL_1

mov ah,0x02
mov cx,5
	   mov di,3994
F_G_78_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_78_LEVEL_1

mov cx,5
	   mov di,3996
F_G_79_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_79_LEVEL_1

mov ah,0x0A
mov cx,5
	   mov di,3998
F_G_80_LEVEL_1:  mov word[es:di],ax
        sub di,160
        loop F_G_80_LEVEL_1
		
       popa 
	   ret
SUN_LEVEL_1: pusha 

mov ah,0x40
       mov ah,0x0E
		mov al,0xDB
		mov dh,0x0F
		mov dl,0xDB
		mov di,-230


	mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		
		mov word[es:di+1130],ax
		mov word[es:di+1132],ax
		mov word[es:di+1128],ax
		mov word[es:di+1138],ax
		mov word[es:di+1134],ax
		mov word[es:di+1136],ax
		mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		mov word[es:di+1142],ax
		mov word[es:di+1144],ax
		
		mov word[es:di+1292],ax
		mov word[es:di+1294],ax
		mov word[es:di+1296],ax
		mov word[es:di+1298],ax
		mov word[es:di+1300],ax
		mov word[es:di+1302],ax
		  

popa
ret		  


CLOUD1_LEVEL_1:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,380


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax

		  

popa
ret	


CLOUD2_LEVEL_1:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,-140


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		  

popa
ret	

CLOUD3_LEVEL_1:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,-200


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

;;/////////////////////////////////////////////////LEVEL 1 BG FUNCTION/////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////////////////////////

LEVEL_1_THEME:pusha
       call clscr_LEVEL_1
       call GRASS
	   call SUN_LEVEL_1
	   call CLOUD1_LEVEL_1
	   call CLOUD2_LEVEL_1
	   call CLOUD3_LEVEL_1
      popa
      ret
				
;;////////////////////////////////////////////LEVEL 2 SCREEN//////////////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////////////////


CLOUD_1_LEVEL_2_POS: dw 300
CLOUD_2_LEVEL_2_POS: dw -130
CLOUD_3_LEVEL_2_POS: dw -220
CLOUD_4_LEVEL_2_POS: dw 1210
CLOUD_5_LEVEL_2_POS: dw 844
CLOUD_6_LEVEL_2_POS: dw 1108
CLOUD_7_LEVEL_2_POS: dw 1460
CLOUD_8_LEVEL_2_POS: dw 492

clscr_LEVEL_2: pusha
mov di,0
       mov ax,0xb800
	   mov es,ax
	   mov ax,0x0BDB
       mov cx,1200
	   cld
	   rep stosw


mov ax,0x03DB
       mov cx,856
	   rep stosw
	   
std
       popa 
	   ret


BUILDINGS_LEVEL_2: pusha
       mov ax,0xb800
	   mov es,ax
	   mov ah,0x00
	   mov al,0xDB
       mov cx,4
	   mov di,3360
F_G_1:  mov word[es:di],ax
        add di,160
        loop F_G_1
 
       mov cx,2
	   mov di,3682
F_G_2:  mov word[es:di],ax
        add di,160
        loop F_G_2

      mov cx,2
	   mov di,3684
F_G_3:  mov word[es:di],ax
        add di,160
        loop F_G_3
		
      mov cx,3
	   mov di,3526
F_G_4:  mov word[es:di],ax
        add di,160
        loop F_G_4		


      mov cx,4
	   mov di,3368
F_G_5:  mov word[es:di],ax
        add di,160
        loop F_G_5

      mov cx,4
	   mov di,3370
F_G_6:  mov word[es:di],ax
        add di,160
        loop F_G_6

      mov cx,3
	   mov di,3532
F_G_7:  mov word[es:di],ax
        add di,160
        loop F_G_7

      mov cx,5
	   mov di,3214
F_G_8:  mov word[es:di],ax
        add di,160
        loop F_G_8

      mov cx,5
	   mov di,3216
F_G_9:  mov word[es:di],ax
        add di,160
        loop F_G_9

     mov cx,3
	   mov di,3538
F_G_10:  mov word[es:di],ax
        add di,160
        loop F_G_10

     mov cx,6
	   mov di,3060
F_G_11:  mov word[es:di],ax
        add di,160
        loop F_G_11
     mov cx,6
	   mov di,3062
F_G_12:  mov word[es:di],ax
        add di,160
        loop F_G_12

     mov cx,6
	   mov di,3064
F_G_13:  mov word[es:di],ax
        add di,160
        loop F_G_13

     mov cx,3
	   mov di,3546
F_G_14:  mov word[es:di],ax
        add di,160
        loop F_G_14

     mov cx,3
	   mov di,3548
F_G_15:  mov word[es:di],ax
        add di,160
        loop F_G_15

     mov cx,3
	   mov di,3550
F_G_16:  mov word[es:di],ax
        add di,160
        loop F_G_16

     mov cx,5
	   mov di,3232
F_G_17:  mov word[es:di],ax
        add di,160
        loop F_G_17

     mov cx,5
	   mov di,3234
F_G_18:  mov word[es:di],ax
        add di,160
        loop F_G_18

     mov cx,4
	   mov di,3396
F_G_19:  mov word[es:di],ax
        add di,160
        loop F_G_19		
		
     mov cx,4
	   mov di,3398
F_G_20:  mov word[es:di],ax
        add di,160
        loop F_G_20				
		
	     mov cx,4
	   mov di,3400
F_G_21:  mov word[es:di],ax
        add di,160
        loop F_G_21		
		
     mov cx,7
	   mov di,2922
F_G_22:  mov word[es:di],ax
        add di,160
        loop F_G_22				
		
     mov cx,7
	   mov di,2924
F_G_23:  mov word[es:di],ax
        add di,160
        loop F_G_23	

     mov cx,7
	   mov di,2926
F_G_24:  mov word[es:di],ax
        add di,160
        loop F_G_24			
		
     mov cx,5
	   mov di,3248
F_G_25:  mov word[es:di],ax
        add di,160
        loop F_G_25			
		
     mov cx,5
	   mov di,3250
F_G_26:  mov word[es:di],ax
        add di,160
        loop F_G_26			
		
     mov cx,3
	   mov di,3572
F_G_27:  mov word[es:di],ax
        add di,160
        loop F_G_27			
		
     mov cx,3
	   mov di,3574
F_G_28:  mov word[es:di],ax
        add di,160
        loop F_G_28					
		
     mov cx,4
	   mov di,3416
F_G_29:  mov word[es:di],ax
        add di,160
        loop F_G_29					
		
     mov cx,4
	   mov di,3418
F_G_30:  mov word[es:di],ax
        add di,160
        loop F_G_30		
		
     mov cx,3
	   mov di,3580
F_G_31:  mov word[es:di],ax
        add di,160
        loop F_G_31				
		
     mov cx,3
	   mov di,3582
F_G_32:  mov word[es:di],ax
        add di,160
        loop F_G_32				
		
		
     mov cx,5
	   mov di,3264
F_G_33:  mov word[es:di],ax
        add di,160
        loop F_G_33						
		
     mov cx,5
	   mov di,3266
F_G_34:  mov word[es:di],ax
        add di,160
        loop F_G_34			
		
     mov cx,5
	   mov di,3268
F_G_35:  mov word[es:di],ax
        add di,160
        loop F_G_35			
		
     mov cx,3
	   mov di,3590
F_G_36:  mov word[es:di],ax
        add di,160
        loop F_G_36			
		
     mov cx,4
	   mov di,3432
F_G_37:  mov word[es:di],ax
        add di,160
        loop F_G_37		
		
		
     mov cx,4
	   mov di,3434
F_G_38:  mov word[es:di],ax
        add di,160
        loop F_G_38		

		
     mov cx,3
	   mov di,3596
F_G_39:  mov word[es:di],ax
        add di,160
        loop F_G_39		

		
     mov cx,2
	   mov di,3758
F_G_40:  mov word[es:di],ax
        add di,160
        loop F_G_40		
	
     mov cx,2
	   mov di,3760
F_G_41:  mov word[es:di],ax
        add di,160
        loop F_G_41

     mov cx,4
	   mov di,3442
F_G_42:  mov word[es:di],ax
        add di,160
        loop F_G_42

     mov cx,4
	   mov di,3444
F_G_43:  mov word[es:di],ax
        add di,160
        loop F_G_43

     mov cx,4
	   mov di,3446
F_G_44:  mov word[es:di],ax
        add di,160
        loop F_G_44

     mov cx,4
	   mov di,3448
F_G_45:  mov word[es:di],ax
        add di,160
        loop F_G_45

     mov cx,2
	   mov di,3770
F_G_46:  mov word[es:di],ax
        add di,160
        loop F_G_46

     mov cx,2
	   mov di,3772
F_G_47:  mov word[es:di],ax
        add di,160
        loop F_G_47


     mov cx,5
	   mov di,3294
F_G_48:  mov word[es:di],ax
        add di,160
        loop F_G_48

     mov cx,6
	   mov di,3296
F_G_49:  mov word[es:di],ax
        add di,160
        loop F_G_49

     mov cx,7
	   mov di,2978
F_G_50:  mov word[es:di],ax
        add di,160
        loop F_G_50

     mov cx,7
	   mov di,2980
F_G_51:  mov word[es:di],ax
        add di,160
        loop F_G_51

     mov cx,7
	   mov di,2982
F_G_52:  mov word[es:di],ax
        add di,160
        loop F_G_52

     mov cx,7
	   mov di,2984
F_G_53:  mov word[es:di],ax
        add di,160
        loop F_G_53

     mov cx,3
	   mov di,3626
F_G_54:  mov word[es:di],ax
        add di,160
        loop F_G_54

     mov cx,3
	   mov di,3628
F_G_55:  mov word[es:di],ax
        add di,160
        loop F_G_55

     mov cx,3
	   mov di,3630
F_G_56:  mov word[es:di],ax
        add di,160
        loop F_G_56

     mov cx,5
	   mov di,3312
F_G_57:  mov word[es:di],ax
        add di,160
        loop F_G_57

     mov cx,5
	   mov di,3314
F_G_58:  mov word[es:di],ax
        add di,160
        loop F_G_58

     mov cx,5
	   mov di,3316
F_G_59:  mov word[es:di],ax
        add di,160
        loop F_G_59

     mov cx,3
	   mov di,3638
F_G_60:  mov word[es:di],ax
        add di,160
        loop F_G_60

     mov cx,6
	   mov di,3160
F_G_61:  mov word[es:di],ax
        add di,160
        loop F_G_61

     mov cx,6
	   mov di,3162
F_G_62:  mov word[es:di],ax
        add di,160
        loop F_G_62

     mov cx,6
	   mov di,3164
F_G_63:  mov word[es:di],ax
        add di,160
        loop F_G_63

     mov cx,3
	   mov di,3646
F_G_64:  mov word[es:di],ax
        add di,160
        loop F_G_64

     mov cx,3
	   mov di,3808
F_G_65:  mov word[es:di],ax
        add di,160
        loop F_G_65

     mov cx,4
	   mov di,3490
F_G_66:  mov word[es:di],ax
        add di,160
        loop F_G_66

     mov cx,4
	   mov di,3492
F_G_67:  mov word[es:di],ax
        add di,160
        loop F_G_67

     mov cx,3
	   mov di,3654
F_G_68:  mov word[es:di],ax
        add di,160
        loop F_G_68

     mov cx,3
	   mov di,3656
F_G_69:  mov word[es:di],ax
        add di,160
        loop F_G_69

     mov cx,6
	   mov di,3178
F_G_70:  mov word[es:di],ax
        add di,160
        loop F_G_70

     mov cx,6
	   mov di,3180
F_G_71:  mov word[es:di],ax
        add di,160
        loop F_G_71

     mov cx,6
	   mov di,3182
F_G_72:  mov word[es:di],ax
        add di,160
        loop F_G_72

     mov cx,2
	   mov di,3824
F_G_73:  mov word[es:di],ax
        add di,160
        loop F_G_73

     mov cx,2
	   mov di,3826
F_G_74:  mov word[es:di],ax
        add di,160
        loop F_G_74

     mov cx,3
	   mov di,3666
F_G_75:  mov word[es:di],ax
        add di,160
        loop F_G_75
		
     mov cx,3
	   mov di,3668
F_G_76:  mov word[es:di],ax
        add di,160
        loop F_G_76		
		
     mov cx,3
	   mov di,3830
F_G_77:  mov word[es:di],ax
        add di,160
        loop F_G_77		
		
     mov cx,4
	   mov di,3512
F_G_78:  mov word[es:di],ax
        add di,160
        loop F_G_78		
		
     mov cx,6
	   mov di,3194
F_G_79:  mov word[es:di],ax
        add di,160
        loop F_G_79			
		
     mov cx,6
	   mov di,3196
F_G_80:  mov word[es:di],ax
        add di,160
        loop F_G_80	
		
     mov cx,6
	   mov di,3198
F_G_81:  mov word[es:di],ax
        add di,160
        loop F_G_81
		
       popa 
	   ret
	   

	   
SUN_LEVEL_2: pusha 

mov ah,0x40
       mov ah,0x0E
		mov al,0xDB
		mov dh,0x0F
		mov dl,0xDB
		mov di,1188
		
		
        
		
        mov word[es:di+490],ax
	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		mov word[es:di+504],ax
		
		mov word[es:di+646],ax
		mov word[es:di+648],ax
		mov word[es:di+650],ax
		mov word[es:di+660],dx
		mov word[es:di+652],ax
		mov word[es:di+654],dx
		mov word[es:di+656],dx
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],dx
		mov word[es:di+666],ax
		mov word[es:di+668],ax
		
		mov word[es:di+802],ax
		mov word[es:di+804],ax
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],dx
		mov word[es:di+814],dx
		mov word[es:di+816],dx
		mov word[es:di+818],dx
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		mov word[es:di+830],ax
		mov word[es:di+832],ax
		
		mov word[es:di+960],ax
		mov word[es:di+962],ax
		 mov word[es:di+964],ax
		 mov word[es:di+966],ax
		 mov word[es:di+970],dx
		 mov word[es:di+974],dx
		 mov word[es:di+972],dx
		 mov word[es:di+968],ax
		 mov word[es:di+976],dx
		 mov word[es:di+978],ax
		 mov word[es:di+986],ax
		 mov word[es:di+982],ax
		 mov word[es:di+984],ax
	      mov word[es:di+980],ax
		 mov word[es:di+988],ax
		  mov word[es:di+990],ax
		  mov word[es:di+992],ax
		  mov word[es:di+994],ax
		
		mov word[es:di+1118],ax
		mov word[es:di+1120],ax
		mov word[es:di+1122],ax
		mov word[es:di+1124],ax
		mov word[es:di+1126],ax
		 mov word[es:di+1130],ax
		 mov word[es:di+1132],ax
		 mov word[es:di+1128],ax
		 mov word[es:di+1138],ax
		 mov word[es:di+1134],ax
		 mov word[es:di+1136],ax
		 mov word[es:di+1140],ax
		mov word[es:di+1146],ax
		 mov word[es:di+1142],ax
		 mov word[es:di+1144],ax
		mov word[es:di+1148],ax
		mov word[es:di+1150],ax
		mov word[es:di+1152],ax
		mov word[es:di+1154],ax
		mov word[es:di+1156],ax


popa
ret		  


CLOUD1_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_1_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax

		  

popa
ret	


CLOUD2_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_2_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		  

popa
ret	

CLOUD3_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_3_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD4_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_4_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD5_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_5_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD6_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_6_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD7_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_7_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
	
		
		  

popa
ret	

CLOUD8_LEVEL_2:pusha 

mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		mov dh,0x07
		mov dl,0xDB
		mov di,[CLOUD_8_LEVEL_2_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		

popa
ret	

;;////////////////////////////////////LEVEL 2 BG FUNCTION///////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////
LEVEL_2_THEME:pusha 
       call clscr_LEVEL_2
       call BUILDINGS_LEVEL_2
	   call SUN_LEVEL_2
	   call CLOUD1_LEVEL_2
	   call CLOUD2_LEVEL_2
	   call CLOUD3_LEVEL_2
	   call CLOUD4_LEVEL_2
	   call CLOUD5_LEVEL_2
	   call CLOUD6_LEVEL_2
	   call CLOUD7_LEVEL_2
	   call CLOUD8_LEVEL_2
  
       popa
	   ret
				
;;////////////////////////////////////////LEVEL 3 SCREEN//////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////



CLOUD_1_LEVEL_3_POS: dw -286
CLOUD_2_LEVEL_3_POS: dw 160
CLOUD_3_LEVEL_3_POS: dw -218
CLOUD_4_LEVEL_3_POS: dw 1260
CLOUD_5_LEVEL_3_POS: dw 870
CLOUD_6_LEVEL_3_POS: dw 1708
CLOUD_7_LEVEL_3_POS: dw 600
CLOUD_8_LEVEL_3_POS: dw 1154
CLOUD_9_LEVEL_3_POS: dw 1944

clscr_LEVEL_3: pusha
mov di,0
       mov ax,0xb800
	   mov es,ax
	   mov ax,0x00DB
       mov cx,2002
	   cld
	   rep stosw
std
       popa 
	   ret
	   

BUILDINGS__LEVEL_3: pusha
       mov ax,0xb808
	   mov es,ax
	   mov ah,0x0F
	   mov al,0xDB
       mov cx,4
	   mov di,3360
F_G_1_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_1_LEVEL_3
 
       mov cx,2
	   mov di,3682
F_G_2_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_2_LEVEL_3

      mov cx,2
	   mov di,3684
F_G_3_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_3_LEVEL_3
		
      mov cx,3
	   mov di,3526
F_G_4_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_4_LEVEL_3		


      mov cx,4
	   mov di,3368
F_G_5_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_5_LEVEL_3

      mov cx,4
	   mov di,3370
F_G_6_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_6_LEVEL_3

      mov cx,3
	   mov di,3532
F_G_7_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_7_LEVEL_3

      mov cx,5
	   mov di,3214
F_G_8_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_8_LEVEL_3

      mov cx,5
	   mov di,3216
F_G_9_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_9_LEVEL_3

     mov cx,3
	   mov di,3538
F_G_10_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_10_LEVEL_3

     mov cx,6
	   mov di,3060
F_G_11_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_11_LEVEL_3
     mov cx,6
	   mov di,3062
F_G_12_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_12_LEVEL_3

     mov cx,6
	   mov di,3064
F_G_13_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_13_LEVEL_3

     mov cx,3
	   mov di,3546
F_G_14_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_14_LEVEL_3

     mov cx,3
	   mov di,3548
F_G_15_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_15_LEVEL_3

     mov cx,3
	   mov di,3550
F_G_16_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_16_LEVEL_3

     mov cx,5
	   mov di,3232
F_G_17_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_17_LEVEL_3

     mov cx,5
	   mov di,3234
F_G_18_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_18_LEVEL_3

     mov cx,4
	   mov di,3396
F_G_19_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_19_LEVEL_3		
		
     mov cx,4
	   mov di,3398
F_G_20_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_20_LEVEL_3				
		
	     mov cx,4
	   mov di,3400
F_G_21_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_21_LEVEL_3		
		
     mov cx,7
	   mov di,2922
F_G_22_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_22_LEVEL_3				
		
     mov cx,7
	   mov di,2924
F_G_23_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_23_LEVEL_3	

     mov cx,7
	   mov di,2926
F_G_24_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_24_LEVEL_3			
		
     mov cx,5
	   mov di,3248
F_G_25_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_25_LEVEL_3			
		
     mov cx,5
	   mov di,3250
F_G_26_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_26_LEVEL_3			
		
     mov cx,3
	   mov di,3572
F_G_27_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_27_LEVEL_3			
		
     mov cx,3
	   mov di,3574
F_G_28_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_28_LEVEL_3					
		
     mov cx,4
	   mov di,3416
F_G_29_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_29_LEVEL_3					
		
     mov cx,4
	   mov di,3418
F_G_30_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_30_LEVEL_3		
		
     mov cx,3
	   mov di,3580
F_G_31_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_31_LEVEL_3				
		
     mov cx,3
	   mov di,3582
F_G_32_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_32_LEVEL_3				
		
		
     mov cx,5
	   mov di,3264
F_G_33_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_33_LEVEL_3						
		
     mov cx,5
	   mov di,3266
F_G_34_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_34_LEVEL_3			
		
     mov cx,5
	   mov di,3268
F_G_35_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_35_LEVEL_3			
		
     mov cx,3
	   mov di,3590
F_G_36_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_36_LEVEL_3			
		
     mov cx,4
	   mov di,3432
F_G_37_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_37_LEVEL_3		
		
		
     mov cx,4
	   mov di,3434
F_G_38_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_38_LEVEL_3		

		
     mov cx,3
	   mov di,3596
F_G_39_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_39_LEVEL_3		

		
     mov cx,2
	   mov di,3758
F_G_40_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_40_LEVEL_3		
	
     mov cx,2
	   mov di,3760
F_G_41_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_41_LEVEL_3

     mov cx,4
	   mov di,3442
F_G_42_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_42_LEVEL_3

     mov cx,4
	   mov di,3444
F_G_43_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_43_LEVEL_3

     mov cx,4
	   mov di,3446
F_G_44_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_44_LEVEL_3

     mov cx,4
	   mov di,3448
F_G_45_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_45_LEVEL_3

     mov cx,2
	   mov di,3770
F_G_46_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_46_LEVEL_3

     mov cx,2
	   mov di,3772
F_G_47_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_47_LEVEL_3


     mov cx,5
	   mov di,3294
F_G_48_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_48_LEVEL_3

     mov cx,6
	   mov di,3296
F_G_49_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_49_LEVEL_3

     mov cx,7
	   mov di,2978
F_G_50_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_50_LEVEL_3

     mov cx,7
	   mov di,2980
F_G_51_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_51_LEVEL_3

     mov cx,7
	   mov di,2982
F_G_52_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_52_LEVEL_3

     mov cx,7
	   mov di,2984
F_G_53_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_53_LEVEL_3

     mov cx,3
	   mov di,3626
F_G_54_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_54_LEVEL_3

     mov cx,3
	   mov di,3628
F_G_55_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_55_LEVEL_3

     mov cx,3
	   mov di,3630
F_G_56_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_56_LEVEL_3

     mov cx,5
	   mov di,3312
F_G_57_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_57_LEVEL_3

     mov cx,5
	   mov di,3314
F_G_58_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_58_LEVEL_3

     mov cx,5
	   mov di,3316
F_G_59_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_59_LEVEL_3

     mov cx,3
	   mov di,3638
F_G_60_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_60_LEVEL_3

     mov cx,6
	   mov di,3160
F_G_61_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_61_LEVEL_3

     mov cx,6
	   mov di,3162
F_G_62_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_62_LEVEL_3

     mov cx,6
	   mov di,3164
F_G_63_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_63_LEVEL_3

     mov cx,3
	   mov di,3646
F_G_64_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_64_LEVEL_3

     mov cx,3
	   mov di,3808
F_G_65_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_65_LEVEL_3

     mov cx,4
	   mov di,3490
F_G_66_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_66_LEVEL_3

     mov cx,4
	   mov di,3492
F_G_67_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_67_LEVEL_3

     mov cx,3
	   mov di,3654
F_G_68_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_68_LEVEL_3

     mov cx,3
	   mov di,3656
F_G_69_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_69_LEVEL_3

     mov cx,6
	   mov di,3178
F_G_70_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_70_LEVEL_3

     mov cx,6
	   mov di,3180
F_G_71_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_71_LEVEL_3

     mov cx,6
	   mov di,3182
F_G_72_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_72_LEVEL_3

     mov cx,2
	   mov di,3824
F_G_73_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_73_LEVEL_3

     mov cx,2
	   mov di,3826
F_G_74_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_74_LEVEL_3

     mov cx,3
	   mov di,3666
F_G_75_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_75_LEVEL_3
		
     mov cx,3
	   mov di,3668
F_G_76_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_76_LEVEL_3		
		
     mov cx,3
	   mov di,3830
F_G_77_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_77_LEVEL_3		
		
     mov cx,4
	   mov di,3512
F_G_78_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_78_LEVEL_3		
		
     mov cx,6
	   mov di,3194
F_G_79_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_79_LEVEL_3			
		
     mov cx,6
	   mov di,3196
F_G_80_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_80_LEVEL_3	
		
     mov cx,6
	   mov di,3198
F_G_81_LEVEL_3:  mov word[es:di],ax
        add di,160
        loop F_G_81_LEVEL_3
		
       popa 
	   ret
	   

	   
MOON: pusha 
mov ax,0xb800
		 mov es,ax

       mov ah,0x09
		mov al,0xDB
		
		mov di,540
		
		
		 mov word[es:di+18],ax
		 mov word[es:di+20],ax
         mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	  
	   
	   add di,160
	   
	  
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	    mov word[es:di+32],ax
	  
	   
	      add di,160
	   
	 
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   
	   
	      add di,160
	   
	
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	   
	      add di,160
	   
	   
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	    mov word[es:di+42],ax
		 mov word[es:di+44],ax
	   
	      add di,160
	   
	  
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	    mov word[es:di+42],ax
		 mov word[es:di+44],ax
		 
	      add di,160
	   
	  
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	    mov word[es:di+42],ax
		 mov word[es:di+44],ax
	   
	      add di,160
	   mov word[es:di-8-2],ax
	   mov word[es:di-8],ax
		
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	    mov word[es:di+42],ax
		 mov word[es:di+44],ax
		 
	      add di,160
	   mov word[es:di-6-4],ax
	    mov word[es:di-6-2],ax
	    mov word[es:di-6],ax
		 mov word[es:di+2-6],ax
		
        mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	    mov word[es:di+42],ax
		 mov word[es:di+44],ax
	   
	      add di,160
		   
	    mov word[es:di-4-2],ax
	    mov word[es:di-4],ax
		 mov word[es:di+2-4],ax
		 mov word[es:di+4-4],ax
		 mov word[es:di+2],ax
		
		 mov word[es:di+20],ax
         mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	   mov word[es:di+40],ax
	   
	      add di,160
	   mov word[es:di-4-2],ax
	   mov word[es:di-4],ax
		mov word[es:di+2-4],ax
		 mov word[es:di+4-4],ax
		 mov word[es:di+6-4],ax
		mov word[es:di+6],ax
		 mov word[es:di+4],ax
		 mov word[es:di+8],ax
		 mov word[es:di+10],ax
		 mov word[es:di+12],ax
		 mov word[es:di+14],ax
		 mov word[es:di+16],ax
		 mov word[es:di+18],ax
		 mov word[es:di+20],ax
         mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	   mov word[es:di+38],ax
	    mov word[es:di+40],ax
	   
	      add di,160
	    mov word[es:di-4],ax
	    mov word[es:di-2],ax
	   mov word[es:di],ax
		mov word[es:di+2],ax
		mov word[es:di+4],ax
		mov word[es:di+6],ax
		mov word[es:di+8],ax
		mov word[es:di+10],ax
		mov word[es:di+12],ax
		mov word[es:di+14],ax
		mov word[es:di+16],ax
		mov word[es:di+18],ax
		mov word[es:di+20],ax
        mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax
	   mov word[es:di+34],ax
	   mov word[es:di+36],ax
	    
	   
	   	      add di,160
	   
	    mov word[es:di],ax
		 mov word[es:di+2],ax
		 mov word[es:di+4],ax
		mov word[es:di+6],ax
		mov word[es:di+8],ax
		mov word[es:di+10],ax
		mov word[es:di+12],ax
		mov word[es:di+14],ax
		mov word[es:di+16],ax
		mov word[es:di+18],ax
		mov word[es:di+20],ax
        mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax
	   mov word[es:di+28],ax
	   mov word[es:di+30],ax
	     mov word[es:di+32],ax

	   
	   	      add di,160
	   

		 mov word[es:di+6],ax
		mov word[es:di+8],ax
		mov word[es:di+10],ax
		mov word[es:di+12],ax
		mov word[es:di+14],ax
		mov word[es:di+16],ax
		mov word[es:di+18],ax
		mov word[es:di+20],ax
        mov word[es:di+22],ax
		mov word[es:di+24],ax
       mov word[es:di+26],ax

	   
popa
ret			  


CLOUD1_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x07
		mov al,0xDB

		mov di,[CLOUD_1_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax

		  

popa
ret	


CLOUD2_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		
		mov di,[CLOUD_2_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		  

popa
ret	

CLOUD3_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		
		mov di,[CLOUD_3_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD4_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		
		mov di,[CLOUD_4_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD5_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x0F
		mov al,0xDB

		mov di,[CLOUD_5_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD6_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x07
		mov al,0xDB
		
		mov di,[CLOUD_6_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		mov word[es:di+964],ax
		mov word[es:di+966],ax
		mov word[es:di+970],ax
		mov word[es:di+974],ax
		mov word[es:di+972],ax
		mov word[es:di+968],ax
		mov word[es:di+976],ax
		mov word[es:di+978],ax
		mov word[es:di+986],ax
		mov word[es:di+982],ax
		mov word[es:di+984],ax
		mov word[es:di+980],ax
		mov word[es:di+988],ax
		mov word[es:di+990],ax
		
		  

popa
ret	

CLOUD7_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x07
		mov al,0xDB
		
		mov di,[CLOUD_7_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
	
		
		  

popa
ret	

CLOUD8_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x07
		mov al,0xDB
	
		mov di,[CLOUD_8_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		

popa
ret	

CLOUD9_LEVEL_3:pusha 
mov ax,0xb800
		 mov es,ax
mov ah,0x40
       mov ah,0x0F
		mov al,0xDB
		
		mov di,[CLOUD_9_LEVEL_3_POS]


	    mov word[es:di+492],ax
		mov word[es:di+494],ax
		mov word[es:di+496],ax
		mov word[es:di+502],ax
		mov word[es:di+498],ax
		mov word[es:di+500],ax
		
		mov word[es:di+650],ax
		mov word[es:di+660],ax
		mov word[es:di+652],ax
		mov word[es:di+654],ax
		mov word[es:di+656],ax
		mov word[es:di+664],ax
		mov word[es:di+662],ax
		mov word[es:di+658],ax
		
		mov word[es:di+806],ax
		mov word[es:di+808],ax
		mov word[es:di+810],ax
		mov word[es:di+812],ax
		mov word[es:di+814],ax
		mov word[es:di+816],ax
		mov word[es:di+818],ax
		mov word[es:di+820],ax
		mov word[es:di+822],ax
		mov word[es:di+822],ax
		mov word[es:di+824],ax
		mov word[es:di+826],ax
		mov word[es:di+828],ax
		
		  

popa
ret	
starrs_LEVEL_3: pusha 

         mov ax,0xb800
		 mov es,ax
		 mov ah,0x8F
		 mov al,0x07
		 mov cx,1000
		 mov di,2
print_star:      mov al,0x07
          		  stosw
               add di,26
			  
			   loop print_star
		 popa 
		 ret
starrs_1_LEVEL_3: pusha 

         mov ax,0xb800
		 mov es,ax
		 mov ah,0x0F
		 mov al,0x07
		 mov cx,300
		 mov di,2
print_star_1:      mov al,0x04
          		  stosw
               add di,96
			  
			   loop print_star_1
		 popa 
		 ret		 
WINDOWS_FOR_LEVEL_3:pusha
		 mov ax,0xb800
		 mov es,ax
		 
		 mov di,3750
		 
		 mov word[es:di],0x0EFE
		 mov word[es:di-320],0x0EFE
		 mov word[es:di-640],0x0EFE
		 
		 
		  mov word[es:di-800],0x0FDB
		 mov word[es:di-800-2],0x0FDB
		 mov word[es:di-800+2],0x0FDB
		 
		 mov word[es:di-320-4],0x0EFE
		 mov word[es:di-4],0x0EFE
		 
		 mov di,3730
		 
		 mov word[es:di+2],0x0EFE
		 mov word[es:di-160+6],0x0FDB
		 
		 mov di,3700
		 
		 mov word[es:di-4],0x0EFE
		 mov word[es:di-320-8],0x0EFE
		 mov word[es:di-8],0x0EFE
		 mov word[es:di-640-8],0x0EFE
		 mov word[es:di-800-8],0x0FDB
		 mov word[es:di-800-10],0x0FDB
		 
		 mov di,3770
		 
		 mov word[es:di-320],0x0EFE
		 mov word[es:di],0x0EFE
		 
		 mov di,3762
		 
		 mov word[es:di-320],0x0EFE
		 mov word[es:di],0x0EFE
		 mov word[es:di-480],0x0FDB
		 mov word[es:di-480+2],0x0FDB
		 
		 mov di,3776
		 
		 mov word[es:di+4],0x0EFE
		 
		 mov di,3780
		 
		 mov word[es:di+8],0x0EFE
		 mov word[es:di+8-320],0x0EFE
		 
		 mov di, 3790
		 
		 mov word[es:di+12],0x0EFE
		 mov word[es:di+16],0x0EFE
		 mov word[es:di-320+16],0x0EFE
		 
		 mov di,3810
		 
		 mov word[es:di+6-160],0x0EFE
		 
		 mov di,3830
		 
		 mov word[es:di-480],0x0EFE
		 mov word[es:di-160],0x0EFE
		 mov word[es:di-320-6],0x0FFE
		 
		 mov di,3560
		 
		 mov word[es:di-6],0x0FFE

popa 
ret		 

;;//////////////////////////////////////LEVEL 3 BG FUNCTION/////////////////////////////////
;;/////////////////////////////////////////////////////////////////////////////////////////

LEVEL_3_THEME:pusha
 call clscr_LEVEL_3
 call starrs_LEVEL_3
 call starrs_1_LEVEL_3
       call BUILDINGS__LEVEL_3
	    call MOON
	     call CLOUD1_LEVEL_3
	     call CLOUD2_LEVEL_3
	     call CLOUD3_LEVEL_3
	     call CLOUD4_LEVEL_3
	     call CLOUD5_LEVEL_3
	     call CLOUD6_LEVEL_3
	     call CLOUD7_LEVEL_3
	     call CLOUD8_LEVEL_3
		 call CLOUD9_LEVEL_3
		 call WINDOWS_FOR_LEVEL_3

		 
         popa 
		 ret
		 
;;/////////////////////////////////////////LEVEL SELECTION SECREEN////////////////////////////////
;;///////////////////////////////////////////////////////////////////////////////////////////////


get_level: db 'SELECT A LEVEL'				
len_level: dw 13
LEVEL_1_NAME: db 'LEVEL 1',0
LEVEL_2_NAME: db 'LEVEL 2',0
LEVEL_3_NAME: db 'LEVEL 3',0

LEVEL_1_NAME_COLOR: db 0x20
LEVEL_2_NAME_COLOR: db 0x70
LEVEL_3_NAME_COLOR: db 0x70

LEVEL_1_DISCRIPTION_1: db '> Level 1 is basic.',0
LEVEL_1_DISCRIPTION_2: db '> Level 1 has a Day theme.',0
LEVEL_1_DISCRIPTION_3: db '> Level 1 has the same rules given in instruction.',0
LEVEL_1_DISCRIPTION_4: db '> Level 1 has 4 baloons.',0

LEVEL_2_DISCRIPTION_1: db '> Level 2 has mid level difficulty .',0
LEVEL_2_DISCRIPTION_2: db '> Level 2 has a Sunset theme.',0
LEVEL_2_DISCRIPTION_3: db '> Level 2 has the same rules but time is also ticks fast.',0
LEVEL_2_DISCRIPTION_4: db '> Level 2 has 5 baloons, increased speed.',0

LEVEL_3_DISCRIPTION_1: db '> Level 3 is hard.',0
LEVEL_3_DISCRIPTION_2: db '> Level 3 has a Night theme.',0
LEVEL_3_DISCRIPTION_3: db '> Level 3 has the same rules but time is also ticks fast.',0
LEVEL_3_DISCRIPTION_4: db '> Level 3 has 6 baloons,increased speed .',0

LEVEL_1_MSG_POSITION_WHEN_LEVEL: dw 0,1672,1672,1672
LEVEL_2_MSG_POSITION_WHEN_LEVEL: dw 0,2472,1832,1832
LEVEL_3_MSG_POSITION_WHEN_LEVEL: dw 0,2632,2632,1992



CURRENT_LEVEL: dw 1
		
				
clearscreen_input_LEVEL_SELECTION: push ES
					 push AX
					 push di
					 
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
nextloc_input_LEVEL_SELECTION:    mov word[es:di]	,0x07DB
					add di,2
					cmp di,4000
					jne nextloc_input_LEVEL_SELECTION


					pop di
					pop AX
					pop ES

					ret	
print_input_LEVEL_SLECTION:
          pusha
		  	MOV		AX, 0xB800
				MOV		ES, AX
				mov si,0
				mov di,0
				
				next_input_LEVEL_SELECTION:   mov bh,0x70
         				mov bl,[get_level+si]
          				mov word[es:1032+di],bx
					add di,2
					add si,1
					cmp si,[len_level]
					jle next_input_LEVEL_SELECTION
					
popa
ret

LEVEL_1_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,1800
				mov si,0
				mov bh,0x71
L1_DISC_1:        mov bl,[LEVEL_1_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L1_DISC_1
				
				mov di,1960
				mov si,0
				mov bh,0x71
L1_DISC_2:        mov bl,[LEVEL_1_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L1_DISC_2				
				
				mov di,2120
				mov si,0
				mov bh,0x71
L1_DISC_3:        mov bl,[LEVEL_1_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L1_DISC_3

				mov di,2280
				mov si,0
				mov bh,0x71
L1_DISC_4:        mov bl,[LEVEL_1_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L1_DISC_4
				
				popa 
				ret
				
				
LEVEL_2_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,1960
				mov si,0
				mov bh,0x71
L2_DISC_1:        mov bl,[LEVEL_2_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L2_DISC_1
				
				mov di,2120
				mov si,0
				mov bh,0x71
L2_DISC_2:        mov bl,[LEVEL_2_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L2_DISC_2				
				
				mov di,2280
				mov si,0
				mov bh,0x71
L2_DISC_3:        mov bl,[LEVEL_2_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L2_DISC_3

				mov di,2440
				mov si,0
				mov bh,0x71
L2_DISC_4:        mov bl,[LEVEL_2_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L2_DISC_4
				
				popa 
				ret				
				
LEVEL_3_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,2120
				mov si,0
				mov bh,0x71
L3_DISC_1:        mov bl,[LEVEL_3_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L3_DISC_1
				
				mov di,2280
				mov si,0
				mov bh,0x71
L3_DISC_2:        mov bl,[LEVEL_3_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L3_DISC_2				
				
				mov di,2440
				mov si,0
				mov bh,0x71
L3_DISC_3:        mov bl,[LEVEL_3_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L3_DISC_3

				mov di,2600
				mov si,0
				mov bh,0x71
L3_DISC_4:        mov bl,[LEVEL_3_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne L3_DISC_4
				
				popa 
				ret						

SELECTING_LEVEL: pusha
  CHECK_LEVEL:                                         call clearscreen_input_LEVEL_SELECTION
						  call print_input_LEVEL_SLECTION
MOV		AX, 0xB800
				MOV		ES, AX
				mov ax,2
				mov si,0
				mov bp,[CURRENT_LEVEL]
				mul bp
				mov bp,ax
				mov di,[LEVEL_1_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[LEVEL_1_NAME_COLOR]
LEVEL1_LOOP:				mov bl,[LEVEL_1_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne LEVEL1_LOOP
                cmp word[CURRENT_LEVEL],1
				je level_1_ha

                 

				
level_1_ho_gaya:mov ax,2
				mov si,0
				mov bp,[CURRENT_LEVEL]
				mul bp
				mov bp,ax
				mov di,[LEVEL_2_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[LEVEL_2_NAME_COLOR]
LEVEL2_LOOP:				mov bl,[LEVEL_2_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne LEVEL2_LOOP
				
				 cmp word[CURRENT_LEVEL],2
				je level_2_ha
				
level_2_ho_gaya:				mov ax,2
				mov si,0
				mov bp,[CURRENT_LEVEL]
				mul bp
				mov bp,ax
				mov di,[LEVEL_3_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[LEVEL_3_NAME_COLOR]

LEVEL3_LOOP:				mov bl,[LEVEL_3_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne LEVEL3_LOOP
				
				 cmp word[CURRENT_LEVEL],3
				je level_3_ha
level_3_ho_gaya:				
				xor ax,AX
				int 16h
				cmp al,13
				je LEVEL_CHECK_END
				cmp al,'s'
				je CHANGING_LEVEL_1
				cmp al,'S'
				je CHANGING_LEVEL_1
				
				cmp al,'w'
				je CHANGING_LEVEL_2
				cmp al,'W'
				je CHANGING_LEVEL_2
				
CHANGING_LEVEL_1:cmp word[CURRENT_LEVEL],3
                 je NO_MORE_CHANGE
				 cmp word[CURRENT_LEVEL],2
                 je SWAP_2_and_3
				 add word[CURRENT_LEVEL],1
				 mov cl,[LEVEL_2_NAME_COLOR]
            mov  ch,[LEVEL_1_NAME_COLOR]
			mov [LEVEL_2_NAME_COLOR],ch
			mov [LEVEL_1_NAME_COLOR],cl
				 jmp CHECK_LEVEL
				 
SWAP_2_and_3: mov cl,[LEVEL_2_NAME_COLOR]
            mov  ch,[LEVEL_3_NAME_COLOR]
			mov [LEVEL_2_NAME_COLOR],ch
			mov [LEVEL_3_NAME_COLOR],cl
			add word[CURRENT_LEVEL],1
NO_MORE_CHANGE:			jmp CHECK_LEVEL




CHANGING_LEVEL_2: cmp word[CURRENT_LEVEL],3
                  jne SWAP_3_and_2
				  sub word[CURRENT_LEVEL],1
				   mov cl,[LEVEL_2_NAME_COLOR]
            mov  ch,[LEVEL_3_NAME_COLOR]
			mov [LEVEL_2_NAME_COLOR],ch
			mov [LEVEL_3_NAME_COLOR],cl
			jmp CHECK_LEVEL
				  
SWAP_3_and_2: 	cmp word[CURRENT_LEVEL],2
                jne SWAP_1_2
				sub word[CURRENT_LEVEL],1
				 mov cl,[LEVEL_2_NAME_COLOR]
            mov  ch,[LEVEL_1_NAME_COLOR]
			mov [LEVEL_2_NAME_COLOR],ch
			mov [LEVEL_1_NAME_COLOR],cl
				 jmp CHECK_LEVEL

SWAP_1_2:  cmp word[CURRENT_LEVEL],1
           jmp CHECK_LEVEL

level_1_ha: call LEVEL_1_DISC_FUNC
            jmp level_1_ho_gaya

level_2_ha: call LEVEL_2_DISC_FUNC
            jmp level_2_ho_gaya

level_3_ha: call LEVEL_3_DISC_FUNC
            jmp level_3_ho_gaya		   						
				 
LEVEL_CHECK_END:				popa
				ret
;;//////////////////////////////////MODE SELECTION///////////////////////////////////
;;///////////////////////////////////////////////////////////////////////

get_mode: db '>>>>> S E L E C T     M O D E <<<<<'				
len_mode: dw 34
mode_1_NAME: db 'SURVIVAL MODE',0
mode_2_NAME: db 'ENDLESS MODE',0
mode_3_NAME: db 'TIME MODE',0

mode_1_NAME_COLOR: db 0x0F
mode_2_NAME_COLOR: db 0x1F
mode_3_NAME_COLOR: db 0x1f

mode_1_DISCRIPTION_1: db '> This level is a restiction.',0
mode_1_DISCRIPTION_2: db '> This level has a cross wire at top theme.',0
mode_1_DISCRIPTION_3: db '> This level has the same rules given in instruction with no time restriction but hurdle.',0
mode_1_DISCRIPTION_4: db '> This level has 4 baloons.',0

mode_2_DISCRIPTION_1: db '> This level is Fikar Free.',0
mode_2_DISCRIPTION_2: db '> This level has a CLEAN theme.',0
mode_2_DISCRIPTION_3: db '> This level has the same rules but no time restriction.',0
mode_2_DISCRIPTION_4: db '> This level has 4 ballons.',0

mode_3_DISCRIPTION_1: db '> This level is time dependent.',0
mode_3_DISCRIPTION_2: db '> This level has further 3 levels.',0
mode_3_DISCRIPTION_3: db '> This level has same rules and some extra rules described further.',0
mode_3_DISCRIPTION_4: db '> This level has different number of ballons.',0

mode_1_MSG_POSITION_WHEN_LEVEL: dw 0,1670,1670,1670
mode_2_MSG_POSITION_WHEN_LEVEL: dw 0,1990,1990,1990
mode_3_MSG_POSITION_WHEN_LEVEL: dw 0,2310,2310,2310



CURRENT_mode: dw 1

				
				
clearscreen_input_mode: push ES
					 push AX
					 push di
					 
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
nextloc_input_mode:    mov word[es:di]	,0x01DB
					add di,2
					cmp di,4000
					jne nextloc_input_mode


					pop di
					pop AX
					pop ES

					ret	
print_input_mode:
          pusha
		  	MOV		AX, 0xB800
				MOV		ES, AX
				mov si,0
				mov di,0
				
				mov bh,0x10
				next_input_mode:   
         				mov bl,[get_mode+si]
          				mov word[es:1006+di],bx
					add di,2
					add si,1
					cmp si,6
					je change_the_arrow_color_1
					cmp si,30
					jge change_the_arrow_color_2
					
					cmp si,[len_mode]
					jle next_input_mode

change_the_arrow_color_1: mov bh,0x1F
                          cmp si,[len_mode]
					jle next_input_mode					
change_the_arrow_color_2: mov bh,0x10
                          cmp si,[len_mode]
					jle next_input_mode 										
popa
ret

mode_1_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,3360
				mov si,0
				mov bh,0x1E
M1_DISC_1:        mov bl,[mode_1_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M1_DISC_1
				
				mov di,3520
				mov si,0
				mov bh,0x1E
M1_DISC_2:        mov bl,[mode_1_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M1_DISC_2				
				
				mov di,3680
				mov si,0
				mov bh,0x1E
M1_DISC_3:        mov bl,[mode_1_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M1_DISC_3

				mov di,3840
				mov si,0
				mov bh,0x1E
M1_DISC_4:        mov bl,[mode_1_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M1_DISC_4
				
				popa 
				ret
				
				
mode_2_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,3360
				mov si,0
				mov bh,0x1B
M2_DISC_1:        mov bl,[mode_2_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M2_DISC_1
				
				mov di,3520
				mov si,0
				mov bh,0x1B
M2_DISC_2:        mov bl,[mode_2_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M2_DISC_2				
				
				mov di,3680
				mov si,0
				mov bh,0x1B
M2_DISC_3:        mov bl,[mode_2_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M2_DISC_3

				mov di,3840
				mov si,0
				mov bh,0x1B
M2_DISC_4:        mov bl,[mode_2_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M2_DISC_4
				
				popa 
				ret				
				
mode_3_DISC_FUNC:pusha
                mov ax,0xB800
				mov es,ax
								mov di,3360
				mov si,0
				mov bh,0x1D
M3_DISC_1:        mov bl,[mode_3_DISCRIPTION_1+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M3_DISC_1
				
				mov di,3520
				mov si,0
				mov bh,0x1D
M3_DISC_2:        mov bl,[mode_3_DISCRIPTION_2+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M3_DISC_2				
				
				mov di,3680
				mov si,0
				mov bh,0x1D
M3_DISC_3:        mov bl,[mode_3_DISCRIPTION_3+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M3_DISC_3

				mov di,3840
				mov si,0
				mov bh,0x1D
M3_DISC_4:        mov bl,[mode_3_DISCRIPTION_4+si] 
                mov word[es:di],bx
                add di,2
				add si,1
				cmp bl,0x00
				jne M3_DISC_4
				
				popa 
				ret						
				
				
				
				
				
				
				
				


SELECTING_mode: pusha
  CHECK_mode:             call clearscreen_input_mode
						  call print_input_mode
MOV		AX, 0xB800
				MOV		ES, AX
				mov ax,2
				mov si,0
				mov bp,[CURRENT_mode]
				mul bp
				mov bp,ax
				mov di,[mode_1_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[mode_1_NAME_COLOR]
mode1_LOOP:				mov bl,[mode_1_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne mode1_LOOP
                cmp word[CURRENT_mode],1
				je mode_1_ha

                 
				
mode_1_ho_gaya:mov ax,2
				mov si,0
				mov bp,[CURRENT_mode]
				mul bp
				mov bp,ax
				mov di,[mode_2_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[mode_2_NAME_COLOR]
mode2_LOOP:				mov bl,[mode_2_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne mode2_LOOP
				
				 cmp word[CURRENT_mode],2
				je mode_2_ha
				
mode_2_ho_gaya:				mov ax,2
				mov si,0
				mov bp,[CURRENT_mode]
				mul bp
				mov bp,ax
				mov di,[mode_3_MSG_POSITION_WHEN_LEVEL+bp]
				mov bh,[mode_3_NAME_COLOR]

mode3_LOOP:				mov bl,[mode_3_NAME+si]
				mov word[es:di],bx
				add di,2
				add si,1
				cmp bl,0x00
				jne mode3_LOOP
				
				 cmp word[CURRENT_mode],3
				je mode_3_ha
mode_3_ho_gaya:				
				xor ax,AX
				int 16h
				cmp al,13
				je mode_CHECK_END
				cmp al,'s'
				je CHANGING_mode_1
				cmp al,'S'
				je CHANGING_mode_1
				
				cmp al,'w'
				je CHANGING_mode_2
				cmp al,'W'
				je CHANGING_mode_2
				
CHANGING_mode_1:cmp word[CURRENT_mode],3
                 je NO_MORE_CHANGE_mode
				 cmp word[CURRENT_mode],2
                 je SWAP_2_and_3_mode
				 add word[CURRENT_mode],1
				 mov cl,[mode_2_NAME_COLOR]
            mov  ch,[mode_1_NAME_COLOR]
			mov [mode_2_NAME_COLOR],ch
			mov [mode_1_NAME_COLOR],cl
				 jmp CHECK_mode
				 
SWAP_2_and_3_mode: mov cl,[mode_2_NAME_COLOR]
            mov  ch,[mode_3_NAME_COLOR]
			mov [mode_2_NAME_COLOR],ch
			mov [mode_3_NAME_COLOR],cl
			add word[CURRENT_mode],1
NO_MORE_CHANGE_mode:			jmp CHECK_mode




CHANGING_mode_2: cmp word[CURRENT_mode],3
                  jne SWAP_3_and_2_mode
				  sub word[CURRENT_mode],1
				   mov cl,[mode_2_NAME_COLOR]
            mov  ch,[mode_3_NAME_COLOR]
			mov [mode_2_NAME_COLOR],ch
			mov [mode_3_NAME_COLOR],cl
			jmp CHECK_mode
				  
SWAP_3_and_2_mode: 	cmp word[CURRENT_mode],2
                jne SWAP_1_2_mode
				sub word[CURRENT_mode],1
				 mov cl,[mode_2_NAME_COLOR]
            mov  ch,[mode_1_NAME_COLOR]
			mov [mode_2_NAME_COLOR],ch
			mov [mode_1_NAME_COLOR],cl
				 jmp CHECK_mode

SWAP_1_2_mode:  cmp word[CURRENT_mode],1
           jmp CHECK_mode

mode_1_ha: call mode_1_DISC_FUNC
            jmp mode_1_ho_gaya

mode_2_ha: call mode_2_DISC_FUNC
            jmp mode_2_ho_gaya

mode_3_ha: call mode_3_DISC_FUNC
            jmp mode_3_ho_gaya		   						
				 
mode_CHECK_END:				popa
				ret
;;////////////////////////////////////save max scores///////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////
LEADER_BOAR_MSG: db 'L E A D E R    B O A R D ',0

SAVE_MAX_SCORES:pusha
                mov bx,[SCORE_BUFFER_COUNTER]
                mov al,[SCORE_digit_GAME+0]
				mov byte[PLAYER_SCORE_BUFFER+bx],al
				add bx,1
				mov al,[SCORE_digit_GAME+1]
				mov byte[PLAYER_SCORE_BUFFER+bx],al
				add bx,1
				mov al,[SCORE_digit_GAME+2]
				mov byte[PLAYER_SCORE_BUFFER+bx],al
				add bx,1
				mov al,'-'
				mov byte[PLAYER_SCORE_BUFFER+bx],al
				add bx,1
				mov word[SCORE_BUFFER_COUNTER],bx
				
popa 
ret				

DISPLAY_MAX_SCORES:pusha
                   mov ax,0xB800
				   mov es,ax
                   mov cx,[SCORE_BUFFER_COUNTER]
				   mov di,216
				   mov si,0
				   mov ah,0x0f
				   mov bh,0x4f
				   mov bl,')'
DMS_LOOP:          mov al,[LEADER_BOAR_MSG+si]
                   mov word[es:di],AX
                   add di,2
                   add si,1
                   cmp byte[LEADER_BOAR_MSG+si-1],0
                   jne DMS_LOOP				   

                   mov di,538
				   mov ah,0x4f
				   mov si,0
				   mov dh,ah
				   mov dl,'1'
DMS_LOOP_1:        
                   mov al,[PLAYER_SCORE_BUFFER+si]
				   
                   cmp al,0
				   je func_ret
				   mov word[es:di],AX
				    add si,1
				   cmp byte[PLAYER_SCORE_BUFFER+si],'-'
				   je UPDATE_MAX_CC
                   add di,2
                   loop DMS_LOOP_1	
                   jmp func_ret				   

UPDATE_MAX_CC:   mov word[es:di-10],dx
                 mov word[es:di-8],bx 
                 add dl,1
                 add si,1
                 add di,316
				 jmp DMS_LOOP_1


func_ret: popa
          ret

;;////////////////////////////////////////////////////////////////////////////////////////////

clearscreen_LEADER: 
					pusha
				MOV		AX, 0xB800
				MOV		ES, AX
				mov di,0
				
		 nextloc_LDR:    mov word[es:di]	,0x4CB9
					 add di,2
					 mov word[es:di]	,0x4CBF
					 add di,2
					jne nextloc_LDR


					popa

					ret			
;;////////////////////////////////////////////pop sound////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////

play_pop_sound:
    push ax
    push bx
    push cx
    
    ; Play a short high-pitched beep for pop
    mov al, 0xB6
    out 0x43, al
    
    ; Frequency for pop sound (higher pitch)
    mov ax, 0x0A00
    out 0x42, al
    mov al, ah
    out 0x42, al
    
    ; Turn on speaker
    in al, 0x61
    or al, 0x03
    out 0x61, al
    
    ; Short delay
    mov cx, 0x1000
sound_delay1:
    nop
    loop sound_delay1
    
    ; Turn off speaker
    in al, 0x61
    and al, 0xFC
    out 0x61, al
    
    pop cx
    pop bx
    pop ax
    ret

play_gameover_sound:
    push ax
    push bx
    push cx
    push dx
    
    ; Play a descending tone for game over
    mov dx, 3  ; Number of tones
    
tone_loop:
    push dx
    
    ; Set up PIT for sound
    mov al, 0xB6
    out 0x43, al
    
    ; Calculate frequency (descending)
    mov ax, dx
    mov bx, 0x0400
    mul bx
    add ax, 0x0800
    
    out 0x42, al
    mov al, ah
    out 0x42, al
    
    ; Turn on speaker
    in al, 0x61
    or al, 0x03
    out 0x61, al
    
    ; Longer delay for each tone
    mov cx, 0x5000
sound_delay2:
    nop
    loop sound_delay2
    
    ; Turn off speaker briefly between tones
    in al, 0x61
    and al, 0xFC
    out 0x61, al
    
    mov cx, 0x1000
sound_delay3:
    nop
    loop sound_delay3
    
    pop dx
    dec dx
    jnz tone_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret

play_life_lost_sound:
    push ax
    push bx
    push cx
    push dx
    
    ; Play a warning tone for life lost
    mov dx, 2  ; Number of tones
    
life_tone_loop:
    push dx
    
    ; Set up PIT for sound
    mov al, 0xB6
    out 0x43, al
    
    ; Lower frequency for warning tone
    mov ax, 0x1000
    out 0x42, al
    mov al, ah
    out 0x42, al
    
    ; Turn on speaker
    in al, 0x61
    or al, 0x03
    out 0x61, al
    
    ; Medium delay
    mov cx, 0x3000
life_sound_delay:
    nop
    loop life_sound_delay
    
    ; Turn off speaker briefly between tones
    in al, 0x61
    and al, 0xFC
    out 0x61, al
    
    mov cx, 0x1000
life_sound_delay2:
    nop
    loop life_sound_delay2
    
    pop dx
    dec dx
    jnz life_tone_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret

stop_sound:
    push ax
    in al, 0x61
    and al, 0xFC
    out 0x61, al
    pop ax
    ret
	
	
	
	
	


tickCount_: dw 0             
musicNoteIndex_: dw 0          
pauseGame_: db 0               
gameOver_: db 0               
oldTimerISR: dd 0           

playBackgroundMusic:
    push ax
    push bx
    push cx
    push dx
    
   ; pause game 
    cmp byte [cs:pauseGame_], 1
    je skipBgMusic
    cmp byte [cs:gameOver_], 0
    jne skipBgMusic
    
    mov ax, [cs:tickCount_]
    and ax, 0x0005           
    cmp ax, 0
    jne skipBgMusic
  
    mov bx, [cs:musicNoteIndex_]
    
    mov al, 182          
    out 43h, al              
    
    shl bx, 1               
    mov ax, [cs:smoothRacingMelody + bx]
    
    cmp ax, 0
    jne continueMusic
    
    mov word [cs:musicNoteIndex_], 0
    mov ax, [cs:smoothRacingMelody]
    
continueMusic:
    out 42h, al              
    mov al, ah
    out 42h, al           
    
    in al, 61h               
    or al, 00000011b       
    out 61h, al
    
    inc word [cs:musicNoteIndex_]
    
skipBgMusic:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

smoothRacingMelody:
    dw 2025  ; C - Low and smooth
    dw 2025  ; Hold C
    dw 1805  ; D
    dw 1805  ; Hold D
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1517  ; F
    dw 1432  ; F#
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1805  ; D
    dw 1805  ; Hold D
    dw 2025  ; C
    dw 2025  ; Hold C
    dw 1805  ; D
    dw 1703  ; D#
    dw 1607  ; E
    dw 1607  ; Hold E
    dw 1517  ; F
    dw 1517  ; Hold F
    dw 1432  ; F#
    dw 1351  ; G
    dw 1275  ; G#
    dw 1275  ; Hold G#
    dw 1351  ; G
    dw 1432  ; F#
    dw 1517  ; F
    dw 1607  ; E
    dw 1805  ; D
    dw 2025  ; C
    dw 2025  ; Hold C
    dw 2273  ; B (lower octave)
    dw 0     ; End marker - loop restart


timerISR:
    push ax
    push ds
    
    push cs
    pop ds
    
    inc word [tickCount_]
   
    cmp byte [pauseGame_], 1
    je timerDone
    
    cmp byte [gameOver_], 1
    je timerDone
   
    call playBackgroundMusic
    
timerDone:
    mov al, 0x20             
    out 0x20, al             
    
    pop ds
    pop ax
    iret  
	
hookTimerInterrupt:
    push es
    push ax
    push bx
    
    cli                   
    
    xor ax, ax
    mov es, ax
    
    mov ax, [es:8*4]      
    mov [oldTimerISR], ax
    mov ax, [es:8*4+2]
    mov [oldTimerISR+2], ax
    
    mov word [es:8*4], timerISR
    mov [es:8*4+2], cs
    
    sti                  
    
    pop bx
    pop ax
    pop es
    ret

unhookTimerInterrupt:
    push es
    push ax
    push bx
    
    cli                    
    
    xor ax, ax
    mov es, ax
    
    mov ax, [oldTimerISR]
    mov [es:8*4], ax
    mov ax, [oldTimerISR+2]
    mov [es:8*4+2], ax
    
    sti                    
    
    pop bx
    pop ax
    pop es
    ret


stopMusic:
    push ax
   
    in al, 61h
    and al, 11111100b       
    out 61h, al
    
    pop ax
    ret


PLAY_BG_SOUND_FORGAME:pusha
    call hookTimerInterrupt
    popa
	ret

	
	


delay_: push cx
mov cx,0x0000
l1: loop l1
pop cx
ret

PLAY_START_SOUND:pusha
 mov cx, 5
LOOP1_:         mov al, 0b6h
out 43h, al

;load the counter 2 value for d3
mov ax, 1fb4h
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay_
mov al, ah
out 61h, al

call delay_

;load the counter 2 value for a3
mov ax, 152fh
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay_
mov al, ah
out 61h, al

call delay_
	
;load the counter 2 value for a4
mov ax, 0A97h
out 42h, al
mov al, ah
out 42h, al
	
;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay_
mov al, ah
out 61h, al

call delay_
 
 loop LOOP1_
popa
ret