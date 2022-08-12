//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_SetConstants
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/09/2009 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
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
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_offset; $_l_OK; $_l_ResourceRow; $_l_STRID)
	C_TEXT:C284($_t_DirectoryPath; $_t_DirectorySymbol; $_t_NewPath; $_t_oldMethodName; $_t_ResourcesPath; $_t_StructurePath; $_t_UserConstantsPath)
	C_TIME:C306($_ti_Resource)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_SetConstants")
ARRAY LONGINT:C221($_al_ResID; 0)
ARRAY TEXT:C222($_at_ResName; 0)

$_bo_Update:=False:C215
If (Not:C34(Is compiled mode:C492))
	If (Application type:C494<4)
		//$_t_StructurePath:=Structure file
		$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
		
		
		If (Application type:C494#4D Remote mode:K5:5)
			$_t_NewPath:=Get 4D folder:C485(Database folder:K5:14)
		Else 
			$_t_NewPath:=Get 4D folder:C485(4D Client database folder:K5:13; *)
		End if 
		$_t_ResourcesPath:=$_t_ResourcesPath+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
		$_t_UserConstantsPath:=$_t_NewPath+"User Constants.rsr"
		
		If (Is a document:K24:1=(Test path name:C476($_t_ResourcesPath)))
			If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_UserConstantsPath))))
				COPY DOCUMENT:C541($_t_ResourcesPath; $_t_UserConstantsPath)
			End if 
			$_ti_Resource:=Open resource file:C497($_t_UserConstantsPath)
		End if 
		
		
		
		RESOURCE LIST:C500("STR#"; $_al_ResID; $_at_ResName; $_ti_Resource)
		SORT ARRAY:C229($_al_ResID; $_at_ResName)
		//  $_l_STRID:=$_al_ResID{Size of array($_al_ResID)}+1
		// If ($_l_STRID<30001)
		$_l_STRID:=30003
		// End if
		
		RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
		
		If (Size of array:C274($_al_ResID)>0)
			$_l_OK:=0
			$_l_ResourceRow:=Find in array:C230($_al_ResID; 15003)
			If ($_l_ResourceRow>0)
				$_l_ListID:=$_al_ResID{$_l_ResourceRow}
				$_l_OK:=1
			Else 
				For ($_l_Index; 1; Size of array:C274($_al_ResID))
					If ($_al_ResID{$_l_Index}=15003)
						$_l_OK:=1
						$_l_ListID:=$_al_ResID{$_l_Index}
						$_l_Index:=999999
					End if 
				End for 
			End if 
		Else 
			$_l_OK:=0
		End if 
		
		ARRAY TEXT:C222($_at_StringList; 20)
		ARRAY TEXT:C222($_at_StringList2; 0)
		$_at_StringList{1}:="System Owned Macro:1:L"
		$_at_StringList{2}:="Owner Owned Macro:2:L"
		$_at_StringList{3}:="System DataList Macro:3:L"
		$_at_StringList{4}:="Owner DataList Macro:4:L"
		$_at_StringList{5}:="System Print Macro:5:L"
		$_at_StringList{6}:="Owner Print Macro:6:L"
		$_at_StringList{7}:="Data Export Query Macro:7:L"  // 20/09/02 pb
		$_at_StringList{8}:="Data Export Data Macro:8:L"  // must fill variable EW_t_ExportValue 30/09/02 pb
		$_at_StringList{9}:="System Sales Pipeline Macro:9:L"
		$_at_StringList{10}:="Owner Sales Pipeline Macro:10:L"
		$_at_StringList{11}:="Data Import Macro:11:L"
		$_at_StringList{12}:="IMA Internal Internet Macro:12:L"
		$_at_StringList{13}:="IMA Owner Internet Macro:13:L"
		$_at_StringList{14}:="ITX Internal Internet Text:14:L"
		$_at_StringList{15}:="ITX Owner Internet Text:15:L"
		$_at_StringList{16}:="ITO Internal Internet Tool:16:L"
		$_at_StringList{17}:="ITO Owner Internet Tool:17:L"
		$_at_StringList{18}:="ICA Owner Internet Cache:18:L"
		$_at_StringList{19}:="SM Macro:19:L"
		$_at_StringList{20}:="SM AutoSearch:20:L"
		
		SET BLOB SIZE:C606($_blb_String; 0)
		SET BLOB SIZE:C606($_blb_String2; 0)
		If ($_l_OK=0)  //need to build list
			_O_SET RESOURCE:C509("4DK#"; 15003; $_blb_String; $_ti_Resource)
			_O_SET RESOURCE NAME:C514("4DK#"; 15003; "Macro Classes"; $_ti_Resource)
			RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
			$_l_ListID:=15003
			
		Else 
			//load the list in case it needs updating
		End if 
		STRING LIST TO ARRAY:C511($_l_STRID; $_at_StringList2; $_ti_Resource)
		If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
			$_l_offset:=0
			//_O_ARRAY TO STRING LIST($_at_StringList;$_l_STRID;$_ti_Resource)
			//the above is written temporararily
			GET RESOURCE:C508("STR#"; $_l_STRID; $_blb_String2; $_ti_Resource)
			//_O_SET RESOURCE("4DK#";$_l_ListID;$_blb_String2;$_ti_Resource)
			//_O_SET RESOURCE NAME("4DK#";15003;"Macro Classes";$_ti_Resource)
			$_bo_Update:=True:C214
			
			
		End if 
		
	End if 
	$_bo_Update:=MACRO_SetStatusConstants
	
	//```````````
	If ($_bo_Update)
		// ALERT("Your resources have been updated. Please restart Daybook")
		Gen_Alert("Your resources have been updated. Please restart Daybook.")
		QUIT 4D:C291
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("MACRO_SetConstants"; $_t_oldMethodName)
