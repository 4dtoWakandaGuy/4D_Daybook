//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListPropertyNUM; 0)
	//ARRAY LONGINT(AA_al_ListPropertiesNUM;0;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	ARRAY TEXT:C222($_at_ListPropertSTR; 0)
	ARRAY TEXT:C222($_at_ListPropertyTypes; 0)
	//ARRAY TEXT(AA_at_2DListPropertyTypes;0;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_ListPropertiesSTR;0;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_COLLECTION:C1488($_Col_PropertyNames; $_Col_PropertyNumbers; $_Col_PropertyTypes)
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_Properties; $_l_Retries; $_l_SelectedRecordNumber)
	C_OBJECT:C1216($_obj_defaultProperties; $_obj_ProperitiesList; $_obj_ProperitiesLists; $_obj_PropertiesList; $_obj_PropertiesLists; $_obj_Property; $_obj_PropertyItem; $_obj_PropertyItems; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListProperties")
//NG June 2007 this is not called so I am not updating it..but if it is wanted
//$_l_ListID:=[X_LISTS]x_ID
//If ($_l_ListID>0)
//$_l_SelectedRecordNumber:=Selected record number([X_LISTS])
//CREATE SET([X_LISTS]; "$Temp")
//End if 
If (Count parameters:C259>=1)
	$_obj_defaultProperties:=$1
	$_obj_PropertiesLists:=ds:C1482.X_LISTS.query("x_ListName =:1"; "List Properties")
	If ($_obj_PropertiesLists.length=0)
		$_obj_ProperitiesList:=ds:C1482.X_Lists.new()
		$_obj_ProperitiesList.x_ListName:="List Properties"
		DB_SaveEntity($_obj_ProperitiesList)
		//QUERY([X_LISTS]; [X_LISTS]x_ListName="List Properties")
		//If (Records in selection([X_LISTS])=0)
		//$_l_Retries:=0
		//While (Semaphore("LoadingListofLists"))  //about to write-stop everyone
		//$_l_Retries:=$_l_Retries+1
		//DelayTicks(2*(1+$_l_Retries))
		
		
		//End while 
		//QUERY([X_LISTS]; [X_LISTS]x_ListName="List Properties")  //check it was not just created
		//If (Records in selection([X_LISTS])=0)
		//READ WRITE([X_LISTS])
		//CREATE RECORD([X_LISTS])
		//[X_LISTS]x_ListName:="List Properties"
		//the record ID is created in the trigger
		//DB_SaveRecord(->[X_LISTS])
		//AA_CheckFileUnlocked(->[X_LISTS]x_ID)
		//UNLOAD RECORD([X_LISTS])
		//READ ONLY([X_LISTS])
		//End if 
		//CLEAR SEMAPHORE("LoadingListofLists")  //about to write-stop everyone
	Else 
		$_obj_ProperitiesList:=$_obj_ProperitiesLists[0]
	End if 
	//QUERY([X_LISTS]; [X_LISTS]x_ListName="List Properties")
	$_obj_PropertyItems:=ds:C1482.LIST_ITEMS.query("X_ListID =:1"; $_obj_ProperitiesList.x_ID)
	$_obj_defaultProperties.propertyNames:=$_obj_PropertyItems.List_Entry
	$_obj_defaultProperties.propertyIDS:=$_obj_PropertyItems.X_ID
	For each ($_obj_PropertyItem; $_obj_PropertyItems)  //we might need to transfer from the blob storage to the object storage
		If ($_obj_PropertyItem.x_ItemAttributesOBJECT=Null:C1517)
			ARRAY TEXT:C222($_at_ListPropertyTypes; 0)
			ARRAY LONGINT:C221($_al_ListPropertyNUM; 0)
			ARRAY TEXT:C222($_at_ListPropertSTR; 0)
			AA_GetListItemProperties($_obj_PropertyItem; ->$_at_ListPropertyTypes; ->$_al_ListPropertyNUM; ->$_at_ListPropertSTR)
			$_Col_PropertyTypes:=New collection:C1472
			For ($_l_Properties; 1; Size of array:C274($_at_ListPropertyTypes))
				If ($_al_ListPropertyNUM{$_l_Properties}#0)
					$_obj_Property:=New object:C1471("PropertyType"; $_at_ListPropertyTypes{$_l_Properties}; "number"; $_al_ListPropertyNUM{$_l_Properties})
				Else 
					$_obj_Property:=New object:C1471("PropertyType"; $_at_ListPropertyTypes{$_l_Properties}; "name"; $_at_ListPropertSTR{$_l_Properties})
				End if 
				$_Col_PropertyTypes.push($_obj_Property)
			End for 
			$_obj_PropertyItem.x_ItemAttributesOBJECT.properties:=$_Col_PropertyTypes
			DB_SaveEntity($_obj_PropertyItem)
		End if 
	End for each 
	$_obj_defaultProperties.propertyAttributes:=$_obj_PropertyItem.x_ItemAttributesOBJECT
	
	//$_l_ListID:=[X_LISTS]x_ID
	//QUERY([LIST_ITEMS]; [LIST_ITEMS]X_ListID=$_l_ListID)
	//SELECTION TO ARRAY([LIST_ITEMS]List_Entry; AA_at_ListProperties; [LIST_ITEMS]X_ID; AA_al_ListPropertyIDs)
	ARRAY TEXT:C222(AA_at_PropertiesListProperties; Size of array:C274(AA_at_ListProperties))
	ARRAY TEXT:C222(AA_at_2DListPropertyTypes; 0; 0)
	ARRAY LONGINT:C221(AA_al_ListPropertiesNUM; 0; 0)
	ARRAY TEXT:C222(AA_at_ListPropertiesSTR; 0; 0)
	ARRAY TEXT:C222(AA_at_2DListPropertyTypes; Size of array:C274(AA_at_ListProperties); 0)
	ARRAY LONGINT:C221(AA_al_ListPropertiesNUM; Size of array:C274(AA_at_ListProperties); 0)
	ARRAY TEXT:C222(AA_at_ListPropertiesSTR; Size of array:C274(AA_at_ListProperties); 0)
	
	For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
		If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)>0)
			AA_GetListItemProperties(->AA_at_2DListPropertyTypes{$_l_Index}; ->AA_al_ListPropertiesNUM{$_l_Index}; ->AA_at_ListPropertiesSTR{$_l_Index})
		End if 
		NEXT RECORD:C51([LIST_ITEMS:95])
	End for 
	ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_ListProperties))
	//For ($_l_Index;1;Size of array(AA_al_ListPropertySublists))
	
	//End for
	
	If ($_l_ListID>0)
		USE SET:C118("$Temp")
		GOTO SELECTED RECORD:C245([X_LISTS:111]; $_l_SelectedRecordNumber)
	End if 
	ERR_MethodTrackerReturn("AA_LoadListProperties"; $_t_oldMethodName)
	