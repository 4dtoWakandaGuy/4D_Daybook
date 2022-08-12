//%attributes = {}
If (False:C215)
	//Project Method Name:      DEMO_UpdateAllDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:01:16If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FIeldNumberIndex; $_l_RecordIndex; $_l_TableIndex)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEMO_UpdateAllDates")
READ WRITE:C146(*)
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		For ($_l_FIeldNumberIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FIeldNumberIndex))
				$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FIeldNumberIndex)
				If (Type:C295($_ptr_FieldPointer->)=Is date:K8:7)
					ALL RECORDS:C47(Table:C252($_l_TableIndex)->)
					For ($_l_RecordIndex; 1; Records in selection:C76(Table:C252($_l_TableIndex)->))
						Case of 
							: ($_ptr_FieldPointer-><!1995-01-01!)
								$_ptr_FieldPointer->:=$_ptr_FieldPointer->+(365*8)
								DB_SaveRecord(Table:C252($_l_TableIndex))
							: ($_ptr_FieldPointer-><!2000-01-01!)
								$_ptr_FieldPointer->:=$_ptr_FieldPointer->+(365*5)
								DB_SaveRecord(Table:C252($_l_TableIndex))
							: ($_ptr_FieldPointer-><!2002-01-01!)
								$_ptr_FieldPointer->:=$_ptr_FieldPointer->+(365*3)
								DB_SaveRecord(Table:C252($_l_TableIndex))
						End case 
						
						NEXT RECORD:C51(Table:C252($_l_TableIndex)->)
					End for 
				End if 
			End if 
		End for 
	End if 
End for 
ERR_MethodTrackerReturn("DEMO_UpdateAllDates"; $_t_oldMethodName)