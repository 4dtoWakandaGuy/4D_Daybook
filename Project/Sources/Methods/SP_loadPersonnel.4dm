//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_loadPersonnel
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_loadPersonnel")
$0:=""
READ ONLY:C145([PERSONNEL:11])
If (Count parameters:C259>=1)
	If ($1>0)  //6
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
		$0:=[PERSONNEL:11]Name:2
	End if 
Else 
	$0:=""
End if   //end6
ERR_MethodTrackerReturn("SP_loadPersonnel"; $_t_oldMethodName)