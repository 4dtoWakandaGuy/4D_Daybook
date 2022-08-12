//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User_inLPChkTr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_inLPChkTr")
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		If ($1->#"")
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$1->)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
				Gen_Alert("That Transaction Type does not exist"; "Try again")
				REJECT:C38($1->)
			Else 
				If (([TRANSACTION_TYPES:31]Debit_Account:4="") | ([TRANSACTION_TYPES:31]Credit_Account:5="") | ([TRANSACTION_TYPES:31]Tax_Code:6="") | ([TRANSACTION_TYPES:31]DC:3=""))
					Gen_Alert("That Transaction Type is not complete, so is not valid for allocation"; "Try again")
					REJECT:C38($1->)
				Else 
					$1->:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("User_inLPChkTr"; $_t_oldMethodName)