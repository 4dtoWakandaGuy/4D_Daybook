//%attributes = {}
If (False:C215)
	//Project Method Name:      GenFindByRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_RelationFound)
	C_LONGINT:C283($_l_FieldIndex; $_l_OneField; $_l_OneTable; $_l_RecordsIndex; $_l_RecordsinSelection; $_l_SizeofArray; $_l_TableNumber; $_l_TableNumber2; $1; $3)
	C_POINTER:C301($_ptr_ArrayElement; $_ptr_ArrayElement2; $_ptr_Field; $_ptr_Field2; $_ptr_Table; $_ptr_Table2; $2; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GenFindByRelation")

//NG Jabuary 2008 this method will find a related selection of records using various mean to get there
//GenFindByRelation
//$1=Table number of table you wish to relate to
//$2 the preferred field you wish to related to--pass 0 if none
//$3=Table number of  the table you wish to find a related selection in
//$4=the 'preffered field in the table of $2 you wish that relation to 'belong' to(optional)
//TRACE
If (Count parameters:C259>=4)
	$_ptr_Table:=Table:C252($1)
	$_ptr_Field2:=$2->{$3}
	$_l_TableNumber2:=Table:C252($_ptr_Field2)
	//$_ptr_Table2:=Table($2->{$3})< Nasty nasty nasty why did i do that !!
	
	COPY NAMED SELECTION:C331($_ptr_Table->; "$CurrentSelection")
	$_bo_RelationFound:=False:C215
	For ($_l_FieldIndex; 1; Get last field number:C255($_ptr_Table))
		$_l_TableNumber:=Table:C252($_ptr_Table)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
		GET RELATION PROPERTIES:C686($_ptr_Field; $_l_OneTable; $_l_OneField)
		$_ptr_ArrayElement:=$4->{$3}  //moved from inside for loop - kmw 18/06/08
		$_ptr_ArrayElement2:=$2->{$3}  //moved from inside for loop - kmw 18/06/08
		UTI_ArrayClear($_ptr_ArrayElement)  //Resize array to 0 before appending - kmw 18/06/08
		If ($_l_OneTable=$_l_TableNumber2)  //the relation is to the table we want.
			USE NAMED SELECTION:C332("$CurrentSelection")
			$_l_RecordsinSelection:=Records in selection:C76($_ptr_Table->)
			$_ptr_Field2:=Field:C253($_l_OneTable; $_l_OneField)
			$_ptr_Table2:=Table:C252($_l_OneTable)
			
			
			UTI_ArrayClear($_ptr_ArrayElement)  //Resize array to 0 before appending - kmw 18/06/08
			For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
				QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_ptr_Field->)
				//$_ptr_ArrayElement:=$4->{$3}`moved to outside for loop - kmw 18/06/08
				//$_ptr_ArrayElement2:=$2->{$3}`moved to outside for loop - kmw 18/06/08
				APPEND TO ARRAY:C911($_ptr_ArrayElement->; $_ptr_ArrayElement2->)
				NEXT RECORD:C51($_ptr_Table->)
			End for 
			$_bo_RelationFound:=True:C214
			$_l_FieldIndex:=999999
		End if 
	End for 
	If (Not:C34($_bo_RelationFound))
		//well then we have to assume we have a relation to a many table(we will take the first record of any selection?
		//TRACE
		$_ptr_Field2:=$2->{$3}
		GET RELATION PROPERTIES:C686($_ptr_Field2; $_l_OneTable; $_l_OneField)
		$_ptr_ArrayElement:=$4->{$3}  //moved from inside for loop - kmw 18/06/08
		$_ptr_ArrayElement2:=$2->{$3}  //moved from inside for loop - kmw 18/06/08
		UTI_ArrayClear($_ptr_ArrayElement)  //Resize array to 0 before appending - kmw 18/06/08
		If ($_l_OneTable=$1)  //Relation is to our core table
			$_ptr_Field2:=$2->{$3}
			$_ptr_Field:=Field:C253($_l_OneTable; $_l_OneField)
			//``
			USE NAMED SELECTION:C332("$CurrentSelection")
			$_l_RecordsinSelection:=Records in selection:C76($_ptr_Table->)
			$_ptr_Field2:=Field:C253($_l_OneTable; $_l_OneField)
			$_ptr_Table2:=Table:C252($_l_OneTable)
			If (Size of array:C274($_ptr_ArrayElement->)>0)
				$_l_SizeofArray:=Size of array:C274($_ptr_ArrayElement->)
				DELETE FROM ARRAY:C228($_ptr_ArrayElement->; 1; $_l_SizeofArray)
			End if 
			For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
				QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_ptr_Field->)
				//$_ptr_ArrayElement:=$4->{$3}`moved to outside for loop - kmw 18/06/08
				//$_ptr_ArrayElement2:=$2->{$3}`moved to outside for loop - kmw 18/06/08
				APPEND TO ARRAY:C911($_ptr_ArrayElement->; $_ptr_ArrayElement2->)
				NEXT RECORD:C51($_ptr_Table->)
			End for 
			
			//```
			$_bo_RelationFound:=True:C214
		End if 
		If ($_bo_RelationFound=False:C215)
			$_ptr_Table2:=Table:C252($_l_TableNumber2)
			
			$_ptr_ArrayElement:=$4->{$3}  //moved from inside for loop - kmw 18/06/08
			$_ptr_ArrayElement2:=$2->{$3}  //moved from inside for loop - kmw 18/06/08
			UTI_ArrayClear($_ptr_ArrayElement)  //Resize array to 0 before appending - kmw 18/06/08
			For ($_l_FieldIndex; 1; Get last field number:C255($_ptr_Table2))
				$_ptr_Field2:=Field:C253($_l_TableNumber2; $_l_FieldIndex)
				GET RELATION PROPERTIES:C686($_ptr_Field2; $_l_OneTable; $_l_OneField)
				If ($_l_OneTable=$1)  //Relation is to our core table
					$_ptr_Field2:=$2->{$3}
					$_ptr_Field:=Field:C253($_l_OneTable; $_l_OneField)
					USE NAMED SELECTION:C332("$CurrentSelection")
					$_l_RecordsinSelection:=Records in selection:C76($_ptr_Table->)
					$_ptr_Field2:=Field:C253($_l_OneTable; $_l_OneField)
					$_ptr_Table2:=Table:C252($_l_OneTable)
					//Selection To array(
					For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
						QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_ptr_Field->)
						//$_ptr_ArrayElement:=$4->{$3}`moved to outside for loop - kmw 18/06/08
						//$_ptr_ArrayElement2:=$2->{$3}`moved to outside for loop - kmw 18/06/08
						APPEND TO ARRAY:C911($_ptr_ArrayElement->; $_ptr_ArrayElement2->)
						NEXT RECORD:C51($_ptr_Table->)
					End for 
					
				End if 
			End for 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("GenFindByRelation"; $_t_oldMethodName)