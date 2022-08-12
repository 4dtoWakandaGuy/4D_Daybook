//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_LoadSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2010 00:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Editable; $_bo_TableBased)
	C_LONGINT:C283($_l_AreaTypeValue; $_l_AssociatedTablenumber; $_l_Index; $_l_LockToColumn; $_l_SortFieldNumber; $_l_TableNumber; $3; $4; LB_l_LastRow)
	C_POINTER:C301($_ptr_AreaType; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_Ptr_KeyField; $_ptr_LBParentTable; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup)
	C_POINTER:C301($_ptr_ParentTableKeyField; $1)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_TypeofReflow; $_t_Unique; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadSetup")
//ALLoadSetup - used from ß procs to Load Arrays & Do Setup
//C_LONGINT($3)  //NG SEPT 2006-TO ALLOW FOR ADDITIONAL FOOTER AREAS
LB_l_LastRow:=0




If (OK=1)
	$_ptr_ListboxSetup:=$1
	$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
	$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
	$_ptr_ParentTableKeyField:=$_ptr_ListboxSetup->{11}
	$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
	$_l_AreaTypeValue:=1
	//TRACE
	$_ptr_AreaType:=->$_l_AreaTypeValue
	
	//`TRACE
	$_l_AssociatedTablenumber:=-1
	If (Not:C34(Is nil pointer:C315($_ptr_ListboxArea)))
		LISTBOX GET TABLE SOURCE:C1014($_ptr_ListboxArea->; $_l_AssociatedTablenumber)
		
	End if 
	If (Table:C252($_ptr_LBTable)>0)
		//$_l_AssociatedTablenumber:=Table($_ptr_LBTable)
		
	End if 
	
	$_bo_TableBased:=($_l_AssociatedTablenumber>0)
	
	
	If (Size of array:C274($_ptr_ListboxSetup->)>=19)
		$_ptr_AreaType->:=Num:C11($_bo_TableBased)+2  // 3 for table based 2 for array based-will get changed to -1 if array based on arrays
		
		//$_ptr_AreaType:=$_ptr_ListboxSetup->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
	End if 
	If ((Type:C295($_ptr_ParentTableKeyField->))=9)
		$_t_Unique:=String:C10($_ptr_ParentTableKeyField->)
	Else 
		$_t_Unique:=$_ptr_ParentTableKeyField->
	End if 
	If (Count parameters:C259>=2)
		$_t_TypeofReflow:=$2
	Else 
		$_t_TypeofReflow:="B"
	End if 
	
	//if is a page turn, have to work out if the processing is needed
	//by finding out if the array elem 11 contains the current record's unique field
	If (($_t_TypeofReflow#"P") | ($_t_Unique#$_ptr_ArrayReferences->{11})) | (True:C214)
		If ($_ptr_AreaType-><3)  //if the area is field based there is no need to load the records to the arrays the on screen values are fields
			If ($_ptr_ArrayReferences->{8}="")  //if main file
				If (Records in selection:C76($_ptr_LBTable->)>0)  //only load arrays if are records
					
					
					
					If ($_ptr_AreaType->#3)
						LBi_LoadArrays($_ptr_ListboxSetup->{2}; $_ptr_ListboxSetup->{3}; True:C214; $_ptr_LBTable)
						LBi_LoadFmul($_ptr_ListboxSetup)
					End if 
				Else 
					If (Size of array:C274(($_ptr_ArrayofArrayPointers->{1})->)>0)  //but if not, clear the arrays if filled
						
						If ($_ptr_AreaType->#3)
							LBi_DelAllElem($_ptr_ListboxSetup)
						End if 
					End if 
				End if 
				//`here we can do the sort
				
			Else 
				$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
				Case of 
					: (Type:C295($_Ptr_KeyField->)=Is subtable:K8:11)  //`THis will never happen now
						
						//LBi_LoadArrSub ($_ptr_ListboxSetup)
					: (Type:C295($_Ptr_KeyField->)=Is BLOB:K8:12)
						
						LBI_LoadArrBlob($_ptr_ListboxSetup)
				End case 
				
				
			End if 
		End if 
		If (($_t_TypeofReflow="B") | (($_t_TypeofReflow="P") & ($_ptr_ArrayReferences->{11}=""))) | (True:C214)
			LBi_inclSetup($_ptr_ListboxSetup)
		End if 
		If (Count parameters:C259>2)
			LBi_LoadFtrs($_ptr_ListboxSetup; $3)
		Else 
			LBi_LoadFtrs($_ptr_ListboxSetup)
		End if 
		//TRACE
		
		
		$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
		$_l_LockToColumn:=0
		$_l_LockToColumn:=Find in array:C230($_ptr_ArrayofColumnLockFlags->; True:C214)
		If (False:C215)
			For ($_l_Index; 1; Size of array:C274($_ptr_ArrayofColumnLockFlags->))
				If ($_ptr_ArrayofColumnLockFlags->{$_l_Index})
					$_l_LockToColumn:=$_l_Index
				End if 
			End for 
		End if 
		
		
		$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
		$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
		$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
		
		LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListboxSetup)
		If ($_l_LockToColumn>0)
			$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
			LISTBOX SET LOCKED COLUMNS:C1151($_ptr_ListboxArea->; $_l_LockToColumn)
		End if 
		If (Count parameters:C259>=4)
			$_bo_Editable:=($4=0)
			If (Not:C34($_bo_Editable))
				For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
					$_ptr_EnterabilityArray->{$_l_Index}:=False:C215
				End for 
			End if 
		End if 
		
		$_ptr_ArrayReferences->{11}:=$_t_Unique
	End if 
End if 
ERR_MethodTrackerReturn("LBi_LoadSetup"; $_t_oldMethodName)