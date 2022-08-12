If (False:C215)
	//object Name: [USER]List_PropertiesManager.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 22:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(AA_abo_Tick;0)
	//ARRAY LONGINT(AA_al_ListPropertiesNUM;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	//ARRAY TEXT(AA_at_2DListPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_ListPropertiesSTR;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_BOOLEAN:C305(AA_bo_SaveProperties)
	C_LONGINT:C283($_l_PropertyIndex; $_l_PropertyRow; AA_l_BSaveProperty; AA_l_ListPropertyID; AA_l_PropertyListID)
	C_TEXT:C284($_t_oldMethodName; AA_t_ListProperty)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_PropertiesManager.Variable1"; Form event code:C388)
If (AA_t_ListProperty#"")
	CONFIRM:C162("Save "+AA_t_ListProperty; "Yes"; "No")
	If (OK=1)
		If (AA_l_ListPropertyID=0)
			INSERT IN ARRAY:C227(AA_al_TickMark; Size of array:C274(AA_al_TickMark)+1; 1)
			INSERT IN ARRAY:C227(AA_abo_Tick; Size of array:C274(AA_abo_Tick)+1; 1)
			//INSERT IN ARRAY(AA_at_ListProperties;Size of array(AA_at_ListProperties)+1;1)
			INSERT IN ARRAY:C227(AA_at_PropertiesListProperties; Size of array:C274(AA_at_PropertiesListProperties)+1; 1)
			
			INSERT IN ARRAY:C227(AA_at_2DListPropertyTypes; Size of array:C274(AA_at_2DListPropertyTypes)+1)
			INSERT IN ARRAY:C227(AA_al_ListPropertiesNUM; Size of array:C274(AA_al_ListPropertiesNUM)+1)
			INSERT IN ARRAY:C227(AA_at_ListPropertiesSTR; Size of array:C274(AA_at_ListPropertiesSTR)+1)
			APPEND TO ARRAY:C911(AA_at_2DListPropertyTypes{Size of array:C274(AA_at_2DListPropertyTypes)}; "SUBLIST")
			APPEND TO ARRAY:C911(AA_al_ListPropertyIDs; -Size of array:C274(AA_al_ListPropertyIDs))
			APPEND TO ARRAY:C911(AA_at_ListProperties; AA_t_ListProperty)
		Else 
			$_l_PropertyRow:=Find in array:C230(AA_al_ListPropertyIDs; AA_l_ListPropertyID)
			AA_at_ListProperties{$_l_PropertyRow}:=AA_t_ListProperty
		End if 
		AA_l_ListPropertyID:=0
		AA_t_ListProperty:=""
		OBJECT SET VISIBLE:C603(AA_t_ListProperty; False:C215)
		OBJECT SET VISIBLE:C603(AA_l_BSaveProperty; False:C215)
	Else 
		AA_l_ListPropertyID:=0
		AA_t_ListProperty:=""
		OBJECT SET VISIBLE:C603(AA_t_ListProperty; False:C215)
		OBJECT SET VISIBLE:C603(AA_l_BSaveProperty; False:C215)
	End if 
End if 
//now save the list entries
For ($_l_PropertyIndex; 1; Size of array:C274(AA_al_ListPropertyIDs))
	If (AA_al_ListPropertyIDs{$_l_PropertyIndex}<0)
		//this item does not exist
		AA_al_ListPropertyIDs{$_l_PropertyIndex}:=AA_ListAddItembyID(AA_l_PropertyListID; AA_at_ListProperties{$_l_PropertyIndex})
	End if 
End for 
AA_bo_SaveProperties:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ:List_PropertiesManager,Bsave"; $_t_oldMethodName)
