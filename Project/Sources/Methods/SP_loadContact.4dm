//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_loadContact
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

$_t_oldMethodName:=ERR_MethodTracker("SP_loadContact")

$0:=""
If (Count parameters:C259>=1)
	If ($1>0)  //4
		If ($1#[CONTACTS:1]x_ID:33)  //5
			READ ONLY:C145([CONTACTS:1])
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$1)
		End if   //end 5
		$0:=[CONTACTS:1]Contact_Name:31
	End if   //end 4
End if 
ERR_MethodTrackerReturn("SP_loadContact"; $_t_oldMethodName)