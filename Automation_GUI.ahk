#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;현재 미러링 창 좌표 잡기
CoordMode, Mouse, Screen
WinGetPos, searchSX, searchSY, searchW, searchH, SM-G991N
searchFX := searchSX+searchW
searchFY := searchSY+searchH
;Msgbox, %searchSX%, %searchSY%, %searchW%, %searchH%
CoordMode, Pixel, Screen

;창 생성
GUI, AutoSanity:NEW, -MaximizeBox -AlwaysOnTop, Flanet-AutoSanity
;창 구성 요소 추가
GUI, Add, GroupBox, X10 Y8 W100 H160 section, Target Image
GUI, Add, Pic, x20 y25 vTargetImg, target.bmp
GuiControl, Hide, TargetImg
GUI, Add, Button, w150 x128 ys section gBtnTestAll, Test All
GUI, Add, GroupBox, x120 ys+30 w165 h130, Login Test
GUI, Add, Button, w150 xs ys+50 section gBtnTwitch, Twitch Login
GUI, Add, Button, w150 xs ys+25 section gBtnKakao, Kakao Login
GUI, Add, Button, w150 xs ys+25 section gBtnNaver, Naver Login
GUI, Add, Button, w150 xs ys+25 section gBtnGoogle, Google Login
GUI, Add, GroupBox, w275 h60 x10 ys+40 section, Login Key(Twitch)
GUI, Add, Edit, r1 w150 xs+10 ys+25 vLoginKey,
GUI, Add, Button, w95 xs+170 ys+25 gSendLoginKey, Send
GUI, Add, GroupBox, w275 h200 x10 ys+65 section, After Login
GUI, Add, Button, w120 xs+10 ys+20 section, NewBtn1
GUI, Add, Button, w120 xs ys+25, NewBtn2
GUI, Add, Button, w120 xs ys+50, NewBtn3
GUI, Add, Button, w120 xs ys+75, NewBtn4
GUI, Add, Button, w120 xs ys+100, NewBtn5

GUI, Add, Button, w120 xs+130 ys section gOldWrite, Write/Edit Post
GUI, Add, Button, w120 xs ys+25 gOldLikeBookmarkReply, Like/Bookmark/Reply
GUI, Add, Button, w120 xs ys+50, OldBtn3
GUI, Add, Button, w120 xs ys+75, OldBtn4
GUI, Add, Button, w120 xs ys+100, OldBtn5

;창 표시 및 크기 설정
GUI, Show, W300 H500

return

BtnTestAll:
Msgbox, 미구현입니다.
return

;****************************************************************************
BtnTwitch:
Msgbox, 트위치 로그인
Msgbox, start
TrayTip, FlanetAuto-Twitchlogin, 테스트 시작, 15
;WinWait, ahk_exe scrcpy.exe, SM-G991N, 1500
;Msgbox, 1

;;트위치로 로그인 버튼 찾기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 twitchlogin.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 twitchlogin.bmp
MouseMove, resultX, resultY
Click, Left
;Msgbox, %searchSX%, %searchSY%, %searchW%, %searchH%, %searchFX%, %searchFY%, %resultX%, %resultY%

;;아이디 창 찾기 및 tinatu00 입력
GuiControl,, TargetImg, *w0 *h-1 twitchlogin_id.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 twitchlogin_id.bmp
MouseMove, resultX+30, resultY+50
Click, Left
Sleep, 3000
SendRaw tinatu00
;;비밀번호 창 찾기 및 비밀번호 입력
GuiControl,, TargetImg, *w0 *h-1 twitchlogin_pw.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 twitchlogin_pw.bmp
MouseMove, resultX+30, resultY+50
Click, Left
Sleep, 1500
SendRaw twip12!@twip12!@
;;아이디 창 찾기 및 비밀번호 입력
Sleep, 1500
GuiControl,, TargetImg, *w0 *h-1 twitchlogin_loginbtn.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 twitchlogin_loginbtn.bmp
MouseMove, resultX+30, resultY+15
Click, Left
GuiControl, Hide, TargetImg
Msgbox, Enter the Login Key
return

;************************************************************************
BtnKakao:
Msgbox, 카카오 로그인
TrayTip, FlanetAuto-Twitchlogin, 테스트 시작, 15
;;카카오로 로그인 버튼 찾기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 kakaologin.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 kakaologin.bmp
if (ErrorLevel = 2)
	MsgBox Image crashed
else if (ErrorLevel = 1)
	ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 kakaologin-2.bmp
	if (ErrorLevel = 1)
		MsgBox Can't Find Image
MouseMove, resultX, resultY
Click, Left
return

;***********************************************************************
BtnNaver:
Msgbox, 네이버 로그인
TrayTip, FlanetAuto-Twitchlogin, 테스트 시작, 15
;;네이버로 로그인 버튼 찾기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 naverlogin.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 naverlogin.bmp
MouseMove, resultX, resultY
Click, Left
return

;************************************************************************
BtnGoogle:
Msgbox, 구글 로그인
TrayTip, FlanetAuto-Twitchlogin, 테스트 시작, 15
;;구글로 로그인 버튼 찾기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 googlelogin.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 googlelogin.bmp
MouseMove, resultX, resultY
Click, Left
return

;***********************************************************************
SendLoginKey:
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 twitchlogin_6number.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 twitchlogin_6number.bmp
MouseMove, resultX+29, resultY+29
Click, Left

GUI, Submit, NoHide
Send, %LoginKey%
;MsgBox, %LoginKey%
GuiControl, , LoginKey, 
return

;***********************************************************************
OldWrite:
;;아티클 쓰기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_writepost.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writepost.bmp
MouseMove, resultX+20, resultY+20
Click, Left
sleep, 1000
Send Example text for Testing.`n1234567890`n`n
Send Generated By FAutoSanity.`n
Send %A_YYYY%-%A_MM%-%A_DD% %A_DDD% %A_Hour%:%A_Min%:%A_Sec%
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_writepost-post.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writepost-post.bmp
if (ErrorLevel = 2)
	MsgBox Image crashed
else if (ErrorLevel = 1)
	ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 old_writepost-post2.bmp
	if (ErrorLevel = 1)
		MsgBox Can't Find Image
MouseMove, resultX+17, resultY+11
Click, Left
;;아티클 수정

Sleep, 2000
;MsgBox, Step1
;GuiControl,, TargetImg, *w0 *h-1 old_editpost.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 old_editpost.bmp
;MouseMove, resultX+5, resultY
;아티클 자세히보기 이미지검색이 제대로 안되어 강제로 첫글위치 클릭
MouseMove, searchSX+(searchW/2), searchSY+(searchH/3)
Click, Left
Sleep, 2000
;MsgBox, Step2
GuiControl,, TargetImg, *w0 *h-1 old_editpost2.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_editpost2.bmp
MouseMove, resultX+388, resultY+5
Click, Left
Sleep, 2000
;MsgBox, Step3
GuiControl,, TargetImg, *w0 *h-1 old_editpost3.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_editpost3.bmp
MouseMove, resultX+64, resultY+137
Click, Left
sleep, 2000
;MsgBox, Step4
Send Edited at %A_Hour%:%A_Min%:%A_Sec%`n`n
sleep, 2000
GuiControl,, TargetImg, *w0 *h-1 old_editpost4.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_editpost4.bmp
MouseMove, resultX+15, resultY+10
Click, Left
Sleep, 2000
;MsgBox, Step5
GuiControl,, TargetImg, *w0 *h-1 old_editpost2.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_editpost2.bmp
MouseMove, resultX+10, resultY+10
Click, Left
Sleep, 2000
;MsgBox, Refresh
;MouseClickDrag, Left, searchSX+(searchW/2), searchSY+(searchH/3), searchSX+(searchW/2), searchSY+(searchH/3*2), 100
DragX := searchSX+(searchW/2)
DragY1 := searchSY+(searchH/3)
DragY2 := searchSY+(searchH/3*2)
SendEvent {Click %DragX% %DragY1% Down}{Click %DragX% %DragY2% Up}


return

;***********************************************************************
OldLikeBookmarkReply:
;;좋아요, 보관, 댓글쓰기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_like.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_like.bmp
MouseMove, resultX+18, resultY+16
Click, Left
Sleep, 1500
GuiControl,, TargetImg, *w0 *h-1 old_bookmark.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_bookmark.bmp
MouseMove, resultX+15, resultY+19
Click, Left
Sleep, 1500
GuiControl,, TargetImg, *w0 *h-1 old_reply.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 old_reply.bmp
MouseMove, resultX+92, resultY+17
Click, Left
Sleep, 3000
GuiControl,, TargetImg, *w0 *h-1 old_reply2.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *50 old_reply2.bmp
if (ErrorLevel = 1)
	MsgBox Can't Find Image
MouseMove, resultX, resultY
Click, Left
Sleep, 500
Send Test Reply Generated %A_YYYY%-%A_MM%-%A_DD% %A_DDD% %A_Hour%:%A_Min%:%A_Sec%
Sleep, 500
GuiControl,, TargetImg, *w0 *h-1 old_reply3.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_reply3.bmp
MouseMove, resultX, resultY
Click, Left
Sleep, 1500
GuiControl,, TargetImg, *w0 *h-1 rereply.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 rereply.bmp
MouseMove, resultX+115, resultY+15
Click, Left
Sleep, 3000
GuiControl,, TargetImg, *w0 *h-1 rereply_write.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 rereply_write.bmp
MouseMove, resultX+30, resultY+47
Click, Left



return

;***********************************************************************
GuiClose:
ExitApp