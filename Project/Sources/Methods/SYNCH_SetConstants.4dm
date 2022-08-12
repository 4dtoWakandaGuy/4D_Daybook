//%attributes = {}

If (False:C215)
	//Project Method Name:      SYNCH_SetConstants
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
	ARRAY TEXT:C222($_at_ResName; 0)
	ARRAY TEXT:C222($_at_StringList; 0)
	ARRAY TEXT:C222($_at_StringList2; 0)
	C_BLOB:C604($_blb_String; $_blb_String2)
	C_BOOLEAN:C305($_bo_Update)
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_offset; $_l_OK; $_l_ResourceRow; $_l_StringID)
	C_TEXT:C284($_t_DirectoryPath; $_t_DirectorySymbol; $_t_NewResourcePath; $_t_oldMethodName; $_t_StructurePath)
	C_TIME:C306($_ti_ResourceDocRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYNCH_SetConstants")

//NG New Method April 24th 2006
//This new method is part of the synchro pack
//this sets constants for the synchro types
$_t_oldMethodName:=ERR_MethodTracker("SYNCH_SetConstants")
ARRAY LONGINT:C221($_al_ResID; 0)
ARRAY TEXT:C222($_at_ResName; 0)

$_bo_Update:=False:C215
If (Not:C34(Is compiled mode:C492))
	If (Application type:C494<4)
		$_t_StructurePath:=StructureFilePath
		$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
		$_t_DirectorySymbol:=Directory_Symbol
		$_t_NewResourcePath:=$_t_DirectoryPath+"Resources"+$_t_DirectorySymbol+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
		If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
			$_ti_ResourceDocRef:=Open resource file:C497($_t_NewResourcePath)
		Else 
			
			$_ti_ResourceDocRef:=_O_Create resource file:C496($_t_NewResourcePath)
		End if 
		
		RESOURCE LIST:C500("STR#"; $_al_ResID; $_at_ResName; $_ti_ResourceDocRef)
		SORT ARRAY:C229($_al_ResID; $_at_ResName)
		//  $_l_StringID:=$alResID{Size of array($alResID)}+1
		// If ($_l_StringID<30001)
		$_l_StringID:=30011
		// End if
		
		RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResourceDocRef)
		
		If (Size of array:C274($_al_ResID)>0)
			$_l_OK:=0
			$_l_ResourceRow:=Find in array:C230($_al_ResID; 15011)
			If ($_l_ResourceRow>0)
				$_l_ListID:=$_al_ResID{$_l_ResourceRow}
				$_l_OK:=1
			Else 
				For ($_l_Index; 1; Size of array:C274($_al_ResID))
					If ($_al_ResID{$_l_Index}=15011)
						$_l_OK:=1
						$_l_ListID:=$_al_ResID{$_l_Index}
						$_l_Index:=999999
					End if 
				End for 
			End if 
		Else 
			$_l_OK:=0
		End if 
		ARRAY TEXT:C222($_at_StringList; 3)
		ARRAY TEXT:C222($_at_StringList2; 0)
		$_at_StringList{1}:="Synch New Record:1:L"
		$_at_StringList{2}:="Synch Update Record:2:L"
		$_at_StringList{3}:="Sync Delete Record:3:L"
		
		
		SET BLOB SIZE:C606($_blb_String; 0)
		SET BLOB SIZE:C606($_blb_String2; 0)
		If ($_l_OK=0)  //need to build list
			_O_SET RESOURCE:C509("4DK#"; 15011; $_blb_String; $_ti_ResourceDocRef)
			_O_SET RESOURCE NAME:C514("4DK#"; 15011; "Synch Classes"; $_ti_ResourceDocRef)
			RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_ResourceDocRef)
			$_l_ListID:=15011
			//$update:=True
		Else 
			//load the list in case it needs updating
		End if 
		STRING LIST TO ARRAY:C511($_l_StringID; $_at_StringList2; $_ti_ResourceDocRef)
		If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
			$_l_offset:=0
			_O_ARRAY TO STRING LIST:C512($_at_StringList; $_l_StringID; $_ti_ResourceDocRef)
			//the above is written temporararily
			GET RESOURCE:C508("STR#"; $_l_StringID; $_blb_String2; $_ti_ResourceDocRef)
			_O_SET RESOURCE:C509("4DK#"; $_l_ListID; $_blb_String2; $_ti_ResourceDocRef)
			_O_SET RESOURCE NAME:C514("4DK#"; 15011; "Synch Classes"; $_ti_ResourceDocRef)
			$_bo_Update:=True:C214
			
			
		End if 
		
	End if 
	
	
	//```````````
	If ($_bo_Update)
		// ALERT("Your resources have been updated. Please restart Daybook")
		//Gen_Alert ("Your resources have been updated. Please restart Daybook.")
		//QUIT 4D
	End if 
End if 
ERR_MethodTrackerReturn("SYNCH_SetConstants"; $_t_oldMethodName)
