//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers40017
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers40017")
READ WRITE:C146([TRANSACTION_TYPES:31])
If ([USER:15]Deposit Trans:59#"")
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=[USER:15]Deposit Trans:59)
	[TRANSACTION_TYPES:31]D_Range_F:9:=[TRANSACTION_TYPES:31]Debit_Account:4
	[TRANSACTION_TYPES:31]D_Range_T:10:=[TRANSACTION_TYPES:31]Debit_Account:4
	[TRANSACTION_TYPES:31]C_Range_F:11:=[TRANSACTION_TYPES:31]Credit_Account:5
	[TRANSACTION_TYPES:31]C_Range_T:12:=[TRANSACTION_TYPES:31]Credit_Account:5
	[TRANSACTION_TYPES:31]D_Enforce:13:=True:C214
	[TRANSACTION_TYPES:31]C_Enforce:14:=True:C214
	DB_SaveRecord(->[TRANSACTION_TYPES:31])
End if 
If ([USER:15]PrePay Trans:61#"")
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=[USER:15]PrePay Trans:61)
	[TRANSACTION_TYPES:31]D_Range_F:9:=[TRANSACTION_TYPES:31]Debit_Account:4
	[TRANSACTION_TYPES:31]D_Range_T:10:=[TRANSACTION_TYPES:31]Debit_Account:4
	[TRANSACTION_TYPES:31]C_Range_F:11:=[TRANSACTION_TYPES:31]Credit_Account:5
	[TRANSACTION_TYPES:31]C_Range_T:12:=[TRANSACTION_TYPES:31]Credit_Account:5
	[TRANSACTION_TYPES:31]D_Enforce:13:=True:C214
	[TRANSACTION_TYPES:31]C_Enforce:14:=True:C214
	DB_SaveRecord(->[TRANSACTION_TYPES:31])
End if 
READ ONLY:C145([TRANSACTION_TYPES:31])
UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
ERR_MethodTrackerReturn("User Vers40017"; $_t_oldMethodName)