//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_WIPCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_WIPCheck")
If ((DB_GetModuleSettingByNUM(1))=5)
	$0:=False:C215
Else 
	$0:=True:C214
	If (<>WIP_t_CIPTRANS#"")
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=<>WIP_t_CIPTRANS)
		If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
			$0:=False:C215
		End if 
	End if 
	If ($0)
		If (<>WIP_t_TRPTrans#"")
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=<>WIP_t_TRPTrans)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
				$0:=False:C215
			End if 
		End if 
	End if 
	If ($0)
		If (<>WIP_t_TRWTrans#"")
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=<>WIP_t_TRWTrans)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
				$0:=False:C215
			End if 
		End if 
	End if 
	If ($0)
		If (<>WIP_t_CIWTrans#"")
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=<>WIP_t_CIWTrans)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
				$0:=False:C215
			End if 
		End if 
	End if 
	If ($0=False:C215)
		Gen_Alert("NB: The WIP Trans_Types have not been correctly defined.  No WIP "+"Postings will take place")
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_WIPCheck"; $_t_oldMethodName)