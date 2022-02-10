.686
.model	flat, stdcall
option	casemap :none

include	resID.inc
include staticline.asm
include algo.asm
include textscr_mod.asm
include aboutbox.asm

AllowSingleInstance MACRO lpTitle
        invoke FindWindow,NULL,lpTitle
        cmp eax, 0
        je @F
          push eax
          invoke ShowWindow,eax,SW_RESTORE
          pop eax
          invoke SetForegroundWindow,eax
          mov eax, 0
          ret
        @@:
ENDM

.code
start:
	invoke	GetModuleHandle, NULL
	mov	hInstance, eax
	invoke	InitCommonControls
	invoke LoadBitmap,hInstance,400
	mov hIMG,eax
	invoke CreatePatternBrush,eax
	mov hBrush,eax
	AllowSingleInstance addr WindowTitle
	invoke	DialogBoxParam, hInstance, IDD_MAIN, 0, offset DlgProc, 0
	invoke	ExitProcess, eax

DlgProc proc hDlg:HWND,uMessg:UINT,wParams:WPARAM,lParam:LPARAM
LOCAL X:DWORD
LOCAL Y:DWORD
LOCAL BmpBackground:PAINTSTRUCT

	.if [uMessg] == WM_INITDIALOG
 
 		push hDlg
 		pop xWnd
		mov eax, 400
		mov nHeight, eax
		mov eax, 300
		mov nWidth, eax                
		invoke GetSystemMetrics,0                
		sub eax, nHeight
		shr eax, 1
		mov [X], eax
		invoke GetSystemMetrics,1               
		sub eax, nWidth
		shr eax, 1
		mov [Y], eax
		invoke SetWindowPos,xWnd,0,X,Y,nHeight,nWidth,40h
            	
		invoke	LoadIcon,hInstance,200
		invoke	SendMessage, xWnd, WM_SETICON, 1, eax
		invoke  SetWindowText,xWnd,addr WindowTitle
		invoke 	SendDlgItemMessage, xWnd, IDC_CODE, EM_SETLIMITTEXT, 55, 0
		invoke  StaticLineInit,xWnd
		invoke  ScrollerInit,xWnd
		invoke CreateFontIndirect,addr TxtFont
		mov hFont,eax
		invoke GetDlgItem,xWnd,IDC_CODE
		mov hCode,eax
		invoke SendMessage,eax,WM_SETFONT,hFont,1
		invoke GetDlgItem,xWnd,IDC_SERIAL
		mov hSerial,eax
		invoke SendMessage,eax,WM_SETFONT,hFont,1
		
		invoke ImageButton,xWnd,24,236,500,502,501,IDB_COPY
		mov hCopy,eax
		invoke ImageButton,xWnd,154,236,600,602,601,IDB_ABOUT
		mov hAbout,eax
		invoke ImageButton,xWnd,281,236,700,702,701,IDB_EXIT
		mov hExit,eax
		
		invoke  MAGICV2MENGINE_DllMain,hInstance,DLL_PROCESS_ATTACH,0
		invoke 	V2mPlayStream, addr v2m_Data,TRUE
		invoke  V2mSetAutoRepeat,1
		
		invoke GenKey,xWnd
	.elseif [uMessg] == WM_LBUTTONDOWN

		invoke SendMessage, xWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0

	.elseif [uMessg] == WM_CTLCOLORDLG

		return hBrush

	.elseif [uMessg] == WM_PAINT
                
		invoke BeginPaint,xWnd,addr BmpBackground
		mov edi,eax
		lea ebx,r3kt
		assume ebx:ptr RECT
                
		invoke GetClientRect,xWnd,ebx
		invoke CreateSolidBrush,0
		invoke FrameRect,edi,ebx,eax
		invoke EndPaint,xWnd,addr BmpBackground                   
     
    .elseif [uMessg] == WM_CTLCOLOREDIT
    
		invoke SetBkMode,wParams,TRANSPARENT
		invoke SetTextColor,wParams,White
		invoke GetWindowRect,xWnd,addr WndRect
		invoke GetDlgItem,xWnd,IDC_CODE
		invoke GetWindowRect,eax,addr CodeRect
		mov edi,WndRect.left
		mov esi,CodeRect.left
		sub edi,esi
		mov ebx,WndRect.top
		mov edx,CodeRect.top
		sub ebx,edx
		invoke SetBrushOrgEx,wParams,edi,ebx,0
		mov eax,hBrush
		ret        
	
	.elseif [uMessg] == WM_CTLCOLORSTATIC
	
		invoke SetBkMode,wParams,TRANSPARENT
		invoke SetTextColor,wParams,White
		invoke GetWindowRect,xWnd,addr XndRect
		invoke GetDlgItem,xWnd,IDC_SERIAL
		invoke GetWindowRect,eax,addr SerialRect
		mov edi,XndRect.left
		mov esi,SerialRect.left
		sub edi,esi
		mov ebx,XndRect.top
		mov edx,SerialRect.top
		sub ebx,edx
		invoke SetBrushOrgEx,wParams,edi,ebx,0
		mov eax,hBrush
		ret

	.elseif [uMessg] == WM_COMMAND
        
		mov eax,wParams
		mov edx,eax
		shr edx,16
		and eax,0ffffh      
		.if edx == EN_CHANGE
			.if eax == IDC_CODE
				invoke GenKey,xWnd
			.endif
		.endif  
		.if	eax==IDB_COPY
			invoke SendDlgItemMessage,xWnd,IDC_SERIAL,EM_SETSEL,0,-1
			invoke SendDlgItemMessage,xWnd,IDC_SERIAL,WM_COPY,0,0
			invoke MessageBox,xWnd,addr Msg1,addr Cpt1,MB_OK
		.elseif eax == IDB_ABOUT
			invoke ShowWindow,xWnd,0
			invoke DialogBoxParam,0,IDD_ABOUT,xWnd,offset AboutProc,0
		.elseif eax == IDB_EXIT
			invoke SendMessage,xWnd,WM_CLOSE,0,0
		.endif 
             
	.elseif [uMessg] == WM_CLOSE    
		invoke V2mStop
  		invoke MAGICV2MENGINE_DllMain,hInstance,DLL_PROCESS_DETACH,0
		invoke FreeStatic,xWnd
		invoke EndDialog,xWnd,0     
	.endif
         xor eax,eax
         ret
DlgProc endp

end start