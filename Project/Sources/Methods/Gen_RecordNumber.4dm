//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_RecordNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $lTableNumber)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_RecordNumber")
// Gen_RecordNumber
// 16/07/02 pb
// Generates sequential record numbers for any table
//returns the next record no.

// parameters: $1=the table number

$lTableNumber:=$1
Case of 
	: (Count parameters:C259=1)
		READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
		QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$lTableNumber)
		If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
			CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
			[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=$lTableNumber
		End if 
		While (Locked:C147([IDENTIFIERS_MULTI_NUMBERS:94]))
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			DelayTicks(30)
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=Table:C252(->[EW_ExportProjects:117]))
		End while 
		[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+1
		DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
		$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
		UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
	: (Count parameters:C259>1)
		//NG August 2004
		$0:=AA_GetNextID($2)
End case 
ERR_MethodTrackerReturn("Gen_RecordNumber"; $_t_oldMethodName)