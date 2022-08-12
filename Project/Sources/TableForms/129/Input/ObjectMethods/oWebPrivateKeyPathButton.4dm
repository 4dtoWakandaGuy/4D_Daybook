If (False:C215)
	//object Name: [WEBSETUP_4D]Input.objHTTPSPrivateKeyPathButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocPaths; 0)
	C_TEXT:C284($_t_DocName; $_t_FolderPath; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].Input.objHTTPSPrivateKeyPathButton"; Form event code:C388)



If ([WEBSETUP_4D:129]sPrivateKeyPath:36#"")
	$_t_FolderPath:=PathFromPathName([WEBSETUP_4D:129]sPrivateKeyPath:36)
Else 
	$_t_FolderPath:=""
End if 

ARRAY TEXT:C222($_at_DocPaths; 0)

$_t_DocName:=DB_SelectDocument($_t_FolderPath; "*"; "Specify SSL Private Key File"; 0; ->$_at_DocPaths)

If (OK=1)
	If (Size of array:C274($_at_DocPaths)>0)
		[WEBSETUP_4D:129]sPrivateKeyPath:36:=$_at_DocPaths{1}  //should be same as system variable Document
	Else   //if no file selected then maybe it wouldn't get here anyway (ie system variable OK probably set to 0 in this situation)
		[WEBSETUP_4D:129]sPrivateKeyPath:36:=""
		Gen_Alert("Sorry. You have to select a file. Private key path set to blank.")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].Input.objHTTPSPrivateKeyPathButton"; $_t_oldMethodName)
