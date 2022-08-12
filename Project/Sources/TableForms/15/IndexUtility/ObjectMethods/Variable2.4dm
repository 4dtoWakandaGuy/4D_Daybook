If (False:C215)
	//object Name: [USER]IndexUtility.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	C_BOOLEAN:C305($_bo_Enterable; $_bo_Expanded; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>CIM_vlhlList; $_l_CountListItems; $_l_FieldNumber; $_l_Icon; $_l_Indexed; $_l_ItemReference; $_l_ListItemIndex; $_l_Style; $_l_SublistID; $_l_TableNumber; $_l_WindowReferenceRow)
	C_LONGINT:C283($_l_WindowRow; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_FieldName; $_t_indexName; $_t_ItemText; $_t_Message; $_t_oldMethodName; $_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].IndexUtility.Variable2"; Form event code:C388)

$_l_CountListItems:=Count list items:C380(<>CIM_vlhlList)
$_l_Indexed:=0
VER_CENTERWINDOW(252; 77; 1)

$_t_Message:="Rebuilding indexes ... "+Char:C90(13)+"please be patient! "
$_t_Message:=$_t_Message+Char:C90(13)+"This is hard work!"
MESSAGE:C88($_t_Message)
For ($_l_ListItemIndex; 1; $_l_CountListItems)
	GET LIST ITEM:C378(<>CIM_vlhlList; $_l_ListItemIndex; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	
	If ($_l_ItemReference>1000)
		GET LIST ITEM PROPERTIES:C631(<>CIM_vlhlList; $_l_ItemReference; $_bo_Enterable; $_l_Style; $_l_Icon)
		
		If ($_l_Style=Bold:K14:2)
			
			$_l_Indexed:=$_l_Indexed+1
			$_l_TableNumber:=$_l_ItemReference/1000
			$_l_FieldNumber:=$_l_ItemReference%1000
			If (Is field number valid:C1000($_l_TableNumber; $_l_FieldNumber))
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				$_t_TableName:=Table name:C256($_Ptr_Table)
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_t_FieldName:=Field name:C257($_ptr_Field)
				$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
				ARRAY POINTER:C280($_aptr_FieldsArray; 1)
				$_aptr_FieldsArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				SET INDEX:C344($_ptr_Field->; False:C215)
				$_t_indexName:=$_t_TableName+$_t_FieldName+"indx"
				$_t_indexName:=Replace string:C233($_t_indexName; " "; "")
				CREATE INDEX:C966($_Ptr_Table->; $_aptr_FieldsArray; Default index type:K58:2; $_t_indexName)
				//SET INDEX($_ptr_Field->;True)
			End if 
		End if   // bold
	End if   // it's a sub-item
End for 

CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 

Case of 
	: ($_l_Indexed=0)
		ALERT:C41("No fields have been selected for indexing!")
	: ($_l_Indexed=1)
		ALERT:C41(String:C10($_l_Indexed)+" field has been re-indexed.")
	Else 
		ALERT:C41(String:C10($_l_Indexed)+" fields have been re-indexed.")
End case 
ERR_MethodTrackerReturn("OBJ:IndexUtility,bReindex"; $_t_oldMethodName)
