If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELD_DEFINITiONS]dField_Defs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELD_DEFINITiONS].dField_Defs"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->GEN_lb_ItemsArea)
		
	: ($_l_event=On Header:K2:17)
		WS_AutoscreenSize(2; 400; 553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "dField_Defs")
		WS_AutoscreenSize(2; 400; 553)
		INT_SetInput(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); WIN_t_CurrentInputForm)
		
End case 

FurthFldD_InLP
ERR_MethodTrackerReturn("FM:dField_Defs"; $_t_oldMethodName)
