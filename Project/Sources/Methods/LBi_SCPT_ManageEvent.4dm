//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_SCPT_ManageEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_KeyPosition; $_l_SelectedRow; $_l_TableNumber; $2; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ClickedObject; $_Ptr_KeyField; $_ptr_LbArea; $_Ptr_ThisColumnArray; $1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SCPT_ManageEvent")

// LB_ManageEvent
// 22/06/06 pb
// this is called when a click has occurred within a Listbox object
// parameters:
//          $1 =  pointer to the array of pointers for the object
//          $2 = the event
//          $3 = pointer to the object that was clicked


$_ptr_LbArea:=$1->{1}
RESOLVE POINTER:C394($_ptr_LbArea; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=$2
$_ptr_ClickedObject:=$3
//$_l_SelectedRow:=AL_GetLine (SD_l_ALQ)
//$_l_SelectedRow:=SD_LB_Items
$_l_SelectedRow:=$_ptr_LbArea->
//$_ptr_LbArea:=CONT_aPtr_LBSetup{1}
//$_ptr_ArrayFieldPointers:=CONT_aPtr_LBSetup{2}
$_ptr_ArrayFieldPointers:=$1->{2}
//$_ptr_LBTable:=CONT_aPtr_LBSetup{7}

//$_Ptr_KeyField:=CONT_aPtr_LBSetup{8}
$_Ptr_KeyField:=$1->{8}
//$_ptr_ArrayReferences:=CONT_aPtr_LBSetup{9}

//Case of
//: ($_l_event=On Plug in Area )

Case of 
		
	: ($_l_event=On Double Clicked:K2:5)  // Double clicked
		Case of 
			: ($_t_VariableName="SD_LB_Items")
				SD_l_RecNeedssaving:=1
				SD_l_EditingDiaryRecord:=1
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				$_ptr_ArrayofArrayPointers:=CONT_aPtr_LBSetup{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				LBi_DiaryItemView($_ptr_LbArea; True:C214; $_Ptr_ThisColumnArray->{$_l_SelectedRow})
				
		End case 
		
		
	: ($_l_event=On Clicked:K2:4)  // clicked
		
		If ($_l_SelectedRow>0)
			Case of 
				: ($_t_VariableName="SD_LB_Items")
					$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
					$_ptr_ArrayofArrayPointers:=CONT_aPtr_LBSetup{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
					//QUERY([DIARY];[DIARY]Diary Code=$_Ptr_ThisColumnArray->{$_l_SelectedRow})
					LBi_DiaryItemView($_ptr_LbArea; False:C215; $_Ptr_ThisColumnArray->{$_l_SelectedRow})
			End case 
			//SD_EventItemData (-[DIARY]x_ID)
		End if 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("LBi_SCPT_ManageEvent"; $_t_oldMethodName)