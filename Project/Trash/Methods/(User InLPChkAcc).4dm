//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User_inLPChkAcc
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

$_t_oldMethodName:=ERR_MethodTracker("User_inLPChkAcc")
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		If ($1->#"")
			Check_MinorNC($1; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
			If (Records in selection:C76([ACCOUNTS:32])=0)
				Gen_Alert("That Account does not exist"; "Try again")
				REJECT:C38($1->)
				$1->:=[ACCOUNTS:32]Account_Code:2
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("User_inLPChkAcc"; $_t_oldMethodName)