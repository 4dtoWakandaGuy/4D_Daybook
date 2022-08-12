//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SaveByObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_Home; $_obj_Save)
End if 
//Code Starts Here
$_obj_Save:=$_obj_Home.save(dk auto merge:K85:24)
Case of 
	: ($_obj_Save.success)
	: ($_obj_Save.status=dk status automerge failed:K85:25)
		ALERT:C41($_obj_Save.statusText)
End case 
