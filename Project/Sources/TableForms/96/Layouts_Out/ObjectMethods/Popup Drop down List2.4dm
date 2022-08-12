If (False:C215)
	//object Name: [LIST_LAYOUTS]Layouts_Out.Popup Drop down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_FontSizes; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_LONGINT:C283($_l_ArraySize; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layouts_Out.Popup Drop down List2"; Form event code:C388)
If (SVS_at_PreviewNote>0)
	ARRAY INTEGER:C220($_ai_FontSizes; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	
	COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$LL")  //Done purely to force a redraw - see below
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Font_Size:11; $_ai_FontSizes; [LIST_LAYOUTS:96]Settings:13; $_at_Settings)
	$_l_ArraySize:=Size of array:C274($_ai_FontSizes)
	For ($_l_Index; 1; $_l_ArraySize)
		If (SVS_at_PreviewNote{SVS_at_PreviewNote}="9")
			$_ai_FontSizes{$_l_Index}:=9
			$_at_Settings{$_l_Index}:=Substring:C12($_at_Settings{$_l_Index}; 1; 35)+"0"+Substring:C12($_at_Settings{$_l_Index}; 37; 43)
		Else 
			$_ai_FontSizes{$_l_Index}:=10
			$_at_Settings{$_l_Index}:=Substring:C12($_at_Settings{$_l_Index}; 1; 35)+"1"+Substring:C12($_at_Settings{$_l_Index}; 37; 43)
		End if 
	End for 
	ARRAY TO SELECTION:C261($_ai_FontSizes; [LIST_LAYOUTS:96]Font_Size:11; $_at_Settings; [LIST_LAYOUTS:96]Settings:13)
	USE NAMED SELECTION:C332("$LL")  //if not here, when compiled doesn't redraw the changes
	CLEAR NAMED SELECTION:C333("$LL")
Else 
	SVS_at_PreviewNote:=2
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layouts_Out.Popup Drop down List2"; $_t_oldMethodName)
