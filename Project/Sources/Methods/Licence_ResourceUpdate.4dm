//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_ResourceUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>LicenceTextBlob; <>LicenceTextBlob2)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283(Lic_l_Version)
	C_REAL:C285($_l_ExtensionPosition)
	C_TEXT:C284($_t_DirectoryPath; $_t_DirectorySymbol; $_t_NewResourcePath; $_t_oldMethodName; $_t_StructurePath; $_t_TempText; $_t_Version)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_ResourceUpdate")
// Licence_ResourceUpdate
// Creates or updates Daybook Licence text in a resource
// 13/03/03 pb

SET BLOB SIZE:C606(<>LicenceTextBlob; 0)
$_t_Version:=""
Lic_l_Version:=0
If (Application type:C494#4D Local mode:K5:1)
	// ALERT("This must be done in single-User_Mode.")
	Gen_Alert("This must be done in single-User_Mode.")
Else 
	CONFIRM:C162("Have you got two plain text files to import?"; "Yes"; "No")
	If (OK=1)
		$_bo_Continue:=True:C214
		$_ti_DocumentRef:=DB_OpenDocument(""; "TEXT")
		$_l_ExtensionPosition:=Position:C15(".txt"; document)
		If ($_l_ExtensionPosition>1)
			$_t_Version:=Substring:C12(document; 1; $_l_ExtensionPosition-1)
			$_l_ExtensionPosition:=$_l_ExtensionPosition-1
			While ($_l_ExtensionPosition>0) & ($_t_Version[[$_l_ExtensionPosition]]#"v")
				$_l_ExtensionPosition:=$_l_ExtensionPosition-1
			End while 
			$_t_Version:=Substring:C12($_t_Version; $_l_ExtensionPosition+1)
			If (Num:C11($_t_Version)>0)
				// okey dokey
			Else 
				ALERT:C41("The document name must contain a version number - "+"for example 'docnameV2.txt'.")
				$_bo_Continue:=False:C215
			End if 
		Else 
			ALERT:C41("The document name must end in '.txt'.")
			$_bo_Continue:=False:C215
		End if 
		
		If (OK=1) & ($_bo_Continue)
			While (OK=1)
				IDLE:C311  // 7/04/03 pb
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_TempText; 32000)
				If (Length:C16($_t_TempText)>0)
					TEXT TO BLOB:C554($_t_TempText; <>LicenceTextBlob; Mac text without length:K22:10; *)
				End if 
			End while 
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			//TRACE
			//$_t_StructurePath:=Structure file
			$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
			$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
			$_t_DirectorySymbol:=Directory_Symbol
			$_t_NewResourcePath:=$_t_DirectoryPath+"Resources"+$_t_DirectorySymbol+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"DataResources.rsr"
			
			
			If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
				//$res:=Open resource file($_t_NewResourcePath)
			Else 
				//$res:=_o_Create resource file($_t_NewResourcePath)
			End if 
			//_o_SET RESOURCE("PREF";15005;<>LicenceTextBlob;$res)
		Else 
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
		
		If ($_bo_Continue)
			$_ti_DocumentRef:=DB_OpenDocument(""; "TEXT")
			If (OK=1)
				While (OK=1)
					IDLE:C311  // 7/04/03 pb
					RECEIVE PACKET:C104($_ti_DocumentRef; $_t_TempText; 32000)
					If (Length:C16($_t_TempText)>0)
						TEXT TO BLOB:C554($_t_TempText; <>LicenceTextBlob2; Mac text without length:K22:10; *)
					End if 
				End while 
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				//_o_SET RESOURCE("PREF";15006;<>LicenceTextBlob2;$res)
			End if 
			Licence_LoadPrefs
			Lic_l_Version:=Num:C11($_t_Version)
			Licence_SaveVariables
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Licence_ResourceUpdate"; $_t_oldMethodName)