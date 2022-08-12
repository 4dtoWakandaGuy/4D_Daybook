If (False:C215)
	//Table Form Method Name: [INVOICES_ITEMS]Items_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES_ITEMS].Items_in"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize (2;333;553)
		INT_SetInput(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		WS_AutoscreenSize(2; 530; 553)
		INT_SetInput(Table:C252(->[INVOICES:39]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[INVOICES_ITEMS:161]); "Items_in")
		If (Records in selection:C76([INVOICES_ITEMS:161])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
Invoices_ItInLP
ERR_MethodTrackerReturn("FM [INVOICES_ITEMS].Items_in"; $_t_oldMethodName)
