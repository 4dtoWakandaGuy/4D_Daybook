//%attributes = {}

If (False:C215)
	//Project Method Name:      PT_SetConstants
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
	ARRAY LONGINT:C221($_al_ResID; 0)
	//ARRAY LONGINT(PG_al_PriceGroupClass;0)
	ARRAY TEXT:C222($_at_ResName; 0)
	ARRAY TEXT:C222($_at_StringList; 0)
	ARRAY TEXT:C222($_at_StringList2; 0)
	//ARRAY TEXT(PG_at_PriceGroupClassShort;0)
	C_BLOB:C604($_blb_StringBLOB; $_blb_StringBLOB2)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_offset; $_l_OK; $_l_ResourceRow; $_l_STRID)
	C_TEXT:C284($_t_DirectoryPath; $_t_DirectorySymbol; $_t_NewResourcePath; $_t_oldMethodName; $_t_StructurePath)
	C_TIME:C306($_ti_ResID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_SetConstants")

//this method will create the Constants for the Price table classes
PG_LoadPGoptions(Table:C252(->[ORDERS:24]))

$_t_oldMethodName:=ERR_MethodTracker("PT_SetConstants")
ARRAY LONGINT:C221($_al_ResID; 0)
ARRAY TEXT:C222($_at_ResName; 0)

$_bo_Update:=False:C215
If (Not:C34(Is compiled mode:C492))
	If (Application type:C494<4)
		//$_t_StructurePath:=Structure file
		$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
		$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
		$_t_DirectorySymbol:=Directory_Symbol
		$_t_NewResourcePath:=$_t_DirectoryPath+"Resources"+$_t_DirectorySymbol+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
		If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
			$_ti_ResID:=Open resource file:C497($_t_NewResourcePath)
		Else 
			
			$_ti_ResID:=_O_Create resource file:C496($_t_NewResourcePath)
		End if 
		
		RESOURCE LIST:C500("STR#"; $_al_ResID; $_at_ResName; $_ti_ResID)
		SORT ARRAY:C229($_al_ResID; $_at_ResName)
		//  $_l_STRID:=$alResID{Size of array($alResID)}+1
		// If ($_l_STRID<30001)
		$_l_STRID:=30004
		// End if
		
		RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResID)
		
		If (Size of array:C274($_al_ResID)>0)
			$_l_OK:=0
			
			$_l_ResourceRow:=Find in array:C230($_al_ResID; 15004)
			If ($_l_ResourceRow>0)
				$_l_ListID:=$_al_ResID{$_l_ResourceRow}
				$_l_OK:=1
			Else 
				For ($_l_Index; 1; Size of array:C274($_al_ResID))
					If ($_al_ResID{$_l_Index}=15004)
						$_l_OK:=1
						$_l_ListID:=$_al_ResID{$_l_Index}
						$_l_Index:=999999
					End if 
				End for 
			End if 
		Else 
			$_l_OK:=0
		End if 
		ARRAY TEXT:C222($_at_StringList; Size of array:C274(PG_at_PriceGroupClassShort))
		ARRAY TEXT:C222($_at_StringList2; 0)
		For ($_l_Index; 1; Size of array:C274($_at_StringList))
			$_at_StringList{$_l_Index}:=PG_at_PriceGroupClassShort{$_l_Index}+":"+String:C10(PG_al_PriceGroupClass{$_l_Index})+":L"
		End for 
		SET BLOB SIZE:C606($_blb_StringBLOB; 0)
		SET BLOB SIZE:C606($_blb_StringBLOB2; 0)
		If ($_l_OK=0)  //need to build list
			_O_SET RESOURCE:C509("4DK#"; 15004; $_blb_StringBLOB; $_ti_ResID)
			_O_SET RESOURCE NAME:C514("4DK#"; 15004; "Sales Price Classes"; $_ti_ResID)
			RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResID)
			$_l_ListID:=15004
		Else 
			//load the list in case it needs updating
		End if 
		STRING LIST TO ARRAY:C511($_l_STRID; $_at_StringList2; $_ti_ResID)
		If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
			$_l_offset:=0
			_O_ARRAY TO STRING LIST:C512($_at_StringList; $_l_STRID; $_ti_ResID)
			//the above is written temporararily
			GET RESOURCE:C508("STR#"; $_l_STRID; $_blb_StringBLOB2; $_ti_ResID)
			_O_SET RESOURCE:C509("4DK#"; $_l_ListID; $_blb_StringBLOB2; $_ti_ResID)
			_O_SET RESOURCE NAME:C514("4DK#"; 15004; "Sales Price  Classes"; $_ti_ResID)
			$_bo_Update:=True:C214
			
		Else 
			For ($_l_Index; 1; Size of array:C274($_at_StringList2))
				If ($_at_StringList2{$_l_Index}#$_at_StringList{$_l_Index})
					$_bo_Update:=True:C214
					$_l_Index:=Size of array:C274($_at_StringList2)+1
				End if 
			End for 
			If ($_bo_Update)
				$_l_offset:=0
				_O_ARRAY TO STRING LIST:C512($_at_StringList; $_l_STRID; $_ti_ResID)
				//the above is written temporararily
				GET RESOURCE:C508("STR#"; $_l_STRID; $_blb_StringBLOB2; $_ti_ResID)
				_O_SET RESOURCE:C509("4DK#"; $_l_ListID; $_blb_StringBLOB2; $_ti_ResID)
				_O_SET RESOURCE NAME:C514("4DK#"; 15004; "Sales Price  Classes"; $_ti_ResID)
			End if 
			
		End if 
		If (False:C215)
			PG_LoadPGoptions(Table:C252(->[PURCHASE_ORDERS:57]))
			ARRAY LONGINT:C221($_al_ResID; 0)
			ARRAY TEXT:C222($_at_ResName; 0)
			
			$_bo_Update:=False:C215
			If (Application type:C494<4)
				$_t_StructurePath:=StructureFilePath
				$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
				$_t_DirectorySymbol:=Directory_Symbol
				$_t_NewResourcePath:=$_t_DirectoryPath+"PlugIns"+$_t_DirectorySymbol+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
				If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
					$_ti_ResID:=Open resource file:C497($_t_NewResourcePath)
				Else 
					$_ti_ResID:=_O_Create resource file:C496($_t_NewResourcePath)
				End if 
				RESOURCE LIST:C500("STR#"; $_al_ResID; $_at_ResName; $_ti_ResID)
				SORT ARRAY:C229($_al_ResID; $_at_ResName)
				$_l_STRID:=30005
				RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResID)
				If (Size of array:C274($_al_ResID)>0)
					$_l_OK:=0
					$_l_ResourceRow:=Find in array:C230($_al_ResID; 15005)
					If ($_l_ResourceRow>0)
						$_l_ListID:=$_al_ResID{$_l_ResourceRow}
						$_l_OK:=1
					Else 
						For ($_l_Index; 1; Size of array:C274($_al_ResID))
							If ($_al_ResID{$_l_Index}=15005)
								$_l_OK:=1
								$_l_ListID:=$_al_ResID{$_l_Index}
								$_l_Index:=999999
							End if 
						End for 
					End if 
				Else 
					$_l_OK:=0
				End if 
				ARRAY TEXT:C222($_at_StringList; Size of array:C274(PG_at_PriceGroupClassShort))
				ARRAY TEXT:C222($_at_StringList2; 0)
				For ($_l_Index; 1; Size of array:C274($_at_StringList))
					$_at_StringList{$_l_Index}:=PG_at_PriceGroupClassShort{$_l_Index}+":"+String:C10(PG_al_PriceGroupClass{$_l_Index})+":L"
				End for 
				SET BLOB SIZE:C606($_blb_StringBLOB; 0)
				SET BLOB SIZE:C606($_blb_StringBLOB2; 0)
				If ($_l_OK=0)  //need to build list
					_O_SET RESOURCE:C509("4DK#"; 15005; $_blb_StringBLOB; $_ti_ResID)
					_O_SET RESOURCE NAME:C514("4DK#"; 15005; "PurchasePrice Classes"; $_ti_ResID)
					RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResID)
					$_l_ListID:=15005
				Else 
					//load the list in case it needs updating
				End if 
				STRING LIST TO ARRAY:C511($_l_STRID; $_at_StringList2; $_ti_ResID)
				If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
					$_l_offset:=0
					_O_ARRAY TO STRING LIST:C512($_at_StringList; $_l_STRID; $_ti_ResID)
					//the above is written temporararily
					GET RESOURCE:C508("STR#"; $_l_STRID; $_blb_StringBLOB2; $_ti_ResID)
					_O_SET RESOURCE:C509("4DK#"; $_l_ListID; $_blb_StringBLOB2; $_ti_ResID)
					_O_SET RESOURCE NAME:C514("4DK#"; 15005; "Purchase Price  Classes"; $_ti_ResID)
					$_bo_Update:=True:C214
				End if 
				
			End if 
			
		End if 
		
		If ($_bo_Update)
			// ALERT("Your resources have been updated. Please restart Daybook")
			Gen_Alert("Your resources have been updated. Please restart Daybook.")
			QUIT 4D:C291
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PT_SetConstants"; $_t_oldMethodName)
