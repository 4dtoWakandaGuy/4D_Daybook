//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_ViewA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Changed; vSVReadOnly)
	C_LONGINT:C283($_l_No; vNo)
	C_POINTER:C301($_Ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ViewA")
//StatsView_View

$_bo_Changed:=False:C215
vNo:=Records in selection:C76(vFilePtr->)
If (vNo>0)
	$_Ptr_Table:=vFilePtr
	$_l_No:=vNo
	CREATE SET:C116(vFilePtr->; "SVSet")
	If (vSVReadOnly=False:C215)
		READ WRITE:C146(vFilePtr->)
	End if 
	
	Open_Pro_Window("All selected records"; 0; 1; vFilePtr; WIN_t_CurrentOutputform)
	FS_SetFormSort(WIN_t_CurrentOutputform)
	WIn_SetFormSize(1; vFilePtr; WIN_t_CurrentOutputform)
	MODIFY SELECTION:C204(vFilePtr->; *)
	Close_ProWin
	If ($_l_No#Records in selection:C76(vFilePtr->))
		Gen_Confirm("You have changed the selection of records.  "+"Do you want this to affect the Statistics View calculations?"; "Yes"; "No")
		If (OK=1)
			vNo:=Records in selection:C76(vFilePtr->)
			StatsView_Cal1
		Else 
			USE SET:C118("SVSet")
			CLEAR SET:C117("SVSet")
			vNo:=Records in selection:C76($_Ptr_Table->)
		End if 
	Else 
		USE SET:C118("SVSet")
		CLEAR SET:C117("SVSet")
		vNo:=Records in selection:C76($_Ptr_Table->)
	End if 
	vFilePtr:=$_Ptr_Table
Else 
	Gen_Alert("There are no selected records to View"; "Cancel")
End if 

UNLOAD RECORD:C212(vFilePtr->)
READ ONLY:C145(vFilePtr->)
ERR_MethodTrackerReturn("StatsView_ViewA"; $_t_oldMethodName)
