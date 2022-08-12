//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_FixFieldTypeMisMatch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 11:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_RecordNumber)
	C_POINTER:C301($_Ptr_Field; $_PtrTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_FixFieldTypeMisMatch")
For ($_l_Index; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_Index))
		$_PtrTable:=Table:C252($_l_Index)
		READ WRITE:C146($_PtrTable->)
		ALL RECORDS:C47($_PtrTable->)
		For ($_l_RecordNumber; 1; Records in selection:C76($_PtrTable->))
			For ($_l_FieldNumber; 1; Get last field number:C255($_PtrTable))
				If (Is field number valid:C1000($_l_Index; $_l_FieldNumber))
					
					$_Ptr_Field:=Field:C253($_l_Index; $_l_FieldNumber)
					$_Ptr_Field->:=$_Ptr_Field->
				End if 
			End for 
			DB_SaveRecord($_PtrTable)
			NEXT RECORD:C51($_PtrTable->)
		End for 
		UNLOAD RECORD:C212($_PtrTable->)
		READ ONLY:C145($_PtrTable->)
		FLUSH CACHE:C297
	End if 
End for 
ALERT:C41("Done!")
ERR_MethodTrackerReturn("UTI_FixFieldTypeMisMatch"; $_t_oldMethodName)