//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_SetDate
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
	C_DATE:C307($1; CW_d_SelectDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CW_SetDate")
//Project Method: CW_SetDate
//Sets Date to be used by the calendar widget
//Created: 3/11/99

CW_d_SelectDate:=$1
ERR_MethodTrackerReturn("CW_SetDate"; $_t_oldMethodName)