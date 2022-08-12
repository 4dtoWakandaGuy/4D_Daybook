If (False:C215)
	//object Name: [JOB_TYPES]types_in.Pict_Properties
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(JT_al_JTYPEPropertiesNUM;0;0)
	//ARRAY LONGINT(JT_al_LinkedTable;0)
	//ARRAY LONGINT(JT_al_SaleTypeID;0)
	//ARRAY TEXT(JT_at_JTYPEProperties;0;0)
	//ARRAY TEXT(JT_at_JTYPEPropertiesNAM;0;0)
	//ARRAY TEXT(JT_at_SalesProjectionPROPS;0)
	//ARRAY TEXT(JT_at_SaleType;0)
	C_LONGINT:C283($_l_FIeldNumber; $_l_Index; $_l_ListID; $_l_ListItemID; $_l_RestrictionRow; $_l_SalesTypeRow; $_l_TableNumber; JT_l_ResListID; JT_l_TableRestrictionID)
	C_TEXT:C284($_t_oldMethodName; JT_t_SaleType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_TYPES].types_in.Pict_Properties"; Form event code:C388)
If (JT_at_SaleType>0)
	If (JT_al_SaleTypeID{JT_at_SaleType}>0)
		JT_t_SaleType:=JT_at_SaleType{JT_at_SaleType}
		[JOB_TYPES:65]ProjectedSaleTypeID:11:=JT_al_SaleTypeID{JT_at_SaleType}
	Else 
		
		//new entry
		$_l_ListItemID:=AA_ListAddItem(->[SALES_PROJECTION:113]Class_ID:2)
		If ($_l_ListItemID>0)
			//we need to put the table restriction on and save that then re-load
			If (False:C215)
				AA_ListItemAddProperty($_l_ListItemID; JT_l_ResListID; JT_l_TableRestrictionID; "Table Restriction")
				
			End if 
			
			ARRAY TEXT:C222(JT_at_SalesProjectionPROPS; 0)
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			$_l_FIeldNumber:=Field:C253(->[JOBS:26]Job_Type:21)
			
			$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FIeldNumber; "Sales Projection Types")
			ARRAY TEXT:C222(JT_at_SalesProjectionPROPS; 0)
			ARRAY TEXT:C222(JT_at_JTYPEProperties; 0; 0)
			ARRAY LONGINT:C221(JT_al_JTYPEPropertiesNUM; 0; 0)
			ARRAY TEXT:C222(JT_at_JTYPEPropertiesNAM; 0; 0)
			
			AA_LoadListbyID($_l_ListID; ->JT_at_SaleType; ->JT_al_SaleTypeID; True:C214; ->JT_at_SalesProjectionPROPS; ->JT_at_JTYPEProperties; ->JT_al_JTYPEPropertiesNUM; ->JT_at_JTYPEPropertiesNAM)
			ARRAY LONGINT:C221(JT_al_LinkedTable; Size of array:C274(JT_at_SaleType))
			For ($_l_Index; 1; Size of array:C274(JT_at_SaleType))
				$_l_RestrictionRow:=Find in array:C230(JT_at_JTYPEProperties{$_l_Index}; "TABLE RESTRICTION")
				If ($_l_RestrictionRow>0)
					JT_al_LinkedTable{$_l_Index}:=JT_al_JTYPEPropertiesNUM{$_l_Index}{$_l_RestrictionRow}
				End if 
			End for 
			
			
			$_l_SalesTypeRow:=Find in array:C230(JT_al_SaleTypeID; $_l_ListItemID)
			If ($_l_SalesTypeRow>0)
				JT_t_SaleType:=JT_at_SaleType{$_l_SalesTypeRow}
				[JOB_TYPES:65]ProjectedSaleTypeID:11:=JT_al_SaleTypeID{$_l_SalesTypeRow}
			Else 
				JT_t_SaleType:=""
				[JOB_TYPES:65]ProjectedSaleTypeID:11:=0
			End if 
			
		End if 
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ [JOB_TYPES].types_in.Pict_Properties"; $_t_oldMethodName)
