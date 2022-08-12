//%attributes = {}
If (False:C215)
	//Project Method Name:      FilesFIx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_IdentsTableNumbers; 0)
	ARRAY LONGINT:C221($_al_ReferencedTableNumbers; 0)
	C_LONGINT:C283($_l_RecordsInSelection; $_l_TableNumber; $_l_TableNumbersIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FilesFIx")
ARRAY LONGINT:C221($_al_ReferencedTableNumbers; 0)
ARRAY INTEGER:C220($_ai_IdentsTableNumbers; 0)
READ WRITE:C146([IDENTIFIERS:16])
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>0)
SELECTION TO ARRAY:C260([IDENTIFIERS:16]Table_Number:1; $_ai_IdentsTableNumbers)
For ($_l_TableNumbersIndex; 1; Size of array:C274($_ai_IdentsTableNumbers))
	$_l_TableNumber:=$_ai_IdentsTableNumbers{$_l_TableNumbersIndex}
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$_l_TableNumber)
	If (Records in selection:C76([IDENTIFIERS:16])>1)
		ORDER BY:C49([IDENTIFIERS:16]; [IDENTIFIERS:16]Number:2; >)
		$_l_RecordsInSelection:=Records in selection:C76([IDENTIFIERS:16])
		REDUCE SELECTION:C351([IDENTIFIERS:16]; $_l_RecordsInSelection-1)
		DELETE SELECTION:C66([IDENTIFIERS:16])
	End if 
End for 
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8>0)
SELECTION TO ARRAY:C260([IDENTIFIERS:16]XRef_FIELD:8; $_al_ReferencedTableNumbers)
For ($_l_TableNumbersIndex; 1; Size of array:C274($_al_ReferencedTableNumbers))
	$_l_TableNumber:=$_al_ReferencedTableNumbers{$_l_TableNumbersIndex}
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_TableNumber)
	If (Records in selection:C76([IDENTIFIERS:16])>1)
		ORDER BY:C49([IDENTIFIERS:16]; [IDENTIFIERS:16]Number:2; >)
		$_l_RecordsInSelection:=Records in selection:C76([IDENTIFIERS:16])
		REDUCE SELECTION:C351([IDENTIFIERS:16]; $_l_RecordsInSelection-1)
		DELETE SELECTION:C66([IDENTIFIERS:16])
	End if 
End for 
ERR_MethodTrackerReturn("FilesFIx"; $_t_oldMethodName)