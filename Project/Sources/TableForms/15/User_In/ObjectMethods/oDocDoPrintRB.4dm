If (False:C215)
	//object Name: [USER]User_In.DOC_l_DocDoPrint
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
	C_LONGINT:C283(DOC_l_docDoEmail)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.DOC_l_DocDoPrint"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	If (Self:C308->=1)
		DOC_l_docDoEmail:=0
	Else 
		DOC_l_docDoEmail:=1
	End if 
	UserIn13_document_setInterface
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.DOC_l_DocDoPrint"; $_t_oldMethodName)
