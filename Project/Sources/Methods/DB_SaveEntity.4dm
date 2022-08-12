//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SaveEntity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/04/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_Save; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	
	$_obj_Save:=$1.save(dk auto merge:K85:24)
	Case of 
		: ($_obj_Save.success)
		: ($_obj_Save.status=dk status automerge failed:K85:25)
			//ALERT($_obj_Save.statusText)
	End case 
End if 
