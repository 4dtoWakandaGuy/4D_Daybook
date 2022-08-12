If (False:C215)
	//object Name: [DIARY]Diary_InEmail.obutAdd2
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
	//ARRAY BOOLEAN(DOC_lb_Recipients;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_LONGINT:C283($_l_Height; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Rows)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InEmail.obutAdd2"; Form event code:C388)
If (SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}#"")
	APPEND TO ARRAY:C911(SD2_at_EmailType; "")
	APPEND TO ARRAY:C911(SD2_at_EmailName; "")
	APPEND TO ARRAY:C911(SD2_at_EmailAddresses; "")
	APPEND TO ARRAY:C911(SD2_at_ContactIDs; "")
	$_l_Rows:=Size of array:C274(SD2_at_EmailType)
	If ($_l_Rows=0)
		$_l_Rows:=1
	End if 
	$_l_Height:=16+($_l_Rows*14)
	OBJECT GET COORDINATES:C663(DOC_lb_Recipients; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT MOVE:C664(DOC_lb_Recipients; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectTop+$_l_Height; *)
	LB_SetEnterable(->DOC_lb_Recipients; True:C214; 0)
	//And put the reecipient arrays in the correct place..
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InEmail.obutAdd2"; $_t_oldMethodName)
