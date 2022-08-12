//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_CodeCurrMN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:09:54If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MultiTableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CodeCurrMN")
//Gen_CodeCurrMN
If (([IDENTIFIERS:16]Table_Number:1=0) | ([IDENTIFIERS:16]Multiple_Numbers:7=False:C215))
	Gen_Alert("Please first select a Unique Nos line with the MN (Multiple Numbers) column"+" checked."; "Cancel")
Else 
	QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)
	MESSAGES OFF:C175
	ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
	MESSAGES ON:C181
	READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
	FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
	While (((Locked:C147([IDENTIFIERS_MULTI_NUMBERS:94])) | ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>9000)) & (Not:C34(End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94]))))
		NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
	End while 
	If (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94]))
		LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
		$_l_MultiTableNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+1
	Else 
		$_l_MultiTableNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
	End if 
	UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
	READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
	Gen_Alert("The next "+[IDENTIFIERS:16]Name:3+" Multiple Number to be used is "+String:C10($_l_MultiTableNumber); "OK")
End if 
ERR_MethodTrackerReturn("Gen_CodeCurrMN"; $_t_oldMethodName)