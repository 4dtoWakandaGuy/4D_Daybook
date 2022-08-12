If (False:C215)
	//object Name: [DOCUMENTS]dOpen.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 08:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dOpen.Variable4"; Form event code:C388)
DB_t_CurrentFormUsage:="InL"
Diary_Sel
If (OK=1)
	
	If (Records in selection:C76([DIARY:12])>0)
		Join_SelFast(->[DIARY:12]; ->[DIARY:12]Document_Code:15; ->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1)
		QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1#"*TMP@"; *)
		If (vType="*ALL")
			QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Type:13#""; *)  //only here cos other WP types need to be excluded
		Else 
			QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Type:13=vType; *)
		End if 
		QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Standard:9=False:C215)
		If (<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}#"*ALL")
			QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Person:10=<>Per_at_PersonnelNames{<>Per_at_PersonnelNames}; *)
			QUERY SELECTION:C341([DOCUMENTS:7];  | ; [DOCUMENTS:7]Person:10="*ALL")
		End if 
	Else 
		REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
	End if 
	Letters_SWSaArr
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dOpen.Variable4"; $_t_oldMethodName)
