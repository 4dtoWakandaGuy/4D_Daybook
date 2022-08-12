If (False:C215)
	//object Name: [JOBS]Jobs_TS.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vPPage)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_TS.Variable3"; Form event code:C388)
vPPage:="Page "+String:C10(Printing page:C275)
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_TS.Variable3"; $_t_oldMethodName)