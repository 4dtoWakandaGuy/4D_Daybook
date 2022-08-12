//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetReminder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_BOOLEAN:C305($_bo_SetEnterable; $3; SD_bo_AddingDiaryRecord; SD_bo_CBAlarmed)
	C_LONGINT:C283($_l_Days; $_l_Hours; $_l_Remainder; $1; SD_l_TimeFrame; vSD_SelCalendar2; vSD_SelCalendar3)
	C_TEXT:C284($_t_oldMethodName; $2; SD_at_TimeFrame)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetReminder")
//SD_SetReminder
OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
If (Count parameters:C259>=3)
	$_bo_SetEnterable:=$3
Else 
	$_bo_SetEnterable:=True:C214
End if 

If (Count parameters:C259>=1)
	If ($1>0)
		SD_bo_CBAlarmed:=True:C214
		
		Case of 
			: ($1>(60*24))  //DAYS/Hours/mins
				$_l_Days:=$1/(60*24)
				$_l_Remainder:=$1-($_l_Days*(60*24))
				If ($_l_Remainder>0)
					$_l_Hours:=$_l_Remainder/60
					$_l_Remainder:=$_l_Remainder-($_l_Hours*(60))
					If ($_l_Remainder>0)
						SD_l_TimeFrame:=$1
						SD_at_TimeFrame:="Minutes"
					Else 
						SD_l_TimeFrame:=$_l_Hours+($_l_Days*24)
						SD_at_TimeFrame:="Hours"
					End if 
				Else 
					SD_l_TimeFrame:=$_l_Days
					SD_at_TimeFrame:="Days"
				End if 
				
			: ($1>60)  //hours
				
				$_l_Hours:=$1/60
				$_l_Remainder:=$1-($_l_Hours*(60))
				If ($_l_Remainder>0)
					SD_l_TimeFrame:=$1
					SD_at_TimeFrame:="Minutes"
				Else 
					SD_l_TimeFrame:=$_l_Hours
					SD_at_TimeFrame:="Hours"
				End if 
				
			Else 
				//   Minutes
				SD_l_TimeFrame:=$1
				SD_at_TimeFrame:="Minutes"
				//time frame already set so calc mins/hours/etc
		End case 
		Case of 
			: ([DIARY:12]Done:14)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
				OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
			: ([DIARY:12]Date_Done_From:5>!00-00-00!)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
				OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
			: ([DIARY:12]Date_Do_To:33>Current date:C33)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
				SD3_at_TimeFrame{1}:="Minutes"
				SD3_at_TimeFrame{2}:="Hours"
				SD3_at_TimeFrame{3}:="Days"
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				If ($_bo_SetEnterable)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
				End if 
				
			: ([DIARY:12]Date_Do_To:33=Current date:C33) & ([DIARY:12]Time_Do_To:35>Current time:C178)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
				SD3_at_TimeFrame{1}:="Minutes"
				SD3_at_TimeFrame{2}:="Hours"
				SD3_at_TimeFrame{3}:="Days"
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				If ($_bo_SetEnterable)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
				End if 
			: ([DIARY:12]Date_Do_From:4>Current date:C33)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
				SD3_at_TimeFrame{1}:="Minutes"
				SD3_at_TimeFrame{2}:="Hours"
				SD3_at_TimeFrame{3}:="Days"
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				If ($_bo_SetEnterable)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
				End if 
			: ([DIARY:12]Date_Do_From:4=Current date:C33) & ([DIARY:12]Time_Do_From:6>Current time:C178)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
				SD3_at_TimeFrame{1}:="Minutes"
				SD3_at_TimeFrame{2}:="Hours"
				SD3_at_TimeFrame{3}:="Days"
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				If ($_bo_SetEnterable)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
				End if 
			: ([DIARY:12]Date_Do_From:4<Current date:C33)
				ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
			Else 
				ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
				OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
				OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
		End case 
	Else 
		If ($2="")  //diary code
			
			ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
			OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
			OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
			OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
			OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
			OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
			SD_at_TimeFrame:=""
			OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
			OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
			SD_bo_CBAlarmed:=False:C215
			SD_l_TimeFrame:=0
			
		Else 
			//diary record loaded
			SD_l_TimeFrame:=0
			SD_at_TimeFrame:="Minutes"
			//time frame already set so calc mins/hours/etc
			SD_bo_CBAlarmed:=False:C215
			Case of 
				: ([DIARY:12]Done:14)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
				: ([DIARY:12]Date_Done_From:5>!00-00-00!)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					If ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					Else 
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
					End if 
					
				: ([DIARY:12]Date_Do_To:33>Current date:C33)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
					SD3_at_TimeFrame{1}:="Minutes"
					SD3_at_TimeFrame{2}:="Hours"
					SD3_at_TimeFrame{3}:="Days"
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					If ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					Else 
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
					End if 
					
				: ([DIARY:12]Date_Do_To:33=Current date:C33) & ([DIARY:12]Time_Do_To:35>Current time:C178)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
					SD3_at_TimeFrame{1}:="Minutes"
					SD3_at_TimeFrame{2}:="Hours"
					SD3_at_TimeFrame{3}:="Days"
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					If ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					Else 
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
					End if 
				: ([DIARY:12]Date_Do_From:4>Current date:C33)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
					SD3_at_TimeFrame{1}:="Minutes"
					SD3_at_TimeFrame{2}:="Hours"
					SD3_at_TimeFrame{3}:="Days"
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					If ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					Else 
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
					End if 
				: ([DIARY:12]Date_Do_From:4=Current date:C33) & ([DIARY:12]Time_Do_From:6>Current time:C178) | (SD_bo_AddingDiaryRecord)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 3)
					SD3_at_TimeFrame{1}:="Minutes"
					SD3_at_TimeFrame{2}:="Hours"
					SD3_at_TimeFrame{3}:="Days"
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; $_bo_SetEnterable)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; True:C214)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; True:C214)
					If ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					Else 
						OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; False:C215)
					End if 
				: ([DIARY:12]Date_Do_From:4<Current date:C33)
					ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
					If (SD_bo_AddingDiaryRecord) | ($_bo_SetEnterable)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
						OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
					End if 
				Else 
					ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
					OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
					OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
					OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
					OBJECT SET ENABLED:C1123(SD_bo_CBAlarmed; False:C215)
			End case 
		End if 
	End if 
Else 
	ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
	OBJECT SET ENTERABLE:C238(SD_l_TimeFrame; False:C215)
	
End if 
ERR_MethodTrackerReturn("SD_SetReminder"; $_t_oldMethodName)
