//%attributes = {}
If (False:C215)
	//Project Method Name:      WIn_SetFormSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2010 17:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>INT_al_FormHeight;0)
	//ARRAY LONGINT(<>INT_al_FormWidth;0)
	//ARRAY TEXT(<>INT_at_FormNames;0)
	C_BOOLEAN:C305(<>INT_FormSIzesInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WIN_MINLEFT; <>WIN_MINTOP; $_l_BottomOLD; $_l_DockLB; $_l_DockLL; $_l_DockLR; $_l_DockPosition; $_l_FormDefaultHeight; $_l_FormDefaultWidth; $_l_FormRow)
	C_LONGINT:C283($_l_FullHeight; $_l_LeftOLD; $_l_RecordsinSelection; $_l_RightOLD; $_l_ScreenNumber; $_l_Shift; $_l_TableNumber; $_l_TopOLD; $_l_Windowbottom; $_l_WindowHeight; $_l_Windowleft)
	C_LONGINT:C283($_l_Windowright; $_l_WindowTop; $_l_WindowWidth; $1; PRC_l_WindowTop; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP; WIN_CURRENTMENU)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WIn_SetFormSize")
//this method is called before the form is displayed and set the form size based o
//on form objects, it should not be called from the form method to resize the wind
//window-it works in harmony with WS_AutoscreenSize but uses the form propertied t
$_l_ScreenNumber:=Menu bar screen:C441
SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
$_l_WindowHeight:=$_l_Windowbottom-$_l_WindowTop
$_l_WindowWidth:=$_l_Windowright-$_l_Windowleft
If ($_l_ScreenNumber>0)
	$_l_DockPosition:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
Else 
	$_l_DockLB:=0
	$_l_DockLR:=0
	$_l_DockLL:=0
End if 
//$_l_DockLR:=INT_GetDock ("R")
//$_l_DockLL:=INT_GetDock ("L")
$_l_LeftOLD:=SIZ_l_OLDLEFT
$_l_TopOLD:=SIZ_l_OLDTOP
$_l_RightOLD:=SIZ_l_OLDRIGHT
$_l_BottomOLD:=SIZ_l_OLDBOTTOM

$_l_TableNumber:=Table:C252($2)
If (Count parameters:C259>=3)
	If (Is table number valid:C999($_l_TableNumber))
		
		If (Db_Testing)
			SHOW PROCESS:C325(Current process:C322)
			Gen_Alert("Table: "+Table name:C256($2)+" Form Name: "+$3)
		End if 
		
		Case of 
			: ($1=1) & ($3#"")  //output form
				FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
				//$_l_FormDefaultWidth:=$_l_FormDefaultWidth+21
				GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
				$_l_RecordsinSelection:=Records in selection:C76($2->)
				If ($_l_RecordsinSelection<($_l_Windowleft+10))
					$_l_RecordsinSelection:=10
				End if 
				
				$_l_FullHeight:=13*$_l_RecordsinSelection  //12MM PER RECORD
				$_l_FullHeight:=$_l_FullHeight+250  //FOR HEADER AND FOOTER
				If ($_l_FullHeight<350)
					$_l_FullHeight:=350
				End if 
				If (SIZ_l_OLDLEFT<(<>WIN_MINLEFT+$_l_DockLL))  // (SIZ_l_OLDRIGHT>Screen width)
					//it wont fit
					$_l_Shift:=(<>WIN_MINLEFT+$_l_DockLL)-SIZ_l_OLDLEFT
					//   so move it
					//HIDE PROCESS(Current process)
					SET WINDOW RECT:C444(<>WIN_MINLEFT+$_l_DockLL+2; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT+$_l_Shift; SIZ_l_OLDBOTTOM)
					GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
				End if 
				
				If ((SIZ_l_OLDRIGHT)>(SIZ_l_OLDLEFT+$_l_FormDefaultWidth))
					//HIDE PROCESS(Current process)
					SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDLEFT+($_l_FormDefaultWidth); SIZ_l_OLDBOTTOM)
					GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
				End if 
				
				If ((SIZ_l_OLDLEFT+($_l_FormDefaultWidth))>($_l_WindowWidth-$_l_DockLR))
					$_l_FormDefaultWidth:=(($_l_WindowWidth-$_l_DockLR)-SIZ_l_OLDLEFT)-20
				End if 
				
				If ($_l_FullHeight>=((($_l_WindowHeight-$_l_DockLB)-10)-SIZ_l_OLDTOP))
					If (SIZ_l_OLDBOTTOM#(($_l_WindowHeight-$_l_DockLB)-40))
						//`HIDE PROCESS(Current process)
						SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDLEFT+($_l_FormDefaultWidth); ($_l_WindowHeight-$_l_DockLB)-40)
						GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
					End if 
				Else 
					If ($_l_FormDefaultWidth#0)
						If (SIZ_l_OLDRIGHT#(SIZ_l_OLDLEFT+($_l_FormDefaultWidth-20)))
							//`HIDE PROCESS(Current process)
							SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDLEFT+($_l_FormDefaultWidth-20); $_l_FullHeight)
							GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
						End if 
						
					End if 
				End if 
				
				If (SIZ_l_OLDLEFT<(<>WIN_MINLEFT+$_l_DockLL)) | (SIZ_l_OLDRIGHT>($_l_WindowWidth-$_l_DockLR))
					//it wont fit
					//   so move it
					//HIDE PROCESS(Current process)
					SET WINDOW RECT:C444((<>WIN_MINLEFT+$_l_DockLL)+2; SIZ_l_OLDTOP; ($_l_WindowWidth-$_l_DockLR)-(10+<>WIN_MINLEFT); SIZ_l_OLDBOTTOM)
					GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
				End if 
				
				If (SIZ_l_OLDTOP<<>WIN_MINTOP) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>($_l_WindowHeight-$_l_DockLB))
					//HIDE PROCESS(Current process)
					SET WINDOW RECT:C444(SIZ_l_OLDLEFT; <>WIN_MINTOP+2; SIZ_l_OLDRIGHT; (($_l_WindowHeight-$_l_DockLB)-<>WIN_MINTOP+2))
					GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
				End if 
				
				If (SIZ_l_OLDTOP<PRC_l_WindowTop) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>($_l_WindowHeight-$_l_DockLB))
					//HIDE PROCESS(Current process)
					SET WINDOW RECT:C444(SIZ_l_OLDLEFT; PRC_l_WindowTop; SIZ_l_OLDRIGHT; (($_l_WindowHeight-$_l_DockLB)-PRC_l_WindowTop))
				End if 
			: ($1=2)  //input form
				If ($3#"")
					If (Not:C34(<>INT_FormSIzesInited))
						INT_LoadFormSizes(<>PER_l_CurrentUserID)
					End if 
					FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
					$_l_FormRow:=Find in array:C230(<>INT_at_FormNames; Table name:C256($2)+"_"+$3)
					If ($_l_FormRow>0)
						
						WS_AutoscreenSize(1; <>INT_al_FormHeight{$_l_FormRow}; <>INT_al_FormWidth{$_l_FormRow})
					Else 
						WS_AutoscreenSize(1; $_l_FormDefaultHeight; $_l_FormDefaultWidth)
						
					End if 
				End if 
			: ($1=3)  // standard form size(dialog)
				FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
				If ($_l_FormDefaultHeight>0) & ($_l_FormDefaultWidth>0)
					WS_AutoscreenSize(2; $_l_FormDefaultHeight; $_l_FormDefaultWidth)
					
				End if 
				
				
		End case 
		
	End if 
	
End if 
SIZ_l_OLDLEFT:=$_l_LeftOLD
SIZ_l_OLDTOP:=$_l_TopOLD
SIZ_l_OLDRIGHT:=$_l_RightOLD
SIZ_l_OLDBOTTOM:=$_l_BottomOLD

SHOW PROCESS:C325(Current process:C322)
BRING TO FRONT:C326(Current process:C322)
ERR_MethodTrackerReturn("WIn_SetFormSize"; $_t_oldMethodName)
