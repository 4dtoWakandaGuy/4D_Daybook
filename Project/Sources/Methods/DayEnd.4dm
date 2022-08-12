//%attributes = {}
If (False:C215)
	//Project Method Name:      DayEnd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_DayNumber)
	C_TEXT:C284($_t_Character1; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DayEnd")
//Dayend
$_l_DayNumber:=Day of:C23($1)
$0:="th"
If ((Length:C16(String:C10($_l_DayNumber))=1) | ((Length:C16(String:C10($_l_DayNumber))=2) & (Substring:C12(String:C10($_l_DayNumber); 1; 1)#"1")))
	$_t_Character1:=Substring:C12(String:C10($_l_DayNumber); Length:C16(String:C10($_l_DayNumber)); 1)
	Case of 
		: ($_t_Character1="1")
			$0:="st"
		: ($_t_Character1="2")
			$0:="nd"
		: ($_t_Character1="3")
			$0:="rd"
	End case 
End if 
ERR_MethodTrackerReturn("DayEnd"; $_t_oldMethodName)