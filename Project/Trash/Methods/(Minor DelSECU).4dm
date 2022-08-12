//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor_DelSECU
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
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueCode; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelSECU")
//Minor_DelSinExCodeUse
Are_You_Sure
If (OK=1)
	CREATE SET:C116($1->; "Master")
	$_t_UniqueCode:=String:C10(Table:C252($1))
	$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+$2->
	Minor_DeleteSingleRecord($1; $2; $3)
	DB_DeletionControl($1; "Minor_DelSECU")
	
	DELETE RECORD:C58($1->)
	QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UniqueCode)
	If (Records in selection:C76([CODE_USES:91])>0)
		READ WRITE:C146([CODE_USES:91])
		DELETE SELECTION:C66([CODE_USES:91])
		READ ONLY:C145([CODE_USES:91])
	End if 
	CANCEL:C270
	USE SET:C118("Master")
	Gen_InNoF($1)
End if 
ERR_MethodTrackerReturn("Minor_DelSECU"; $_t_oldMethodName)