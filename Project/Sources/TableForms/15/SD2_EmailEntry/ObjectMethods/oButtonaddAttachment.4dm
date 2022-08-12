If (False:C215)
	//object Name: [USER]SD2_EmailEntry.oaddAttachment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2013 10:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(DOC_lb_Attachments;0)
	//Array TEXT(WS_at_Attachments;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.oaddAttachment"; Form event code:C388)
WT_EMAIL_ATTACHMENTS
SD2_DiaryINLLPInterface("SD2_EmailEntry")
LB_SetScroll(->DOC_lb_Attachments; Size of array:C274(WS_at_Attachments))
LISTBOX SELECT ROW:C912(DOC_lb_Attachments; Size of array:C274(WS_at_Attachments); 0)
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.oaddAttachment"; $_t_oldMethodName)
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.oaddAttachment"; $_t_oldMethodName)