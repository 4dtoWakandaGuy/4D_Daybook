//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_SetConstants
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2009 18:19:36If (False)// ----------------------------------------------------
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
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_offset; $_l_OK; $_l_ResourceRow; $_l_StrID)
	C_TEXT:C284($_t_DirectorySymbol; $_t_NewPath; $_t_NewResourcesPath; $_t_oldMethodName; $_t_ResourcesPath; $_t_StructurePath; $_t_UserConstantsPath)
	C_TIME:C306($_ti_Resource)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_SetConstants")
ARRAY LONGINT:C221($_al_ResID; 0)
ARRAY TEXT:C222($_at_ResName; 0)

$_bo_Update:=False:C215
If (Not:C34(Is compiled mode:C492))
	If (Application type:C494<4)
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
		$_l_StrID:=30001
		RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
		
		If (Size of array:C274($_al_ResID)>0)
			$_l_OK:=0
			$_l_ResourceRow:=Find in array:C230($_al_ResID; 15001)
			If ($_l_ResourceRow>0)
				$_l_ListID:=$_al_ResID{$_l_ResourceRow}
				$_l_OK:=1
			Else 
				For ($_l_Index; 1; Size of array:C274($_al_ResID))
					If ($_al_ResID{$_l_Index}=15001)
						$_l_OK:=1
						$_l_ListID:=$_al_ResID{$_l_Index}
						$_l_Index:=999999
					End if 
				End for 
			End if 
		Else 
			$_l_OK:=0
		End if 
		ARRAY TEXT:C222($_at_StringList; 24)
		ARRAY TEXT:C222($_at_StringList2; 0)
		$_at_StringList{1}:="4D Write Letter Template:3:L"
		$_at_StringList{2}:="4D Write Letter:-3:L"
		$_at_StringList{3}:="4D Write Email Template:12:L"
		$_at_StringList{4}:="4D Write Email:-12:L"
		$_at_StringList{5}:="4D Write ReportTemplate:1:L"
		$_at_StringList{6}:="4D Write Report:-1:L"
		$_at_StringList{7}:="Text Letter Template:5:L"
		$_at_StringList{8}:="Text Letter:-5:L"
		$_at_StringList{9}:="Text Email Template:4:L"
		$_at_StringList{10}:="Text Email:-4:L"
		$_at_StringList{11}:="Text Report Template:6:L"
		$_at_StringList{12}:="Text Report:-6:L"
		$_at_StringList{13}:="SuperWrite Letter Template:2:L"
		$_at_StringList{14}:="SuperWrite Letter:-2:L"
		$_at_StringList{15}:="SuperWrite Email Template:7:L"
		$_at_StringList{16}:="SuperWrite Email:-7:L"
		$_at_StringList{17}:="SuperWrite Report Template:8:L"
		$_at_StringList{18}:="SuperWrite Report:-8:L"
		$_at_StringList{19}:="SuperReport Letter Template:11:L"
		$_at_StringList{20}:="SuperReport Letter:-11:L"
		$_at_StringList{21}:="SuperReport Email Template:10:L"
		$_at_StringList{22}:="SuperReport Email:-10:L"
		$_at_StringList{23}:="SuperReportReport Template:9:L"
		$_at_StringList{24}:="SuperReport Report:-9:L"
		SET BLOB SIZE:C606($_blb_String; 0)
		
		
		SET BLOB SIZE:C606($_blb_String2; 0)
		If ($_l_OK=0)  //need to build list
			_O_SET RESOURCE:C509("4DK#"; 15001; $_blb_String; $_ti_Resource)
			_O_SET RESOURCE NAME:C514("4DK#"; 15001; "Document Classes"; $_ti_Resource)
			RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
			$_l_ListID:=15001
			
		Else 
			//load the list in case it needs updating
		End if 
		STRING LIST TO ARRAY:C511($_l_StrID; $_at_StringList2; $_ti_Resource)
		If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
			$_l_offset:=0
			_O_ARRAY TO STRING LIST:C512($_at_StringList; $_l_StrID; $_ti_Resource)
			//the above is written temporararily
			GET RESOURCE:C508("STR#"; $_l_StrID; $_blb_String2; $_ti_Resource)
			_O_SET RESOURCE:C509("4DK#"; $_l_ListID; $_blb_String2; $_ti_Resource)
			_O_SET RESOURCE NAME:C514("4DK#"; 15001; "Document Classes"; $_ti_Resource)
			$_bo_Update:=True:C214
			
			
		End if 
		
		
		
		//```````````
		ARRAY LONGINT:C221($_al_ResID; 0)
		ARRAY TEXT:C222($_at_ResName; 0)
		
		
		RESOURCE LIST:C500("STR#"; $_al_ResID; $_at_ResName; $_ti_Resource)
		SORT ARRAY:C229($_al_ResID; $_at_ResName)
		$_l_StrID:=30002
		// End if
		
		RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
		
		If (Size of array:C274($_al_ResID)>0)
			$_l_OK:=0
			$_l_ResourceRow:=Find in array:C230($_al_ResID; 15002)
			If ($_l_ResourceRow>0)
				$_l_ListID:=$_al_ResID{$_l_ResourceRow}
				$_l_OK:=1
			Else 
				For ($_l_Index; 1; Size of array:C274($_al_ResID))
					If ($_al_ResID{$_l_Index}=15002)
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
		$_at_StringList{1}:="Used Document:-1:L"
		$_at_StringList{2}:="Unused Document:0:L"
		$_at_StringList{3}:="Deleted Document:-100:L"
		SET BLOB SIZE:C606($_blb_String; 0)
		SET BLOB SIZE:C606($_blb_String2; 0)
		If ($_l_OK=0)  //need to build list
			_O_SET RESOURCE:C509("4DK#"; 15002; $_blb_String; $_ti_Resource)
			_O_SET RESOURCE NAME:C514("4DK#"; 15002; "Document Status"; $_ti_Resource)
			RESOURCE LIST:C500("4DK#"; $_al_ResID; $_at_ResName; $_ti_Resource)
			$_l_ListID:=15002
		Else 
			//load the list in case it needs updating
		End if 
		STRING LIST TO ARRAY:C511($_l_StrID; $_at_StringList2; $_ti_Resource)
		If (Size of array:C274($_at_StringList)#Size of array:C274($_at_StringList2))
			$_l_offset:=0
			//_O_ARRAY TO STRING LIST($_at_StringList;$_l_StrID;$_ti_Resource)
			//the above is written temporararily
			GET RESOURCE:C508("STR#"; $_l_StrID; $_blb_String2; $_ti_Resource)
			//_O_SET RESOURCE("4DK#";$_l_ListID;$_blb_String2;$_ti_Resource)
			//_O_SET RESOURCE NAME("4DK#";15002;"Document Status";$_ti_Resource)
			$_bo_Update:=True:C214
			
		End if 
		
	End if 
	If ($_bo_Update)
		//  ALERT("Your resources have been updated. Please restart Daybook")
		//Gen_Alert ("Your resources have been updated. Please restart Daybook.")
		//QUIT 4D
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("DOC_SetConstants"; $_t_oldMethodName)