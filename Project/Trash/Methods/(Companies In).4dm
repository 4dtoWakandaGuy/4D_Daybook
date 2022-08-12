//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies In")
DB_MenuNewRecord(Table name:C256(Table:C252(->[COMPANIES:2])))


//Companies_In_NEW
ERR_MethodTrackerReturn("Companies In"; $_t_oldMethodName)