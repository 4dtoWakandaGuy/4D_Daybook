//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor_DelSetEx
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
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelSetEx")
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116($1->; $4)
		USE SET:C118("Userset")
		Minor_DelRecords($1; $2; $3)
		DELETE SELECTION:C66($1->)
		USE SET:C118($4)
		Gen_OutNoF($1)
	End if 
End if 
ERR_MethodTrackerReturn("Minor_DelSetEx"; $_t_oldMethodName)