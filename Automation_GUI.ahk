#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetKeyDelay, 50
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
GUI, Add, Button, w120 xs+10 ys+20 section gJoinFlanetCreator, Join(Creator)
GUI, Add, Button, w120 xs ys+25, NewBtn2
GUI, Add, Button, w120 xs ys+50, NewBtn3
GUI, Add, Button, w120 xs ys+75, NewBtn4
GUI, Add, Button, w120 xs ys+100, NewBtn5

GUI, Add, Button, w120 xs+130 ys section gOldWrite, Write/Edit Post
GUI, Add, Button, w120 xs ys+25 gUploadImgNLink, Upload IMG/Link
GUI, Add, Button, w120 xs ys+50 gOldLikeBookmarkReply, Like/Bookmark/Reply
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
MouseMove, resultX+80, resultY+135
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
UploadImgNLink:
;;이미지, 링크 업로드
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_writepost.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writepost.bmp
MouseMove, resultX+20, resultY+20
Click, Left
sleep, 3000
;;이미지업로드
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_post_img_link_schedule_vote.bmp
;;tolerance가 120이면 본문 placeholder와 혼동하는 경우가 생기므로 tolerance는 100으로
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *100 old_post_img_link_schedule_vote.bmp
if (ErrorLevel = 2)
	MsgBox Image crashed
else if (ErrorLevel = 1)
	ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_post_img_link_schedule_vote2.bmp
	if (ErrorLevel = 1)
		MsgBox Can't Find Image
MouseMove, resultX+28, resultY+38
Click, Left
Sleep, 1000
MouseMove, searchSX+360, searchSY+250
Click, Left
Sleep, 500
Click, Left
Sleep, 500
MouseMove, searchSX+673, searchSY+105
Click, Left
Sleep, 3000
Send Example IMG for Testing.`n
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
Sleep, 1000

;;링크업로드
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_writepost.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writepost.bmp
MouseMove, resultX+20, resultY+20
Click, Left
sleep, 1000
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_post_img_link_schedule_vote.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *100 old_post_img_link_schedule_vote.bmp
MouseMove, resultX+81, resultY+35
Click, Left
Sleep, 1000
Send https://
Send twitch.
Send tv/

Sleep, 1000
Send `n`n

Sleep, 1000
Send Link Upload Test
Sleep, 1000
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

return

;***********************************************************************
OldLikeBookmarkReply:
;;좋아요, 보관, 댓글쓰기
;;좋아요 누르기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_like.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_like.bmp
if (ErrorLevel = 1)
	ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 old_like2.bmp
	if (ErrorLevel = 1)
		MsgBox Can't Find Image
MouseMove, resultX+18, resultY+16
Click, Left
Sleep, 1500
;;보관 누르기
GuiControl,, TargetImg, *w0 *h-1 old_bookmark.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_bookmark.bmp
MouseMove, resultX+15, resultY+19
Click, Left
Sleep, 1500
;;댓글 버튼 누르기
GuiControl, Show, TargetImg
GuiControl,, TargetImg, *w0 *h-1 old_reply.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_reply.bmp
if (ErrorLevel = 1)
	ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *150 old_reply2.bmp
	if (ErrorLevel = 1)
		MsgBox Can't Find Image
MouseMove, resultX+90, resultY+12
Click, Left
Sleep, 500
;;댓글 작성 영역이 화면 안에 반드시 표시되도록, 끝까지 스크롤다운
Click, WheelDown 10
Sleep, 1500
;;댓글 작성 영역 누르기
GuiControl,, TargetImg, *w0 *h-1 old_writereply.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writereply.bmp
MouseMove, resultX+40, resultY+90
Click, Left
Sleep, 1500
;;댓글 입력
Send Test Reply Generated %A_YYYY%-%A_MM%-%A_DD% %A_DDD% %A_Hour%:%A_Min%:%A_Sec%
;Sleep, 500
;;게시 누르기
GuiControl,, TargetImg, *w0 *h-1 old_writereplyconfirm.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_writereplyconfirm.bmp
MouseMove, resultX+22, resultY+33
Click, Left
Sleep, 500
Click, WheelDown 6
Sleep, 1500
;;대댓글 달기


;;;;;;;;구버전
;GuiControl,, TargetImg, *w0 *h-1 old_reply.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 old_reply.bmp
;MouseMove, resultX+92, resultY+17
;Click, Left
;Sleep, 3000
;GuiControl,, TargetImg, *w0 *h-1 old_reply2.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_reply2.bmp
;if (ErrorLevel = 1)
;	MsgBox Can't Find Image
;MouseMove, resultX, resultY
;Click, Left
;Sleep, 500
;Send Test Reply Generated %A_YYYY%-%A_MM%-%A_DD% %A_DDD% %A_Hour%:%A_Min%:%A_Sec%
;Sleep, 500
;GuiControl,, TargetImg, *w0 *h-1 old_reply3.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_reply3.bmp
;MouseMove, resultX, resultY
;Click, Left
;Sleep, 1500
;GuiControl,, TargetImg, *w0 *h-1 rereply.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 rereply.bmp
;MouseMove, resultX+115, resultY+15
;Click, Left
;Sleep, 3000
;GuiControl,, TargetImg, *w0 *h-1 rereply_write.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *160 rereply_write.bmp
;MouseMove, resultX+60, resultY+80
;Click, Left
;Sleep, 500
;Send Test ReReply Generated %A_YYYY%-%A_MM%-%A_DD% %A_DDD% %A_Hour%:%A_Min%:%A_Sec%
;Sleep, 500
;GuiControl,, TargetImg, *w0 *h-1 old_reply3.bmp
;ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 old_reply3.bmp
;MouseMove, resultX, resultY
;Click, Left
;Sleep, 1000
;Click, Right
;Sleep, 1000
;Click, Right
;Sleep, 1000
;;;;;;;;구버전


;;타임라인 리프레시
DragX := searchSX+(searchW/2)
DragY1 := searchSY+(searchH/3)
DragY2 := searchSY+(searchH/3*2)
SendEvent {Click %DragX% %DragY1% Down}{Click %DragX% %DragY2% Up}

return
;***********************************************************************
;기존회원 기능들 들어갈 곳


;***********************************************************************
;신규회원 기능
;***********************************************************************
JoinFlanetCreator:
;;이용 약관 동의하기 부분
GuiControl,, TargetImg, *w0 *h-1 new_user_agreement.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 new_user_agreement.bmp
;;;;첫번째 약관
MouseMove, resultX+15, resultY+13
Click, Left
Sleep, 500
;;;;두번째 약관
MouseMove, resultX+15, resultY+91
Click, Left
Sleep, 500
;;;;세번째 약관
MouseMove, resultX+15, resultY+171
Click, Left
Sleep, 500
;;;;다음 버튼 활성화됐는지 찾고 클릭
GuiControl,, TargetImg, *w0 *h-1 new_user_agreement_next.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 new_user_agreement_next.bmp
MouseMove, resultX+22, resultY+11
Click, Left
Sleep, 1500
;;;다음 화면
;;;;프로필 사진
GuiControl,, TargetImg, *w0 *h-1 new_user_profile_pic.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 new_user_profile_pic.bmp
MouseMove, resultX+13, resultY+26
Click, Left
Sleep, 500
GuiControl,, TargetImg, *w0 *h-1 new_user_profile_selectpic.bmp
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 new_user_profile_selectpic.bmp
MouseMove, resultX+59, resultY+12
Click, Left
Sleep, 1000
;;;카메라 권한 받는 팝업 뜰 경우
ImageSearch, resultX, resultY, searchSX, searchSY, searchFX, searchFY, *120 new_user_picture_auth.bmp
if (ErrorLevel = 0)
	MouseMove, resultX+22, resultY+13
	Click, Left
Sleep, 1000
MouseMove, searchSX+360, searchSY+250
Click, Left
Sleep, 500
Click, Left
Sleep, 500
MouseMove, searchSX+673, searchSY+105
Click, Left
Sleep, 500
Click, Left
;;프로필 사진 올라가서 갱신되는 데까지 시간이 많이 걸림
Sleep, 5000
;;;;프로필 사진 설정 끝



return
;***********************************************************************




;***********************************************************************
GuiClose:
ExitApp