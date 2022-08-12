If (False:C215)
	//object Name: [PERSONNEL]PER_DiarySetup.oPerTimings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_ActionSettings;0)
	//ARRAY BOOLEAN(SD_abo_TimeModified;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionTimesString;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Minutes; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_Row; $_l_Time)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; Per_l_Hours; Per_l_Minutes; PER_l_saveTime; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_ClickedColumn; $_l_event)
	C_LONGINT:C283($_l_FieldNumber; $_l_Minutes; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_Row; $_l_TableNumber; $_l_Time; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; Per_l_Days; Per_l_Hours; Per_l_Minutes; PER_l_saveTime; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_T_Variable; $_t_oldMethodName; $_T_Variable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].PER_DiarySetup.oPerTimings"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_T_Variable; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->PER_lb_ActionSettings; $_T_Variable)
		Case of 
			: ($_l_ClickedColumn=3)
				$_l_Row:=Self:C308->
				$_l_Time:=SD_al_ActionTime{$_l_Row}
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				OBJECT GET COORDINATES:C663(PER_lb_ActionSettings; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				//SD_al_ActionTime
				Per_l_Hours:=0
				Per_l_Days:=0
				Per_l_Minutes:=0
				Case of 
					: ($_l_Time<60)
						Per_l_Minutes:=$_l_Time
						
					: ($_l_Time<=(60*24))
						Repeat 
							Per_l_Hours:=Per_l_Hours+1
							$_l_Time:=$_l_Time-60
						Until ($_l_Time<60)
						Per_l_Minutes:=$_l_Time
					Else 
						Repeat 
							Per_l_Days:=Per_l_Days+1
							$_l_Time:=$_l_Time-(60*24)
						Until (Per_l_Days<=(60*24))
						If ($_l_Time>=60)
							Repeat 
								Per_l_Hours:=Per_l_Hours+1
								$_l_Time:=$_l_Time-60
							Until ($_l_Time<60)
						End if 
						Per_l_Minutes:=$_l_Time
				End case 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				PER_l_saveTime:=0
				$_l_WindowLeft:=$_l_WindowLeft+$_l_ObjectLeft+(87+187)
				$_l_WindowRight:=$_l_WindowLeft+$_l_ObjectRight-(87+187)
				$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
				WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				
				WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_windowTop+$_l_ObjectTop; $_l_WindowRight; $_l_windowTop+$_l_ObjectBottom)
				DIALOG:C40("SD_al_TimeSetting")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
				If (PER_l_saveTime=1)
					SD_abo_TimeModified{$_l_Row}:=True:C214
					
					$_l_Minutes:=(Per_l_Days*24*60)+(Per_l_Hours*60)+Per_l_Minutes
					
					If ($_l_Minutes#SD_al_ActionTime{$_l_Row})
						SD_al_ActionTime{$_l_Row}:=$_l_Minutes
						SD_abo_TimeModified{$_l_Row}:=True:C214
						SD_at_ActionTimesString{$_l_Row}:=SD2_MinutestoTimeString(SD_al_ActionTime{$_l_Row})
						
					End if 
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].PER_DiarySetup.oPerTimings"; $_t_oldMethodName)
