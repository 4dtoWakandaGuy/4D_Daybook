If (False:C215)
	//object Name: [DIARY]Diary_inLW.oLBAttachments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2012 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_LB_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inLW.oLBAttachments"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->DIA_LB_Attachments; $_t_VariableName)
		
		If ([DIARY:12]Email_ID:41>0)  //Email sent before so file is on server
			
			
			//First we should test the path
			DOC_LaunchExternalDocument(""; WS_at_AttachmentsPath{$_l_Row})
			
			
		Else   //else file is still here on client
			DOC_LaunchExternalDocument(""; WS_at_AttachmentsPath{$_l_Row})
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inLW.oLBAttachments"; $_t_oldMethodName)
