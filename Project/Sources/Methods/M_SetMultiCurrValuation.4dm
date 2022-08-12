//%attributes = {}
If (False:C215)
	//Project Method Name:      M_SetMultiCurrValuation
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
	C_REAL:C285($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("M_SetMultiCurrValuation")
READ WRITE:C146([ACCOUNTS:32])
ALL RECORDS:C47([ACCOUNTS:32])
FIRST RECORD:C50([ACCOUNTS:32])
For ($_l_Index; 1; Records in selection:C76([ACCOUNTS:32]))
	If ([ACCOUNTS:32]PB:4="P")
		[ACCOUNTS:32]Multicurrency_Valuation:10:=2
	Else 
		[ACCOUNTS:32]Multicurrency_Valuation:10:=1
	End if 
	DB_SaveRecord(->[ACCOUNTS:32])
	NEXT RECORD:C51([ACCOUNTS:32])
End for 

//ALERT("Multicurrency Valuation field has been updated according to the P and B "
Gen_Alert("Multicurrency Valuation field has been updated according to the P and B "+"value of ACCOUNT - If Account type is P Multicurrency Valuation is H and if "+"Account type is B Multicurrency Valuation is C")
ERR_MethodTrackerReturn("M_SetMultiCurrValuation"; $_t_oldMethodName)
