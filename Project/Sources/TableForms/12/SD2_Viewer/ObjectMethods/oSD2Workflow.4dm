If (False:C215)
	//object Name: [DIARY]SD2_Viewer.oSD2Workflow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(LB_at_ConfigureSD2;0)
	C_LONGINT:C283($_l_ClickedColumn; $_l_CurrentWinRefOLD; $_l_event; $_l_FieldNumber; $_l_KeyPosition; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn; LB_SetMode; SD2_l_InfoColumn; SD2_l_ThreadColumn)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_ColumnVariable; $_t_oldMethodName; $_t_VariableName; SD2_t_MiniDiarycode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Viewer.oSD2Workflow"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		//sort
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->SD_lb_Workflow; ""; $_t_VariableName)
		LBi_AreaScript(->SD2_aptr_ListControl; 1; [DIARY:12]Diary_Code:3; ->LB_at_ConfigureSD2; $_l_Row; $_t_VariableName; "SD2_LBI_Items"; $_l_CurrentSortColumn)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_event=On Clicked:K2:4)
			//single click select-double enter
			LB_SetMode:=1
		Else 
			LB_SetMode:=2
		End if 
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnVariable; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD_lb_Workflow; $_t_ColumnVariable)
		
		Case of 
			: ($_l_ClickedColumn=SD2_l_ThreadColumn)
				
			: ($_l_ClickedColumn=SD2_l_InfoColumn)
				$_l_Row:=Self:C308->
				If ($_l_Row>0)
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					// only open a type 34 on osx
					WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
					$_Ptr_KeyField:=SD2_aptr_ListControl{8}
					$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
					$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
					If ($_l_KeyPosition>0)
						$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
						SD2_t_MiniDiarycode:=$_Ptr_ThisColumnArray->{$_l_Row}
						
						DIALOG:C40([USER:15]; "DiaryMiniView")
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					End if 
				End if 
				
				
				
			Else 
				LBi_AreaScript(->SD2_aptr_ListControl; 1; [DIARY:12]Diary_Code:3; ->LB_at_ConfigureSD2; $_l_Row; $_t_VariableName; "SD2_LBI_Items")
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ:SD2_Viewer,SD_lb_Workflow"; $_t_oldMethodName)
