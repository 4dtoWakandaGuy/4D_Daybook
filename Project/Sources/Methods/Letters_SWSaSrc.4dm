//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWSaSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	C_LONGINT:C283(xNext)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWSaSrc")
//Letters_SWSaSrc
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1#"*TMP@"; *)
If (vType="*ALL")
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Type:13#""; *)  //only here cos other WP types need to be excluded
Else 
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Type:13=vType; *)
End if 
If (xNext=1)
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Standard:9=True:C214)
Else 
	QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Standard:9=False:C215)
	If (<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}#"*ALL")
		QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Person:10=<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}; *)
		QUERY SELECTION:C341([DOCUMENTS:7];  | ; [DOCUMENTS:7]Person:10="*ALL")
	End if 
End if 
Letters_SWSaArr
ERR_MethodTrackerReturn("Letters_SWSaSrc"; $_t_oldMethodName)