//%attributes = {}

If (False:C215)
	//Project Method Name:      FIX_DOCCODE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentCOdes; 0)
	C_LONGINT:C283($_l_ErrorCOunt; $_l_Index; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FIX_DOCCODE")
Repeat 
	$_l_ErrorCOunt:=0
	ALL RECORDS:C47([DOCUMENTS:7])
	SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_DocumentCOdes)
	READ WRITE:C146([DOCUMENTS:7])
	For ($_l_Index; 1; Size of array:C274($_at_DocumentCOdes))
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_at_DocumentCOdes{$_l_Index})
		
		If (Records in selection:C76([DOCUMENTS:7])>1)
			$_l_RecordsinSelection:=Records in selection:C76([DOCUMENTS:7])-1
			REDUCE SELECTION:C351([DOCUMENTS:7]; $_l_RecordsinSelection)
			APPLY TO SELECTION:C70([DOCUMENTS:7]; Set_DocumentCode(1))
			$_l_ErrorCOunt:=$_l_ErrorCOunt+1
		End if 
		
	End for 
Until ($_l_ErrorCOunt=0)
Repeat 
	$_l_ErrorCOunt:=0
	ALL RECORDS:C47([CONTACTS:1])
	SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_DocumentCOdes)
	READ WRITE:C146([DOCUMENTS:7])
	For ($_l_Index; 1; Size of array:C274($_at_DocumentCOdes))
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_at_DocumentCOdes{$_l_Index})
		
		If (Records in selection:C76([CONTACTS:1])>1)
			$_l_RecordsinSelection:=Records in selection:C76([CONTACTS:1])-1
			REDUCE SELECTION:C351([CONTACTS:1]; $_l_RecordsinSelection)
			APPLY TO SELECTION:C70([CONTACTS:1]; Gen_CodePref(2; ->[CONTACTS:1]Contact_Code:2))
			$_l_ErrorCOunt:=$_l_ErrorCOunt+1
		End if 
		
	End for 
Until ($_l_ErrorCOunt=0)
ERR_MethodTrackerReturn("FIX_DOCCODE"; $_t_oldMethodName)