//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CodeMN2
	//------------------ Method Notes ------------------
	//Gen_CodeMN2 - this procedure will only come into play if some really heavy use
	//is going on inside Transactions
	//I know this is recursive, but I'll eat my hat if anyone manages to exceed the 6
	//Calls that the Stack size allows
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2009 16:52:03If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CodeCreateProcess; $0; $1)
	C_TEXT:C284($_t_oldMethodName; CreateSem)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CodeMN2")

CreateSem:="CodeCr"+String:C10($1)
If (Not:C34(Semaphore:C143(CreateSem)))
	CLEAR SEMAPHORE:C144(CreateSem)
	$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10($1))
End if 
DelayTicks(180)
While (Semaphore:C143(CreateSem))
	DelayTicks(30)
End while 
CLEAR SEMAPHORE:C144(CreateSem)
QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
	$0:=Gen_CodeMN2($1)
Else 
	MESSAGES OFF:C175
	ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
	MESSAGES ON:C181
	READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
	FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
	If ((Locked:C147([IDENTIFIERS_MULTI_NUMBERS:94])) | ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>9000))
		NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
		While (((Locked:C147([IDENTIFIERS_MULTI_NUMBERS:94])) | ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>9000)) & (Not:C34(End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94]))))
			NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
		End while 
		If (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94]))
			$0:=Gen_CodeMN2($1)
		Else 
			$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
			[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
			DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
		End if 
	Else 
		$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
		[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
		DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
		UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
	End if 
End if 
ERR_MethodTrackerReturn("Gen_CodeMN2"; $_t_oldMethodName)