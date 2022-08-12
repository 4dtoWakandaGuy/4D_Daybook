//%attributes = {}
If (False:C215)
	//Project Method Name:      DayNameNum
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DayNameNum")
//DayNameNum
Case of 
	: ($1=1)
		$0:="Sunday"
	: ($1=2)
		$0:="Monday"
	: ($1=3)
		$0:="Tuesday"
	: ($1=4)
		$0:="Wednesday"
	: ($1=5)
		$0:="Thursday"
	: ($1=6)
		$0:="Friday"
	: ($1=7)
		$0:="Saturday"
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("DayNameNum"; $_t_oldMethodName)