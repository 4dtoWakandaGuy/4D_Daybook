//%attributes = {}

If (False:C215)
	//Project Method Name:      LL_LoadFieldNamePrefs
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
	//ARRAY LONGINT(LL_al_FieldAccess;0;0)
	//ARRAY LONGINT(LL_al_FieldNos;0;0)
	//ARRAY LONGINT(LL_al_FieldsIndex;0)
	//ARRAY LONGINT(LL_al_TableAccess;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY TEXT(LL_at_FieldNames;0;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_Load; $_bo_Modified; LL_bo_ValuesLoaded)
	C_LONGINT:C283($_l_Element; $_l_FIeldElement; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_LastFieldNumber; $_l_LoadTable; $_l_Offset; $_l_Size; $_l_TableIndex; $1)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LL_LoadFieldNamePrefs")


//LL_al_TableAccess=-1=Designer only
//LL_al_TableAccess=1=Administrators
//LL_al_TableAccess=2=Managers
//LL_al_TableAccess=3=All users  (same values for fields)
//Note that we are not havingdifferent settings for different users

$_t_oldMethodName:=ERR_MethodTracker("LL_LoadFieldNamePrefs")
If (Count parameters:C259>=1)
	LL_bo_ValuesLoaded:=False:C215
End if 


If (Not:C34(LL_bo_ValuesLoaded))
	ARRAY TEXT:C222(LL_at_TableNames; 0)
	ARRAY LONGINT:C221(LL_al_TableIDs; 0)
	ARRAY LONGINT:C221(LL_al_TableAccess; 0)  // tells us who can access the table
	ARRAY LONGINT:C221(LL_al_FieldsIndex; 0)  //Gives us the row of the field names to display
	//```
	ARRAY LONGINT:C221(LL_al_FieldNos; 0; 0)
	ARRAY TEXT:C222(LL_at_FieldNames; 0; 0)
	ARRAY LONGINT:C221(LL_al_FieldAccess; 0; 0)
	
	//load
	$_bo_Modified:=False:C215
	
	While (Semaphore:C143("LoadingTablePrefs"))
		DelayTicks(2)
	End while 
	$_l_Offset:=0
	$_l_Size:=0
	//make sure all arrays are the same size
	ARRAY TEXT:C222(LL_at_TableNames; 0)
	ARRAY LONGINT:C221(LL_al_TableIDs; 0)
	ARRAY LONGINT:C221(LL_al_TableAccess; 0)  // tells us who can access the table
	ARRAY LONGINT:C221(LL_al_FieldNos; 0; 0)
	ARRAY TEXT:C222(LL_at_FieldNames; 0; 0)
	ARRAY LONGINT:C221(LL_al_FieldAccess; 0; 0)
	$_l_Element:=0
	
	$_l_Size:=Size of array:C274(LL_at_TableNames)
	
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			$_l_Element:=$_l_Element+1
			$_t_TableName:=Table name:C256($_l_TableIndex)
			GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_FieldInvisible)
			APPEND TO ARRAY:C911(LL_at_TableNames; $_t_TableName)
			APPEND TO ARRAY:C911(LL_al_TableIDs; $_l_TableIndex)
			APPEND TO ARRAY:C911(LL_al_TableAccess; 1)
			INSERT IN ARRAY:C227(LL_al_FieldNos; Size of array:C274(LL_al_FieldNos)+1; 1)
			INSERT IN ARRAY:C227(LL_at_FieldNames; Size of array:C274(LL_at_FieldNames)+1; 1)
			INSERT IN ARRAY:C227(LL_al_FieldAccess; Size of array:C274(LL_al_FieldAccess)+1; 1)
			If ($_bo_FieldInvisible)
				LL_al_TableAccess{$_l_Element}:=-1
			Else 
				LL_al_TableAccess{$_l_Element}:=3  //all users Note this is nothing to do with module access-only about seeing the table in a pop-up
			End if 
		End if 
	End for 
	SORT ARRAY:C229(LL_at_TableNames; LL_al_TableIDs; LL_al_TableAccess)
	For ($_l_TableIndex; 1; Size of array:C274(LL_at_TableNames))
		$_l_LastFieldNumber:=Get last field number:C255(LL_al_TableIDs{$_l_TableIndex})
		$_l_FIeldElement:=0
		If (Count parameters:C259>=1)
			$_l_LoadTable:=$1
		Else 
			$_l_LoadTable:=0
		End if 
		If ($_l_LoadTable>0)
			$_bo_Load:=False:C215
			If (LL_al_TableIDs{$_l_TableIndex}=$_l_LoadTable)
				$_bo_Load:=True:C214
			End if 
		Else 
			$_bo_Load:=True:C214
		End if 
		If ($_bo_Load)
			For ($_l_FieldIndex; 1; $_l_LastFieldNumber)
				$_l_Element:=$_l_TableIndex
				
				If (Is field number valid:C1000(LL_al_TableIDs{$_l_TableIndex}; $_l_FieldIndex))
					$_l_FIeldElement:=$_l_FIeldElement+1
					$_t_FieldName:=Field name:C257(Field:C253(LL_al_TableIDs{$_l_TableIndex}; $_l_FieldIndex))
					//here we coerce the field name
					$_t_FieldName:=LL_SetHumanFieldName(LL_al_TableIDs{$_l_TableIndex}; $_l_FieldIndex; $_t_FieldName)
					GET FIELD PROPERTIES:C258(LL_al_TableIDs{$_l_TableIndex}; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
					APPEND TO ARRAY:C911(LL_al_FieldNos{$_l_Element}; $_l_FieldIndex)
					APPEND TO ARRAY:C911(LL_at_FieldNames{$_l_Element}; $_t_FieldName)
					APPEND TO ARRAY:C911(LL_al_FieldAccess{$_l_Element}; 1)
					
					If ($_bo_FieldInvisible)
						LL_al_FieldAccess{$_l_Element}{$_l_FIeldElement}:=-1
					Else 
						LL_al_FieldAccess{$_l_Element}{$_l_FIeldElement}:=3  //all users Note this is nothing to do with module access-only about seeing the table in a pop-up
					End if 
				End if 
			End for 
			SORT ARRAY:C229(LL_at_FieldNames{$_l_Element}; LL_al_FieldNos{$_l_Element}; LL_al_FieldAccess{$_l_Element})
		End if 
		
		
	End for 
	
End if 


CLEAR SEMAPHORE:C144("LoadingTablePrefs")
LL_bo_ValuesLoaded:=True:C214
ERR_MethodTrackerReturn("LL_LoadFieldNamePrefs"; $_t_oldMethodName)