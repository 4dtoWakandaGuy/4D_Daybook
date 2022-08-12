//%attributes = {}
If (False:C215)
	//Project Method Name:      Standing_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($_l_Number)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_Mod")
//Standing_Mod
Start_Process
$_l_Number:=Standing_Check
If ($_l_Number=0)
	Standing_File
	Minor_Sort(->[RECURRING_JOURNALS:38])
	
	If (Records in selection:C76([RECURRING_JOURNALS:38])=0)
		DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[RECURRING_JOURNALS:38]); True:C214)
		
	Else 
		Open_Pro_Window("View Recurring Journals"; 0; 1; ->[RECURRING_JOURNALS:38]; WIN_t_CurrentOutputform)
		FS_SetFormSort(WIN_t_CurrentOutputform)
		WIn_SetFormSize(1; ->[RECURRING_JOURNALS:38]; WIN_t_CurrentOutputform)
		MODIFY SELECTION:C204([RECURRING_JOURNALS:38]; *)
		Close_ProWin
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Standing_Mod"; $_t_oldMethodName)