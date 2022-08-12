//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_DelNoCan
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
	C_LONGINT:C283(vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelNoCan")
//Minor_DelNoCancel - ie don't cancel if go to zero records

If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116($1->; "Master")
		USE SET:C118("Userset")
		DELETE SELECTION:C66($1->)
		USE SET:C118("Master")
		vNo:=Records in selection:C76($1->)
	End if 
End if 
ERR_MethodTrackerReturn("Minor_DelNoCan"; $_t_oldMethodName)