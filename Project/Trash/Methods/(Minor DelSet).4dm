//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor_DelSet
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelSet")
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116($1->; $2)
		USE SET:C118("Userset")
		DELETE SELECTION:C66($1->)
		USE SET:C118($2)
		Gen_OutNoF($1)
	End if 
End if 
ERR_MethodTrackerReturn("Minor_DelSet"; $_t_oldMethodName)