//%attributes = {}
If (False:C215)
	//Project Method Name:      FilterOutSoftDeletions
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
	C_LONGINT:C283($_l_FieldIndex)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_FIeldName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FilterOutSoftDeletions")
//Pointer to table
For ($_l_FieldIndex; Get last field number:C255(Table:C252($1)); 1; -1)
	$_t_FIeldName:=Field name:C257(Table:C252($1); $_l_FieldIndex)
	If ($_t_FIeldName="Deleted")
		$_ptr_Field:=Field:C253(Table:C252($1); $_l_FieldIndex)
		//    QUERY ($1->;$_ptr_Field->=0)
		//bsw 7/06/04 price table entry form company search not correct
		QUERY SELECTION:C341($1->; $_ptr_Field->=0)
		$_l_FieldIndex:=0
	End if 
End for 



If (False:C215)
	Case of 
		: (Table:C252($1)=11)  //BSW 8/1/03 Steve reported that Diary_List showing deleted personals
			//Table 11 is personal
			If (Records in selection:C76([PERSONNEL:11])>0)
				QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
			End if 
	End case 
	
End if 
ERR_MethodTrackerReturn("FilterOutSoftDeletions"; $_t_oldMethodName)