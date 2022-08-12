If (False:C215)
	//object Name: [LIST_LAYOUTS]Layouts_Out.Popup Drop down List1
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
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_PreviewRow; vNo)
	C_TEXT:C284($_t_CurrentFormUsage2; $_t_oldMethodName; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layouts_Out.Popup Drop down List1"; Form event code:C388)
If (SVS_at_PreviewEvent>0)
	$_t_CurrentFormUsage2:=SVS_at_PreviewEvent{SVS_at_PreviewEvent}
	If ($_t_CurrentFormUsage2="Default")
		DB_t_CurrentFormUsage3:=""
		$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
	Else 
		DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage2
		$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2+$_t_CurrentFormUsage2
	End if 
	MESSAGES OFF:C175
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_CurrentFormUsage2)
	vNo:=Records in selection:C76([LIST_LAYOUTS:96])
	ORDER BY:C49([LIST_LAYOUTS:96]Order:7; >)
	MESSAGES ON:C181
Else 
	$_l_PreviewRow:=Find in array:C230(SVS_at_PreviewEvent; DB_t_CurrentFormUsage3)
	If ($_l_PreviewRow>0)
		SVS_at_PreviewEvent:=$_l_PreviewRow
	Else 
		SVS_at_PreviewEvent:=1
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layouts_Out.Popup Drop down List1"; $_t_oldMethodName)
