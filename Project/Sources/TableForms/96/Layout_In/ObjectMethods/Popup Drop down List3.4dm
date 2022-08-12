If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List3
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
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List3"; Form event code:C388)
If (SVS_at_PreviewNote>0)
	If (SVS_at_PreviewNote{SVS_at_PreviewNote}="9")
		[LIST_LAYOUTS:96]Font_Size:11:=9
	Else 
		[LIST_LAYOUTS:96]Font_Size:11:=10
	End if 
	DB_bo_RecordModified:=True:C214
Else 
	If ([LIST_LAYOUTS:96]Font_Size:11=9)
		SVS_at_PreviewNote:=1
	Else 
		SVS_at_PreviewNote:=2
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List3"; $_t_oldMethodName)
