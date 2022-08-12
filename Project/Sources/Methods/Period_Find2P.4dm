//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_Find2P
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
	C_TEXT:C284($_t_oldMethodName; $Per; $PerBef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_Find2P")
//Period_Find2 Purchases
$PerBef:=[PERIODS:33]Period_Code:1
Period_FindP
$Per:=[PERIODS:33]Period_Code:1
$Per:=Gen_Request("Period "+$PerBef+" is closed. Post to period:"; $Per)
If (OK=1)
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$Per)
	Check_PerCloseP
End if 
ERR_MethodTrackerReturn("Period_Find2P"; $_t_oldMethodName)