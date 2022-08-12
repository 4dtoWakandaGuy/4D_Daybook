//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_AppendBlobVar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:39`Method: CAL4D_AppendBlobVar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_AppendBlobVar")
//=====================    Declare Variables    ==================================

If (Count parameters:C259>=1)
	For ($_l_Index; 2; Count parameters:C259)
		VARIABLE TO BLOB:C532(${$_l_Index}->; $1->; *)
	End for 
End if 
ERR_MethodTrackerReturn("CAL4D_AppendBlobVar"; $_t_oldMethodName)