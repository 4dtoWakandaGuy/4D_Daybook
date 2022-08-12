If (False:C215)
	//Project Form Method Name: CCM_PostValuesTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_lb_ClientParamListbox;0)
	//ARRAY TEXT(HTTP_at_Data;0)
	//ARRAY TEXT(HTTP_at_FieldNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; CCM_l_BUT1; HTTPClient_AddParamButton; HTTPClient_DelParamButton; HTTPClient_GetRequest; HTTPClient_PostRequest; HTTPClient_SendButton; Stats_l_BUT2)
	C_TEXT:C284($_t_oldMethodName; HTTPClient_Response; HTTPClient_URL; oCCM_COL1; oCCM_COL2; oCCM_HED1; oCCM_HED2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM CCM_PostValuesTest"; Form event code:C388)
// (FM) [Dialogs];"HTTPClient_Demo"


Case of 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		//HTTPClient_URL:="http://www.pluggers.nl/ntk_httpdemo.php"
		HTTPClient_GetRequest:=0
		HTTPClient_PostRequest:=1
		HTTPClient_Response:=""
		
		ARRAY BOOLEAN:C223(CCM_lb_ClientParamListbox; 0)
		
		
		LB_SetupListbox(->CCM_lb_ClientParamListbox; "oCCM"; "CCM_L"; 1; ->HTTP_at_FieldNames; ->HTTP_at_Data)
		LB_SetColumnHeaders(->CCM_lb_ClientParamListbox; "CCM_L"; 1; "Record Type"; "Record Code")
		LB_SetColumnWidths(->CCM_lb_ClientParamListbox; "oCCM"; 1; 128; 154)  // dont need to worry about the invisible ones
		
		LB_StyleSettings(->CCM_lb_ClientParamListbox; "Black"; 9; "TEST"; ->[PREFERENCES:116])
		LB_SetEnterable(->CCM_lb_ClientParamListbox; True:C214; 0; "")
		LB_StyleSettings(->CCM_lb_ClientParamListbox; "Black"; 9; "TEST"; ->[PREFERENCES:116])
		LB_SetScroll(->CCM_lb_ClientParamListbox; -1; 0)
		
		
End case 
ERR_MethodTrackerReturn("FM CCM_PostValuesTest"; $_t_oldMethodName)
