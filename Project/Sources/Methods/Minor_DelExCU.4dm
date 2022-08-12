//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_DelExCU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
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

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelExCU")
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116($1->; "Master")
		USE SET:C118("Userset")
		READ WRITE:C146([CODE_USES:91])
		FIRST RECORD:C50($1->)
		While (Not:C34(End selection:C36($1->)))
			$_t_UniqueCode:=String:C10(Table:C252($1))
			$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+$2->
			QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UniqueCode)
			If (Records in selection:C76([CODE_USES:91])>0)
				DELETE SELECTION:C66([CODE_USES:91])
			End if 
			NEXT RECORD:C51($1->)
		End while 
		READ ONLY:C145([CODE_USES:91])
		Minor_DelRecords($1; $2; $3)
		DELETE SELECTION:C66($1->)
		USE SET:C118("Master")
		Gen_OutNo($1->)
		
	End if 
End if 
ERR_MethodTrackerReturn("Minor_DelExCU"; $_t_oldMethodName)