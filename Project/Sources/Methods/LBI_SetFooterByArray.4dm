//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_SetFooterByArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2011 23:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_TableBased)
	C_LONGINT:C283($_l_AssociatedTableNum; $_l_FieldNumber; $_l_FooterOffset; $_l_Index; $_l_NumberofCharacters; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; $_l_TableNumber; $5)
	C_LONGINT:C283(LBI_l_FooterSet)
	C_POINTER:C301($_ptr_LabelVar; $_ptr_LabelVar2; $_Ptr_ListBox; $1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_SetFooterByArray")
//This method allows an alternative way of setting the footer values. Using an array
//$1=Pointer to the area name
//$2=Pointer to array of column numbers
//$3=pointer to array of values
//$4=pointer to array of formats
//This makes the assumtion of clearing existing settings
//$5=optional set number(for where to lots of footers are on the form
If (Count parameters:C259>=5)
	LBI_l_FooterSet:=$5
Else 
	LBI_l_FooterSet:=1
End if 
If (Count parameters:C259>=4)
	$_Ptr_ListBox:=$1
	RESOLVE POINTER:C394($_Ptr_ListBox; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	OBJECT SET VISIBLE:C603(*; "oFootRct"+$_t_VariableName; False:C215)
	$_l_FooterOffset:=0
	$_l_FooterOffset:=LB_SetFooters($_Ptr_ListBox; 1; 36; $_l_FooterOffset)  // That will set them all to invisible
	$_l_FooterOffset:=0
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	$_l_AssociatedTableNum:=-1
	If (Not:C34(Is nil pointer:C315($1)))
		LISTBOX GET TABLE SOURCE:C1014($1->; $_l_AssociatedTableNum)
	End if 
	$_bo_TableBased:=($_l_AssociatedTableNum>0)
	If (Not:C34($_bo_TableBased))
		LISTBOX GET ARRAYS:C832($_Ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		For ($_l_Index; 1; Size of array:C274($2->))
			
			$_l_FooterOffset:=LB_SetFooters($_Ptr_ListBox; 1; 1; $_l_FooterOffset; $3->{$_l_Index}; $2->{$_l_Index})
		End for 
		
		If ($_l_FooterOffset>0)
			$_l_FooterOffset:=20*(LBI_l_FooterSet-1)
			OBJECT GET COORDINATES:C663($_Ptr_ListBox->; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
			OBJECT MOVE:C664(*; "oFootRct"+$_t_VariableName; $_l_objectLeft; $_l_objectBottom; $_l_objectRight; $_l_objectBottom+13; *)
			For ($_l_Index; 1; $_l_FooterOffset)
				$_ptr_LabelVar:=Get pointer:C304("LBi_t_label"+String:C10($_l_Index+$_l_FooterOffset))
				$_ptr_LabelVar2:=Get pointer:C304("LBi_t_Value"+String:C10($_l_Index+$_l_FooterOffset))
				$_l_NumberofCharacters:=Length:C16($_ptr_LabelVar->)
				OBJECT MOVE:C664($_ptr_LabelVar->; $_l_objectLeft; $_l_objectBottom+1; $_l_objectLeft+(6*$_l_NumberofCharacters); $_l_objectBottom+12; *)
				$_l_objectLeft:=$_l_objectLeft+(6*$_l_NumberofCharacters)+2
				$_l_NumberofCharacters:=Length:C16($_ptr_LabelVar2->)
				OBJECT MOVE:C664($_ptr_LabelVar2->; $_l_objectLeft; $_l_objectBottom+1; $_l_objectLeft+(6*$_l_NumberofCharacters); $_l_objectBottom+12; *)
				$_l_objectLeft:=$_l_objectLeft+(6*$_l_NumberofCharacters)+2
				
			End for 
			
		End if 
	Else 
		For ($_l_Index; 1; Size of array:C274($2->))
			
			$_l_FooterOffset:=LB_SetFooters($_Ptr_ListBox; 1; 1; $_l_FooterOffset; $3->{$_l_Index}; $2->{$_l_Index})
		End for 
		
		If ($_l_FooterOffset>0)
			$_l_FooterOffset:=20*(LBI_l_FooterSet-1)
			OBJECT GET COORDINATES:C663($_Ptr_ListBox->; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
			OBJECT MOVE:C664(*; "oFootRct"+$_t_VariableName; $_l_objectLeft; $_l_objectBottom; $_l_objectRight; $_l_objectBottom+13; *)
			For ($_l_Index; 1; $_l_FooterOffset)
				$_ptr_LabelVar:=Get pointer:C304("LBi_t_label"+String:C10($_l_Index+$_l_FooterOffset))
				$_ptr_LabelVar2:=Get pointer:C304("LBi_t_Value"+String:C10($_l_Index+$_l_FooterOffset))
				$_l_NumberofCharacters:=Length:C16($_ptr_LabelVar->)
				OBJECT MOVE:C664($_ptr_LabelVar->; $_l_objectLeft; $_l_objectBottom+1; $_l_objectLeft+(6*$_l_NumberofCharacters); $_l_objectBottom+12; *)
				$_l_objectLeft:=$_l_objectLeft+(6*$_l_NumberofCharacters)+2
				$_l_NumberofCharacters:=Length:C16($_ptr_LabelVar2->)
				OBJECT MOVE:C664($_ptr_LabelVar2->; $_l_objectLeft; $_l_objectBottom+1; $_l_objectLeft+(6*$_l_NumberofCharacters); $_l_objectBottom+12; *)
				$_l_objectLeft:=$_l_objectLeft+(6*$_l_NumberofCharacters)+2
				
			End for 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBI_SetFooterByArray"; $_t_oldMethodName)