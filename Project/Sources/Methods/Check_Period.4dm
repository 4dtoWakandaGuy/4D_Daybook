//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Period
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1; vDate)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Period")
//Check_Period

If (Count parameters:C259=0)
	QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=vDate; *)
	QUERY:C277([PERIODS:33];  & ; [PERIODS:33]From_Date:3<=vDate)
	FIRST RECORD:C50([PERIODS:33])
	$0:=[PERIODS:33]x_ID:10
Else 
	QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=$1; *)
	QUERY:C277([PERIODS:33];  & ; [PERIODS:33]From_Date:3<=$1)
	FIRST RECORD:C50([PERIODS:33])
	$0:=[PERIODS:33]x_ID:10
	//UNLOAD RECORD([PERIODS])
	
End if 
ERR_MethodTrackerReturn("Check_Period"; $_t_oldMethodName)
