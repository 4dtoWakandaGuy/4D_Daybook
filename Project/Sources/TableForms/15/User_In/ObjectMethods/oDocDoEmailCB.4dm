If (False:C215)
	//object Name: [USER]User_In.DOC_l_docDoEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.DOC_l_docDoEmail"; Form event code:C388)

If (Form event code:C388=On Clicked:K2:4)
	UserIn13_document_setInterface
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.DOC_l_docDoEmail"; $_t_oldMethodName)
