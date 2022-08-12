If (False:C215)
	//Table Form Method Name: [X_LISTS]ALL_FIELDS
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WS_T_Properties)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [X_LISTS].ALL_FIELDS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		WS_T_Properties:=BLOB to text:C555([X_LISTS:111]x_ListAttributes:3; 3)
End case 
ERR_MethodTrackerReturn("FM [X_LISTS].ALL_FIELDS"; $_t_oldMethodName)
