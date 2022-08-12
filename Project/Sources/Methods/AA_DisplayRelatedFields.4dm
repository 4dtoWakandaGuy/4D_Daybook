//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_DisplayRelatedFields
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(AA_abo_CheckMark;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	//ARRAY LONGINT(WS_al_AssociateFields;0)
	//ARRAY LONGINT(WS_al_AssociateTables;0)
	//ARRAY TEXT(WS_at_AssociateFIeldNames;0)
	//ARRAY TEXT(WS_at_UpdateMethod;0)
	C_BOOLEAN:C305($0; AA_bo_SaveAssociation)
	C_LONGINT:C283($_l_Count; $_l_CurrentWinRefOLD; $_l_Element; $_l_FieldPosition; $_l_Index; $_l_TablePosition; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_Ptr_array1; $_Ptr_array2; $_Ptr_array3; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_DisplayRelatedFields")

//$1 is pointer to  array of table numbers
//$2 is pointer to array of field numbers
//$3 is pointer to array of field names

$0:=False:C215
If (Count parameters:C259>=3)
	$_Ptr_array1:=$1
	$_Ptr_array2:=$2
	
	ARRAY LONGINT:C221(WS_al_AssociateTables; 0)
	ARRAY LONGINT:C221(WS_al_AssociateFields; 0)
	ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 0)
	ARRAY LONGINT:C221(WS_al_AssociateTables; 4)
	ARRAY LONGINT:C221(WS_al_AssociateFields; 4)
	ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 4)
	ARRAY TEXT:C222(WS_at_UpdateMethod; 4)
	
	ARRAY LONGINT:C221(AA_al_TickMark; 0)
	WS_al_AssociateTables{1}:=Table:C252(->[COMPANIES:2])
	WS_al_AssociateFields{1}:=Field:C253(->[COMPANIES:2]Record_State:62)
	WS_at_AssociateFIeldNames{1}:=Table name:C256(Table:C252(WS_al_AssociateTables{1}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{1}; WS_al_AssociateFields{1}))
	WS_al_AssociateTables{2}:=Table:C252(->[CONTACTS:1])
	WS_al_AssociateFields{2}:=Field:C253(->[CONTACTS:1]Title:3)
	WS_at_AssociateFIeldNames{2}:=Table name:C256(Table:C252(WS_al_AssociateTables{2}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{2}; WS_al_AssociateFields{2}))
	WS_al_AssociateTables{3}:=Table:C252(->[CONTACTS:1])
	WS_al_AssociateFields{3}:=Field:C253(->[CONTACTS:1]Qualifications:13)
	WS_at_AssociateFIeldNames{3}:=Table name:C256(Table:C252(WS_al_AssociateTables{3}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{3}; WS_al_AssociateFields{3}))
	WS_al_AssociateTables{4}:=Table:C252(->[INFORMATION:55])
	WS_al_AssociateFields{4}:=Field:C253(->[INFORMATION:55]QualityID:14)
	WS_at_AssociateFIeldNames{4}:=Table name:C256(Table:C252(WS_al_AssociateTables{4}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{4}; WS_al_AssociateFields{4}))
	WS_at_UpdateMethod{4}:="QV_ValidateGroups"
	
	//```````
	ARRAY LONGINT:C221(AA_al_TickMark; Size of array:C274(WS_al_AssociateTables))
	For ($_l_Index; 1; Size of array:C274($_Ptr_array1->))
		$_l_TablePosition:=Find in array:C230(WS_al_AssociateTables; $_Ptr_array1->{$_l_Index})
		If ($_l_TablePosition>0)  //it should be
			$_l_FieldPosition:=Find in array:C230(WS_al_AssociateFields; $_Ptr_array2->{$_l_Index}; $_l_TablePosition)
			If ($_l_FieldPosition>0)
				//it should be
				AA_al_TickMark{$_l_FieldPosition}:=1
			End if 
			
		End if 
	End for 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([USER:15]; "List_associationManager")
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	For ($_l_Index; 1; Size of array:C274(AA_al_TickMark))
		AA_al_TickMark{$_l_Index}:=Num:C11(AA_abo_CheckMark{$_l_Index})
		
	End for 
	$0:=False:C215
	If (Count parameters:C259>=3)  // 3 paramters must be passed to save it
		$_Ptr_array3:=$3
		If (AA_bo_SaveAssociation)
			ARRAY LONGINT:C221($_Ptr_array2->; 0)
			ARRAY LONGINT:C221($_Ptr_array1->; 0)
			ARRAY TEXT:C222($_Ptr_array3->; 0)
			$_l_Count:=0
			For ($_l_Index; 1; Size of array:C274(AA_al_TickMark))
				If (AA_al_TickMark{$_l_Index}=1)
					$_l_Count:=$_l_Count+1
				End if 
			End for 
			If ($_l_Count>0)
				ARRAY LONGINT:C221($_Ptr_array2->; $_l_Count)
				ARRAY LONGINT:C221($_Ptr_array1->; $_l_Count)
				ARRAY TEXT:C222($_Ptr_array3->; $_l_Count)
				$_l_Element:=0
				For ($_l_Index; 1; Size of array:C274(AA_al_TickMark))
					If (AA_al_TickMark{$_l_Index}=1)
						$_l_Element:=$_l_Element+1
						$_Ptr_array1->{$_l_Element}:=WS_al_AssociateTables{$_l_Index}
						$_Ptr_array2->{$_l_Element}:=WS_al_AssociateFields{$_l_Index}
						$_Ptr_array3->{$_l_Element}:=WS_at_AssociateFIeldNames{$_l_Index}
					End if 
				End for 
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_DisplayRelatedFields"; $_t_oldMethodName)
