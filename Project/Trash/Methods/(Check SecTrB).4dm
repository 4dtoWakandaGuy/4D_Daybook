//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_SecTrB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SecTrB")

If (([TRANSACTION_BATCHES:30]State:15>0) & (DB_t_CurrentFormUsage2#"NM") & (DB_t_CurrentFormUsage3#"Pch"))  //& ($1»#Old($1»)))
	Gen_Alert("You cannot modify this field"; "Cancel")
	$1->:=Old:C35($1->)
	OK:=0
Else 
	OK:=1
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("Check_SecTrB"; $_t_oldMethodName)