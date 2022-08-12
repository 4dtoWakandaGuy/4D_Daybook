If (False:C215)
	//object Name: [ANALYSES]Analyses_Out.3D Button43
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].Analyses_Out.3D Button43"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		WT_SORT_TABLE_3(->[ANALYSES:36]; "Text2"; ->[ANALYSES:36]Analysis_Code:1)
End case 
ERR_MethodTrackerReturn("OBJ [ANALYSES].Analyses_Out.3D Button43"; $_t_oldMethodName)
