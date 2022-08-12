//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadCompany
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

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadCompany")
If (Count parameters:C259>=1)
	If ($1>0)  //2
		If ($1#[COMPANIES:2]x_ID:63)  //3
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$1)
		End if   //end 3
		$0:=[COMPANIES:2]Company_Name:2
	End if   //end 2
End if 
ERR_MethodTrackerReturn("SP_LoadCompany"; $_t_oldMethodName)