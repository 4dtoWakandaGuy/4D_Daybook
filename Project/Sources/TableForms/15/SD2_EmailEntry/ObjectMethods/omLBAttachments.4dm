If (False:C215)
	//object Name: [USER]SD2_EmailEntry.omLBAttachments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_lb_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_LONGINT:C283($_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.omLBAttachments"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		
		//Open the document.
		$_l_Row:=LB_GetLine(->DOC_lb_Attachments)
		If ($_l_Row>0)
			If ([DIARY:12]Email_ID:41>0)  //Email sent before so file is on server
				DOC_LaunchExternalDocument(""; WS_at_AttachmentsPath{$_l_Row})
			Else   //else file is still here on client
				DOC_LaunchExternalDocument(""; WS_at_AttachmentsPath{$_l_Row})
			End if 
		End if 
End case 

ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.omLBAttachments"; $_t_oldMethodName)
//Nigel Greenlee14/03/2010 15:03
//Nigel Greenlee14/03/2010 15:05
//Nigel Greenlee21/04/2010 10:08
//Nigel Greenlee21/04/2010 10:14
//Nigel Greenlee21/04/2010 10:21
//Nigel Greenlee21/04/2010 13:59
//Nigel Greenlee21/04/2010 14:01
//Nigel Greenlee21/04/2010 14:04
//Nigel Greenlee21/04/2010 14:05
//Nigel Greenlee21/04/2010 14:07
//Nigel Greenlee21/04/2010 14:16
//Nigel Greenlee21/04/2010 14:22
//Nigel Greenlee21/04/2010 14:31
//Nigel Greenlee21/04/2010 14:56
//Nigel Greenlee21/04/2010 14:58
//Nigel Greenlee21/04/2010 15:00
//Nigel Greenlee21/04/2010 15:07
//Nigel Greenlee21/04/2010 15:13
ERR_MethodTrackerReturn("OBJ [USER]SD2_EmailEntry.omLBAttachments"; $_t_oldMethodName)
