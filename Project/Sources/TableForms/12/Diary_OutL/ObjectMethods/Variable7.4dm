If (False:C215)
	//object Name: [DIARY]Diary_OutL.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DIaryDocumentCodes; 0)
	ARRAY TEXT:C222($_at_DocumentCodes; 0)
	//ARRAY TEXT(DOC_at_DocumentTypes;0)
	C_LONGINT:C283($_l_CompanyTypeRow; VNo)
	C_TEXT:C284($_t_oldMethodName; CUR_CompanyTypes; CUR_DocumentTypes)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_OutL.Variable7"; Form event code:C388)
If (DOC_at_DocumentTypes>0)
	$_l_CompanyTypeRow:=DOC_at_DocumentTypes
	If (DOC_at_DocumentTypes>0)
		USE NAMED SELECTION:C332("AllSelection")
		Case of 
			: (DOC_at_DocumentTypes=1)  //Documents
				DISTINCT VALUES:C339([DIARY:12]Document_Code:15; $_at_DIaryDocumentCodes)
				QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_DIaryDocumentCodes)
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=-3)
				SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_DocumentCodes)
				QUERY WITH ARRAY:C644([DIARY:12]Document_Code:15; $_at_DocumentCodes)
				
			: (DOC_at_DocumentTypes=2)  //Emails
				DISTINCT VALUES:C339([DIARY:12]Document_Code:15; $_at_DIaryDocumentCodes)
				QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_DIaryDocumentCodes)
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=-4)
				SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_DocumentCodes)
				QUERY WITH ARRAY:C644([DIARY:12]Document_Code:15; $_at_DocumentCodes)
			Else 
				
		End case 
		
	End if 
	
	
	If (Records in selection:C76([DIARY:12])=0)
		Gen_Alert("No "+DOC_at_DocumentTypes{DOC_at_DocumentTypes}+" found-the selection is empty"; "OK")
	End if 
	
	
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	Case of 
		: (DOC_at_DocumentTypes=1)
			CUR_DocumentTypes:="Letters"
		: (DOC_at_DocumentTypes=2)
			CUR_CompanyTypes:="Emails"  //Rollo 9/7/2004
			
	End case 
	
End if 
VNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_OutL.Variable7"; $_t_oldMethodName)
