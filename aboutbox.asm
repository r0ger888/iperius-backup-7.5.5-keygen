ColorShift	PROTO :DWORD,:DWORD

.const
PictureW 		= 400
PictureH 		= 200
CR_BG1 						equ Black
CR_BTNDOWN1 				equ 0444444h
CR_TEXT1 					equ 0999999h
CR_MIDDLE1 					equ 0e1e1e1h
CR_INBG1 					equ CR_BG1
CR_INTEXT1 					equ 0aaaaaah
CR_RECT1	 				equ CR_BG1
CR_EDITBG1 					equ 0444444h
CR_HOVERTEXT1 				equ 00087ffh
CR_NORMTEXT1 				equ 01e74cbh
CR_HOVEREDGE1				equ CR_TEXT1
CR_BTNNORM1					equ CR_BG1 

.data
Abouttitle	db	"prf::team",0
MyRect 		RECT <1, 1, PictureW, PictureH>
hColDot1	HBRUSH		?
hColDot2	HBRUSH		?

AboutFont	LOGFONT <13, 0, 0, 0, FW_BOLD, 0, 0, 0, 0, 0, 0, 0, 0,"Verdana">
									
x			dd 0
x2			dd 0
txtMul10	dd 0
MADE 		db 0
ScrollCol1	dd 0
haltsec		dd 0
tHalt		BOOL 0
hPen 		dd 0
oldPen 		dd 0

DEG 		dq 1.74532925199433E-02 
Radius 		REAL4 20.0
AngleOffs 	REAL4 180.0
Ratio 		REAL4 -3.0	
Angle 		REAL4 0.0
tempX 		REAL4 0.0
tempY 		REAL4 0.0
CntX 		REAL4 40.0
CntY 		dd 0
PntX1 		dd 0
PntY1 		dd 0
PntX2 		dd 0
PntY2 		dd 0
Ang 		dd 0

uSize						dd 100h

sAboutText					db 13,10,13,10
							db "The PERYFERiAH Team",13,10
							db "Proudly Present",13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10
							db "Target: Iperius Backup 7.5.5",13,10
							db "Protection: SHA-1",13,10
							db "Cracker: GRUiA",13,10
							db "Tune: [-=cRAckEd z0NE=-]",13,10
							db "Date: 1o.feb.2o22",13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10
							db "Sh0ut0utz 2 :",13,10,13,10
							db "SofT MANiAC for CooL Music",13,10
							db "r0ger for CooL GFX",13,10
			                db "PuNkDuDe for CooL About Template",13,10
			                db "MagicH for MagicV2mEngine",13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10
			                db "Greets:",13,10,13,10,13,10,13,10
			                db "Al0hA",13,10
			                db "B@TRyNU",13,10
			                db "yMRAN",13,10
			                db "zzLaTaNN",13,10
			                db "WeeGee",13,10
			                db "r0ger",13,10
			                db "MaryNello",13,10
			                db "ShoGunu`",13,10
			                db "r0bica",13,10
			                db "ShTEFY",13,10
			                db "s0r3l",13,10
			                db "sabYn",13,10
			                db "NoNNy",13,10
			                db "QueenAntonia",13,10
			                db "r0cky",13,10
			                db "st3fan(C)ADR!AN",13,10
			                db "Gyahnni",13,10
			                db "bDM10",13,10
			                db "oViSpider",13,10,13,10,13,10,13,10,13,10,13,10
			                db "but also:",13,10,13,10,13,10,13,10
			                db "Cachito",13,10
			                db "Xylitol",13,10
			                db "Arttomov",13,10
			                db "Razorblade1979",13,10
			                db "Roentgen",13,10
			                db "kao",13,10
			                db "Talers",13,10
			                db "Ayumi",13,10
			                db "SadeghTarget",13,10
			                db "Davidson",13,10
			                db "de!",13,10
			                db "ByTESRam",13,10
			                db "RushEyE",13,10
			                db "rooster1",13,10
			                db "Sangavi",13,10
			                db "Taitor",13,10
			                db "Vinnu",13,10
			                db "and other positive pipl  =)",13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10
			                db "u can find us at",13,10,13,10
			                db "instagram : @r0gerica // @bobo.crt",13,10
			                db "mail : prfteam@hush.com",13,10
			                db "telegram : t.me/r0ger888",13,10
			                db "discord : r0gerica#2649",13,10
			                db "github : r0gerica",13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10
			                db "fuck all da sellers out da",13,10
			                db "tSRh forum, and also ripperz .",13,10,13,10
			                db ":E",13,10
			                db 13,10
			                db 13,0 

sLogoSize					equ $-1 - offset sAboutText

;***************************************************************************************
; stored color scheme variables
;***************************************************************************************
MyScheme					dd 0
CR_BG_SCHEME				dd 0
CR_BTNDOWN_SCHEME 			dd 0
CR_BTNNORM_SCHEME			dd 0
CR_TEXT_SCHEME 				dd 0
CR_MIDDLE_SCHEME 			dd 0
CR_INBG_SCHEME 				dd 0
CR_INTEXT_SCHEME 			dd 0
CR_RECT_SCHEME	 			dd 0
CR_EDITBG_SCHEME			dd 0
CR_HOVERTEXT_SCHEME 		dd 0
CR_NORMTEXT_SCHEME 			dd 0
CR_DOWNTEXT_SCHEME 			dd 0
CR_HOVEREDGE_SCHEME			dd 0
CR_DOWNEDGE_SCHEME			dd 0
CR_BTNOVER_SCHEME			dd 0

.data?
hmainDC 	dd			?
hmainbmp 	dd			?
hdc			HDC 		?
txtRct		RECT		<?>
ps			PAINTSTRUCT	<?>
lb 			LOGBRUSH 	<?>
lb1 		LOGBRUSH 	<?>
lb2 		LOGBRUSH 	<?>
hFont2		dd			?
FadeUp		BOOL		?
FadeDown	BOOL		?

hAbtFont			dd ?
hBgColor 					HBRUSH ?
hTitleFont 					HFONT ?
hEdge 						HPEN ?
hBtnColor 					HBRUSH ?
hitpoint					POINT <>
CloseBtnRct					RECT <?>
hEdgeHover					HPEN ?
hBtnNormColor				HBRUSH ?
hMnuColor					HBRUSH ?
hBtnOver					HBRUSH ?
hMiddleColor 				HBRUSH ?
hInbgColor 					HBRUSH ?
hEditBgColor				HBRUSH ?

.code

Orbit	proc
		finit
		;PntX1 = CntX - (Sin(Angle * DEG) * Radius) 
		fild [Angle]
		fmul [DEG]
		fsin
		fstp dword ptr [tempX]
		fld CntX
		fld Radius	;distance
		fmul dword ptr [tempX]
		fsubp st(1), st
		fistp dword ptr[PntX1]	;X1
		;PntY1 = CntY - (Cos(Angle * DEG) * (Radius / Ratio))
		fild [Angle]
		fmul [DEG]
		fcos
		fstp dword ptr [tempX]
		fild CntY
		fld Radius	;distance
		fdiv dword ptr[Ratio]
		fmul dword ptr [tempX]
		fsubp st(1), st
		fistp dword ptr[PntY1]	;Y1
		; PntX2 = CntX - (Sin((Angle + 180) * DEG) * Radius)
		fild [Angle]
		fadd [AngleOffs]
		fmul [DEG]
		fsin
		fstp [tempX]
		fld CntX
		fld Radius	;distance
		fmul dword ptr [tempX]
		fsubp st(1), st
		fistp dword ptr[PntX2]	;X2
		;PntY2 = CntY - (Cos((Angle + 180) * DEG) * (Radius / Ratio))
		fild [Angle]
		fadd [AngleOffs]
		fmul [DEG]
		fcos
		fstp [tempX]
		fild CntY
		fld Radius	;distance
		fdiv dword ptr[Ratio]
		fmul dword ptr [tempX]
		fsubp st(1), st
		fistp dword ptr[PntY2]	;Y2
		ret
Orbit	endp

ColorShift	proc uses ebx ecx edx inColor:dword, offs:dword
	local red:dword
	local blue:dword
	local green:dword
	local delta:dword

		mov	eax, inColor
		shr	eax, 16
		and	eax, 255
		add	eax, offs
		mov	blue, eax

		mov	eax, inColor
		shr	eax, 8
		and	eax, 255
		add	eax, offs
		mov	green, eax

		mov	eax, inColor
		and	eax, 255
		add	eax, offs
		mov	red, eax

		.if	red > 255
			mov	red, 255
		.elseif red < 0
			mov	red, 0
		.endif

		.if	green > 255
			mov	green, 255
		.elseif green < 0
			mov	green, 0
		.endif

		.if	blue > 255
			mov	blue, 255
		.elseif blue < 0
			mov	blue, 0
		.endif		

		mov	eax, blue
		shl	eax, 16
		mov	edx, green
		mov	ah, dl
		mov	edx, red
		mov	al, dl
		ret
ColorShift	endp


;***************************************************************************************
; Basic Dialog Box Proc
;***************************************************************************************
AboutProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	local sBtnText[10h]:TCHAR ; for WM_DRAWITEM
	local i:dword
	local xPos
	local yPos
	
		.if uMsg == WM_INITDIALOG
		
			invoke SetWindowText,hWnd,addr Abouttitle
			mov	CR_BG_SCHEME, CR_BG1
			mov	CR_BTNDOWN_SCHEME, CR_BTNDOWN1
			mov	CR_BTNOVER_SCHEME, CR_BTNDOWN1
			mov	CR_TEXT_SCHEME, CR_TEXT1
			mov	CR_MIDDLE_SCHEME, CR_MIDDLE1
			mov	CR_INBG_SCHEME, CR_INBG1
			mov CR_INTEXT_SCHEME, CR_INTEXT1
			mov	CR_RECT_SCHEME, CR_RECT1
			mov	CR_EDITBG_SCHEME, CR_EDITBG1
			mov	CR_HOVERTEXT_SCHEME, CR_HOVERTEXT1
			mov	CR_NORMTEXT_SCHEME, CR_NORMTEXT1
			mov	CR_HOVEREDGE_SCHEME, CR_HOVEREDGE1
			mov	CR_DOWNEDGE_SCHEME, CR_HOVEREDGE1
			mov	CR_BTNNORM_SCHEME, CR_BTNNORM1
			;mov	bChangeFont, TRUE
		
		invoke ColorShift, CR_BTNDOWN_SCHEME, 26h
		invoke CreateSolidBrush, eax
		mov	hMnuColor, eax
		invoke CreateSolidBrush, CR_BG_SCHEME
		mov hBgColor, eax
		invoke CreateSolidBrush, CR_BTNDOWN_SCHEME
		mov hBtnColor, eax
		invoke CreateSolidBrush, CR_BTNOVER_SCHEME
		mov hBtnOver, eax
		invoke CreateSolidBrush, CR_MIDDLE_SCHEME
		mov hMiddleColor, eax
		invoke CreateSolidBrush, CR_INBG_SCHEME
		mov hInbgColor, eax
		invoke CreateSolidBrush, CR_EDITBG_SCHEME
		mov	hEditBgColor, eax
		invoke CreateSolidBrush, CR_BTNNORM_SCHEME
		mov	hBtnNormColor, eax
		
		invoke AnimateWindow,hWnd,300,AW_BLEND+AW_ACTIVATE
		
			invoke GetSystemMetrics,SM_CXSCREEN
			mov xPos,eax
			invoke GetSystemMetrics,SM_CYSCREEN
			mov yPos,eax
		;	invoke SetWindowPos,hWnd,0,xPos,yPos,PictureW,PictureH,SWP_SHOWWINDOW
		
			;//colors for DNA Strand
			invoke CreateFontIndirect,addr AboutFont
			mov hFont2, eax
			mov lb1.lbStyle, BS_SOLID
			mov lb1.lbColor, 0000DF6Ah ; Red
			mov lb1.lbHatch, NULL

			invoke CreateBrushIndirect, addr lb1
			mov hColDot1, eax
			mov lb1.lbStyle, BS_SOLID
			mov lb1.lbColor, 0000DF6Ah ; Yellow
			mov lb1.lbHatch, NULL

			invoke CreateBrushIndirect, addr lb1
			mov hColDot2, eax

			invoke SetTimer, hWnd, 1, 10, NULL
			invoke SetTimer, hWnd, 2, 15, NULL

			invoke GetDC, hWnd
			mov hdc, eax

			mov esi, PictureW
			mov edi, PictureH

			invoke CreateCompatibleDC, hdc
			mov hmainDC, eax
			invoke CreateCompatibleBitmap, hdc, esi, edi
			mov hmainbmp, eax
			invoke SelectObject, hmainDC, eax
			invoke ReleaseDC, hWnd, hdc

			mov	MADE, FALSE
			mov	Ang, 0



		.elseif uMsg == WM_CTLCOLORDLG
			mov eax, hBgColor
			ret

		.elseif uMsg == WM_CTLCOLORSTATIC
			invoke SelectObject, wParam, hTitleFont
			invoke SetTextColor, wParam, CR_INTEXT_SCHEME
			invoke SetBkMode, wParam, TRANSPARENT
			invoke SetBkColor, wParam, CR_BG_SCHEME
			mov eax, hBgColor


		.elseif uMsg == WM_CTLCOLORDLG
			mov eax, hBgColor
			ret
		.elseif uMsg == WM_LBUTTONDOWN
			invoke SendMessage, hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0
		.elseif uMsg == WM_RBUTTONUP
			invoke SendMessage, hWnd, WM_CLOSE, 0, 0

		 .elseif uMsg == WM_TIMER
			.if	wParam == 1
				invoke RedrawWindow, hWnd, addr MyRect, 0, RDW_INVALIDATE
			.endif
			.if	wParam == 2
				.if x == 98 || x2 == 82 || x2 == 0FFFFFFAEh ;|| x2 == 0FFFFFF16h
					.if haltsec < 0
						mov tHalt, TRUE
						inc	haltsec
					.else
						mov haltsec, 0
						mov tHalt, FALSE
						dec x
					.endif
				.else
					.if	x == 0FFFFF686h
						mov	x, 20
					.endif
					dec	x
				.endif
			.endif


		.elseif uMsg == WM_PAINT
			invoke BeginPaint, hWnd, addr ps
			mov hdc, eax
			invoke FillRect, hmainDC, addr MyRect, hBgColor
			invoke Sleep, 20
			;Rotation;
			add	Ang, 5
			mov	i, 0
			
		@@:	
			mov	eax, i
			imul	eax, 8 	;Deg offset
			mov	ebx, Ang
			add	ebx, eax
			mov	Angle, ebx
			mov	ebx, 13	;distance from top
			mov	eax, i
			imul	eax, 10	;distance apart
			add	ebx, eax
			mov	CntY, ebx
			
			call Orbit
			invoke SelectObject, hmainDC, hColDot1			
			mov	eax, PntX1
			add	eax, 6
			mov	ebx, PntY1
			add	ebx, 6
			Invoke Ellipse, hmainDC, PntX1, PntY1, eax, ebx
			invoke SelectObject, hmainDC, hColDot2
			mov	eax, PntX2
			add	eax, 6
			mov	ebx, PntY2
			add	ebx, 6
			Invoke Ellipse, hmainDC, PntX2, PntY2, eax, ebx

			;---------------------------------
			; Draw linesbetween the circles
			;---------------------------------
			;mov	eax, i
			;imul eax, 12
			;mov	edx, 255
			;sub	edx, eax
			;shl eax, 16
			;mov	al, dl
			; RGB edx, 0, eax
			mov lb.lbStyle, BS_SOLID
			mov lb.lbColor,00009747h ;00A2A2A2h
			mov lb.lbHatch, 0
			invoke ExtCreatePen, PS_SOLID or PS_GEOMETRIC or PS_ENDCAP_ROUND or PS_JOIN_ROUND, 1, addr lb, 0, 0
			mov hPen, eax 
		 
			invoke SelectObject, hmainDC, eax
			mov	eax, PntY1
			add	eax, 2	;fix up ellipse size 
			invoke MoveToEx, hmainDC, PntX1, eax, 0
			mov	edx, PntY2
			add	edx, 2	;fix up ellipse size 
			invoke LineTo, hmainDC, PntX2, edx
			invoke DeleteObject, hPen
			inc i
			cmp i, 18	;number of strands
			jne	@b

			mov txtRct.left, 33
			mov	txtRct.right, PictureW+60
			mov	txtRct.bottom, PictureH
			invoke SelectObject, hmainDC, hFont2
			invoke SetBkMode, hmainDC, TRANSPARENT
			invoke SetTextColor, hmainDC, White

			mov	eax, x
			add	eax, 210
			mov	x2, eax
			mov	txtRct.top, eax
			invoke	DrawText, hmainDC, addr sAboutText, sLogoSize, addr txtRct, DT_CENTER
			invoke BitBlt, hdc, 0, 0, PictureW, PictureH, hmainDC, 0, 0, SRCCOPY
			;Add the text out :)
			invoke EndPaint, hWnd, addr ps


		.elseif uMsg == WM_CLOSE
			invoke KillTimer, hWnd, 1
		 	invoke KillTimer, hWnd, 2
		 	invoke KillTimer, hWnd, 3
		 	invoke DeleteObject, hColDot1
		 	invoke DeleteObject, hColDot2
		 	invoke DeleteDC, hmainDC
		 	invoke DeleteObject, hmainbmp
			invoke DeleteObject, hFont2
			invoke EndDialog, hWnd, 0
			invoke ShowWindow,xWnd,SW_SHOW
		.endif

		xor eax, eax
		ret
AboutProc endp
