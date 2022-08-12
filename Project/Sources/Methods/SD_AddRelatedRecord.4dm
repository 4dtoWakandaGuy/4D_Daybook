//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AddRelatedRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; SD3_l_DiaryRelatedRecordTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AddRelatedRecord")
//this is called
//when diary items related to a record are requested and none exist
//this will ask if the user wishes to add on
If ($1>0)
	Case of 
		: (SD3_l_DiaryRelatedRecordTable=2)
			Gen_Confirm("There are no diary items relating to this Company . Add one?"; "Yes"; "No")  //this may need to be more dynamic
			
		: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[SERVICE_CALLS:20]))
			Gen_Confirm("There are no diary items relating to this Service call. Add one?"; "Yes"; "No")
		: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[CONTACTS:1]))
			Gen_Confirm("There are no diary items relating to this Contact. Add one?"; "Yes"; "No")
		: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[JOBS:26]))
			Gen_Confirm("There are no diary items relating to this Job. Add one?"; "Yes"; "No")
		: (SD3_l_DiaryRelatedRecordTable=Table:C252(->[ORDERS:24]))
			Gen_Confirm("There are no diary items relating to this Order . Add one?"; "Yes"; "No")
		Else 
			Gen_Confirm("There are no diary items relating to this Item. Add one?"; "Yes"; "No")
	End case 
	If (OK=1)
		SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*); True:C214)
		// need to add in the call etc here
		//we know the table etc
		SD_GETSOURCERECORD($1; [DIARY:12]Data_Source_Table:49)
		
	End if 
End if 
ERR_MethodTrackerReturn("SD_AddRelatedRecord"; $_t_oldMethodName)
