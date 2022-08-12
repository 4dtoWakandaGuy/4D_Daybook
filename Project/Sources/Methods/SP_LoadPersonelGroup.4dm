//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadPersonelGroup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2009 11:23
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

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadPersonelGroup")
$0:=""
If (Count parameters:C259>=1)
	If ($1>0)  //end 7
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=$1)
		$0:=[PERSONNEL_GROUPS:92]Group_Name:2
	End if 
End if 
ERR_MethodTrackerReturn("SP_LoadPersonelGroup"; $_t_oldMethodName)