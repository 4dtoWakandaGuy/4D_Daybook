//%attributes = {}
If (False:C215)
	//Project Method Name:      DayName
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
	C_LONGINT:C283($dn)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DayName")
//DayName
$dn:=Day number:C114($1)
Case of 
	: ($dn=1)
		$0:="Sunday"
	: ($dn=2)
		$0:="Monday"
	: ($dn=3)
		$0:="Tuesday"
	: ($dn=4)
		$0:="Wednesday"
	: ($dn=5)
		$0:="Thursday"
	: ($dn=6)
		$0:="Friday"
	: ($dn=7)
		$0:="Saturday"
	Else 
		$0:=""  // Added NG April 2004
		
End case 
ERR_MethodTrackerReturn("DayName"; $_t_oldMethodName)