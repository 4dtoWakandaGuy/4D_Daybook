If (False:C215)
	//object Name: [USER]INT_OUTPUTBACKGROUND_DEEP.3D Button2
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
	C_BOOLEAN:C305(SEL_bo_CachePopSelected)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WS_t_SelectionSetName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].INT_OUTPUTBACKGROUND_DEEP.3D Button2"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		SEL_NextSelection
End case 
ERR_MethodTrackerReturn("OBJ [USER].INT_OUTPUTBACKGROUND_DEEP.3D Button2"; $_t_oldMethodName)
