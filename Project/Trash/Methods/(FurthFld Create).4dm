//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name: FurthFld Create
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountParameters)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FurthFld Create")
//FurthFld Create

$_l_CountParameters:=Count parameters:C259
Case of 
	: ($_l_CountParameters=2)
		FurthFld_Creat2($1; $2)
	: ($_l_CountParameters=3)
		FurthFld_Creat2($1; $2; $3)
	: ($_l_CountParameters=4)
		FurthFld_Creat2($1; $2; $3; $4)
End case 
ERR_MethodTrackerReturn("FurthFld Create"; $_t_oldMethodName)