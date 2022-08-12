//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView View
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_BOOLEAN:C305($_bo_Changed; $_bo_Continue; vSVReadOnly)
	C_LONGINT:C283($_l_FIeldNumberColumn; $_l_FieldType; $_l_RecordsinSelection; $_l_SelectedRow; $_l_TableNumberRow; $1; vNo)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_Title; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView View")
//StatsView View
Load_Fields
If (Count parameters:C259>=1)
	$_l_SelectedRow:=$1
Else 
	$_l_SelectedRow:=aSV1
End if 

$_ptr_Table:=vFilePtr
CREATE SET:C116(vFilePtr->; "SVSet")
$_bo_Continue:=True:C214
$_bo_Changed:=False:C215

If (vSVReadOnly=False:C215)
	READ WRITE:C146(vFilePtr->)
End if 

If (aSV1{1}#"All selected records")
	If (aSV1=0)
		Gen_Confirm("You have not selected a line to View"; "Try again"; "View all")
		$_bo_Continue:=(OK=0)
		$_t_Title:="All selected records"
	End if 
	If (($_bo_Continue) & (aSV1#0))
		If (SV_at_FieldName1{SV_at_FieldName1}="FF:@")
			StatsView_ViewF(aSV1)
		Else 
			$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{1})
			$_l_FIeldNumberColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumberRow}; SV_at_FieldName1{SV_at_FieldName1})  //Find the Field No from the interProcess_Arrays
			If ($_l_FIeldNumberColumn>0)
				$_ptr_FieldPointer:=Field:C253(SV_al_TableNumber{1}; $_l_FIeldNumberColumn)  //get a pointer to the field in column 1
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
				StatsView_UpdS(aSV1; $_ptr_FieldPointer; $_l_FieldType)  //Search for the relevant records
			End if 
		End if 
		$_t_Title:=Substring:C12(SV_at_FieldName1{SV_at_FieldName1}+": "+aSVN1{aSV1}; 1; 41)
	End if 
Else 
	$_t_Title:="All selected records"
End if 
If ($_bo_Continue)
	vNo:=Records in selection:C76(vFilePtr->)
	$_l_RecordsinSelection:=vNo
	If (vNo>0)
		CREATE SET:C116(vFilePtr->; "SVSetSel")
		Open_Pro_Window($_t_Title; 0; 1; vFilePtr; WIN_t_CurrentOutputform)
		FS_SetFormSort(WIN_t_CurrentOutputform)
		WIn_SetFormSize(1; vFilePtr; WIN_t_CurrentOutputform)
		MODIFY SELECTION:C204(vFilePtr->; *)
		Close_ProWin
		If ((OK=1) & (Read only state:C362(vFilePtr->)=False:C215))
			//  If ($_l_RecordsinSelection#Records in selection(vFilePtr»))
			Gen_Confirm("Do you want to recalculate the Statistics View figures"+" to reflect any changes you have made?"; "Yes"; "No")
			//"You have changed the selection of records.  "+
			//"Do you want this to affect the Statistics View calculations?"
			If (OK=1)
				CREATE SET:C116($_ptr_Table->; "Extra")
				DIFFERENCE:C122("SVSet"; "SVSetSel"; "SVSet")
				UNION:C120("SVSet"; "Extra"; "SVSet")
				$_bo_Changed:=True:C214
			End if 
			//   End if
		End if 
		CLEAR SET:C117("SVSetSel")
	Else 
		Gen_Alert("There are no selected records to View"; "Cancel")
	End if 
End if 

vFilePtr:=$_ptr_Table
USE SET:C118("SVSet")
CLEAR SET:C117("SVSet")
vNo:=Records in selection:C76(vFilePtr->)
If ($_bo_Changed)
	StatsView_Cal1
End if 

UNLOAD RECORD:C212(vFilePtr->)
READ ONLY:C145(vFilePtr->)
ERR_MethodTrackerReturn("StatsView View"; $_t_oldMethodName)