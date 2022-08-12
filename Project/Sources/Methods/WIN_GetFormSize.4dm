//%attributes = {}
If (False:C215)
	//Project Method Name:      WIN_GetFormSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: WIN_GetFormSize
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
	C_BOOLEAN:C305(<>DB_bo_NewSearchActive; <>INT_FormSIzesInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WIN_MINLEFT; <>WIN_MINTOP; $_l_BottomOLD; $_l_CountRecords; $_l_DockLB; $_l_DockLL; $_l_DockLR; $_l_DockPosition; $_l_FormDefaultHeight; $_l_FormDefaultWidth)
	C_LONGINT:C283($_l_FormRow; $_l_FullHeight; $_l_LeftOLD; $_l_MinimumHeight; $_l_RightOLD; $_l_Shift; $_l_TableNumber; $_l_TopOLD; $_l_xHeight; $_l_xWidth; $1)
	C_LONGINT:C283($6; $7; $8; $9; PRC_l_WindowTop; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP; WIN_CURRENTMENU)
	C_POINTER:C301($2; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WIN_GetFormSize")
//this method is called before the form is displayed and set the form size based o
//on form objects, it should not be called from the form method to resize the wind
//window-it works in harmony with WS_AutoscreenSize but uses the form propertied t

If (Count parameters:C259>=5)
	$4->:=0  // HEIGHT
	$5->:=0  // WIDTH
End if 
//This method will GET rather than set the size-to try and avoid the screen size shifting-this is then called by Open_Pro_Window
$_l_LeftOLD:=SIZ_l_OLDLEFT
$_l_TopOLD:=SIZ_l_OLDTOP
$_l_RightOLD:=SIZ_l_OLDRIGHT
$_l_BottomOLD:=SIZ_l_OLDBOTTOM
$_l_DockPosition:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
//$_l_DockLR:=INT_GetDock ("R")
//$_l_DockLL:=INT_GetDock ("L")
If (Count parameters:C259>=3)
	If (Count parameters:C259>=9)
		SIZ_l_OLDLEFT:=$6
		SIZ_l_OLDTOP:=$7
		SIZ_l_OLDRIGHT:=$8
		SIZ_l_OLDBOTTOM:=$9
	Else 
		SIZ_l_OLDLEFT:=0
		SIZ_l_OLDTOP:=0
		SIZ_l_OLDRIGHT:=0
		SIZ_l_OLDBOTTOM:=0
	End if 
	Case of 
		: ($1=1) & ($3#"")  //output form
			FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
			//$_l_FormDefaultWidth:=$_l_FormDefaultWidth+21
			//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
			$_l_CountRecords:=Records in selection:C76($2->)
			If ($_l_CountRecords<10)
				$_l_CountRecords:=10
			End if 
			
			$_l_FullHeight:=13*$_l_CountRecords  //12MM PER RECORD
			
			If (<>DB_bo_NewSearchActive)
				$_l_FullHeight:=$_l_FullHeight+370  //FOR HEADER AND FOOTER
				$_l_MinimumHeight:=450
			Else 
				$_l_FullHeight:=$_l_FullHeight+250  //FOR HEADER AND FOOTER
				$_l_MinimumHeight:=350
			End if 
			If ($_l_FullHeight<$_l_MinimumHeight)
				$_l_FullHeight:=$_l_MinimumHeight
			End if 
			If (SIZ_l_OLDLEFT<(<>WIN_MINLEFT+$_l_DockLL))  // (SIZ_l_OLDRIGHT>Screen width)
				//it wont fit
				$_l_Shift:=(<>WIN_MINLEFT+$_l_DockLL)-SIZ_l_OLDLEFT
				//   so move it
				If (Count parameters:C259>=5)
					$5->:=(SIZ_l_OLDRIGHT+$_l_Shift)-(<>WIN_MINLEFT+$_l_DockLL+2)
					$4->:=SIZ_l_OLDBOTTOM-SIZ_l_OLDLEFT
				End if 
				SIZ_l_OLDRIGHT:=SIZ_l_OLDRIGHT+$_l_Shift
				SIZ_l_OLDLEFT:=<>WIN_MINLEFT+$_l_DockLL+2
				//SET WINDOW RECT(◊WIN_MINLEFT+$_l_DockLL+2;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT+$_l_Shift;SIZ_l_OLDBOTTOM)
				//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
			End if 
			
			If ((SIZ_l_OLDRIGHT)>(SIZ_l_OLDLEFT+$_l_FormDefaultWidth))
				If (Count parameters:C259>=5)
					$5->:=$_l_FormDefaultWidth
				End if 
				//$4->:=
				//SET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDLEFT+($_l_FormDefaultWidth);SIZ_l_OLDBOTTOM)
				//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
			End if 
			
			If ((SIZ_l_OLDLEFT+($_l_FormDefaultWidth))>(Screen width:C187-$_l_DockLR))
				$5->:=((Screen width:C187-$_l_DockLR)-SIZ_l_OLDLEFT)-20
				$_l_FormDefaultWidth:=$5->
			End if 
			
			If ($_l_FullHeight>=(((Screen height:C188-$_l_DockLB)-10)-SIZ_l_OLDTOP))
				If (SIZ_l_OLDBOTTOM#((Screen height:C188-$_l_DockLB)-40))
					If (Count parameters:C259>=5)
						$5->:=$_l_FormDefaultWidth
						$4->:=((Screen height:C188-$_l_DockLB)-40)-SIZ_l_OLDTOP
						
						SIZ_l_OLDRIGHT:=SIZ_l_OLDLEFT+($_l_FormDefaultWidth)
						SIZ_l_OLDBOTTOM:=SIZ_l_OLDTOP+$4->
					End if 
					//SET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDLEFT+($_l_FormDefaultWidth);(Screen height-$_l_DockLB)-40)
					//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
				End if 
			Else 
				If ($_l_FormDefaultWidth#0)
					If (SIZ_l_OLDRIGHT#(SIZ_l_OLDLEFT+($_l_FormDefaultWidth-20)))
						If (Count parameters:C259>=5)
							$5->:=$_l_FormDefaultWidth-20
							$4->:=$_l_FullHeight-SIZ_l_OLDLEFT
						End if 
						SIZ_l_OLDRIGHT:=SIZ_l_OLDLEFT+($_l_FormDefaultWidth-20)
						SIZ_l_OLDBOTTOM:=$_l_FullHeight
						//SET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDLEFT+($_l_FormDefaultWidth-20);$_l_FullHeight)
						//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
					End if 
					
				End if 
			End if 
			
			If (SIZ_l_OLDLEFT<(<>WIN_MINLEFT+$_l_DockLL)) | (SIZ_l_OLDRIGHT>(Screen width:C187-$_l_DockLR))
				//it wont fit
				//   so move it
				//HIDE PROCESS(Current process)
				If (Count parameters:C259>=5)
					$5->:=((Screen width:C187-$_l_DockLR)-(10+<>WIN_MINLEFT))-((<>WIN_MINLEFT+$_l_DockLL)+2)
				End if 
				SIZ_l_OLDRIGHT:=(Screen width:C187-$_l_DockLR)-(10+<>WIN_MINLEFT)
				//SET WINDOW RECT((◊WIN_MINLEFT+$_l_DockLL)+2;SIZ_l_OLDTOP;(Screen width-$_l_DockLR)-(10+◊WIN_MINLEFT);SIZ_l_OLDBOTTOM)
				//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
			End if 
			
			If (SIZ_l_OLDTOP<<>WIN_MINTOP) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>(Screen height:C188-$_l_DockLB))
				//HIDE PROCESS(Current process)
				If (Count parameters:C259>=5)
					$4->:=(((Screen height:C188-$_l_DockLB)-<>WIN_MINTOP+2))-(<>WIN_MINTOP+2)
				End if 
				SIZ_l_OLDTOP:=<>WIN_MINTOP+2
				SIZ_l_OLDBOTTOM:=((Screen height:C188-$_l_DockLB)-<>WIN_MINTOP+2)
				//SET WINDOW RECT(SIZ_l_OLDLEFT;◊WIN_MINTOP+2;SIZ_l_OLDRIGHT;((Screen height-$_l_DockLB)-◊WIN_MINTOP+2))
				//GET WINDOW RECT(SIZ_l_OLDLEFT;SIZ_l_OLDTOP;SIZ_l_OLDRIGHT;SIZ_l_OLDBOTTOM)
			End if 
			
			If (SIZ_l_OLDTOP<PRC_l_WindowTop) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>(Screen height:C188-$_l_DockLB))
				//HIDE PROCESS(Current process)
				$5->:=((Screen height:C188-$_l_DockLB)-PRC_l_WindowTop)-PRC_l_WindowTop
				//SET WINDOW RECT(SIZ_l_OLDLEFT;PRC_l_WindowTop;SIZ_l_OLDRIGHT;((Screen height-$_l_DockLB)-PRC_l_WindowTop))
			End if 
		: ($1=2)  //input form
			$_l_TableNumber:=Table:C252($2)
			
			If ($3#"") & ($_l_TableNumber>0)
				If (Is table number valid:C999($_l_TableNumber))
					If (Not:C34(<>INT_FormSIzesInited))
						INT_LoadFormSizes(<>PER_l_CurrentUserID)
					End if 
					FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
					$_l_FormRow:=Find in array:C230(<>INT_at_FormNames; Table name:C256($2)+"_"+$3)
					If ($_l_FormRow>0)
						If (Count parameters:C259>=5)
							$4->:=<>INT_al_FormHeight{$_l_FormRow}
							$5->:=<>INT_al_FormWidth{$_l_FormRow}
						End if 
						$_l_xWidth:=0
						$_l_xHeight:=0
						If (Count parameters:C259>=9)
							WIN_GetAutoScreenSize(1; <>INT_al_FormHeight{$_l_FormRow}; <>INT_al_FormWidth{$_l_FormRow}; ""; ->$_l_xHeight; ->$_l_xWidth; $6; $7; $8; $9)
						End if 
						If (Count parameters:C259>=5)
							If ($_l_xWidth>0) & ($_l_xHeight>0)
								$4->:=$_l_xHeight
								$5->:=$_l_xWidth
							End if 
						End if 
						//WS_AutoscreenSize (1;◊INT_al_FormHeight{$_l_FormRow};◊INT_al_FormWidth{$_l_FormRow})
					Else 
						If (Count parameters:C259>=5)
							$4->:=$_l_FormDefaultHeight
							$5->:=$_l_FormDefaultWidth
						End if 
						$_l_xWidth:=0
						$_l_xHeight:=0
						If (Count parameters:C259>=9)
							WIN_GetAutoScreenSize(1; $_l_FormDefaultHeight; $_l_FormDefaultWidth; ""; ->$_l_xHeight; ->$_l_xWidth; $6; $7; $8; $9)
						End if 
						If (Count parameters:C259>=5)
							If ($_l_xWidth>0) & ($_l_xHeight>0)
								$4->:=$_l_xHeight
								$5->:=$_l_xWidth
							End if 
						End if 
						
						
						
					End if 
				End if 
			End if 
			
		: ($1=3)  // standard form size(dialog)
			If (False:C215)
				FORM GET PROPERTIES:C674($2->; $3; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
				If ($_l_FormDefaultHeight>0) & ($_l_FormDefaultWidth>0)
					WS_AutoscreenSize(2; $_l_FormDefaultHeight; $_l_FormDefaultWidth)
					
				End if 
				
			End if 
			
	End case 
	
	
	
End if 
SIZ_l_OLDLEFT:=$_l_LeftOLD
SIZ_l_OLDTOP:=$_l_TopOLD
SIZ_l_OLDRIGHT:=$_l_RightOLD
SIZ_l_OLDBOTTOM:=$_l_BottomOLD
ERR_MethodTrackerReturn("WIN_GetFormSize"; $_t_oldMethodName)
