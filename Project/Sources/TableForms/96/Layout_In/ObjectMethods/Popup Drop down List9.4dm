If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List9"; Form event code:C388)
If (SVS_at_PreviewTypeN>0)
	[LIST_LAYOUTS:96]Colour:12:=SVS_at_PreviewTypeN{SVS_at_PreviewTypeN}
	DB_bo_RecordModified:=True:C214
Else 
	SVS_at_PreviewTypeN:=Find in array:C230(SVS_at_PreviewTypeN; [LIST_LAYOUTS:96]Colour:12)
	If (SVS_at_PreviewTypeN<1)
		SVS_at_PreviewTypeN:=1
		[LIST_LAYOUTS:96]Colour:12:=SVS_at_PreviewTypeN{SVS_at_PreviewTypeN}
		DB_bo_RecordModified:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List9"; $_t_oldMethodName)
