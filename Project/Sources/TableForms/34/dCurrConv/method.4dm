If (False:C215)
	//Table Form Method Name: [ACCOUNT_BALANCES]dCurrConv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_RateTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch0; ch1; r0; VLISTNAMES)
	C_OBJECT:C1216($_obj_ListItems)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].dCurrConv"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "dCurrConv")
		Form:C1466.CurrentRate:=1
		Form:C1466.AverageRate:=0
		Form:C1466.PostingDateRate:=0
		Form:C1466.DoNotConvert:=1
		Form:C1466.Convert:=0
		OBJECT SET ENABLED:C1123(*; "oCurrentRate"; False:C215)
		// -----------
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Rate Types")
		$_obj_ListItems:=ds:C1482.LIST_ITEMS.query("List_Name =:1"; "Rate Types")
		
		//vListNames:=Records in selection([LIST_ITEMS])
		ARRAY TEXT:C222(CUR_at_RateTypes; 0)
		COLLECTION TO ARRAY:C1562($_obj_ListItems.List_Entry; CUR_at_RateTypes)
		//SELECTION TO ARRAY([LIST_ITEMS]List_Entry; CUR_at_RateTypes)
		// -----------
		INT_SetDialog
		//SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[ACCOUNT_BALANCES:34])
		
	: ($_l_event=On Activate:K2:9)
		
		//SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM [ACCOUNT_BALANCES].dCurrConv"; $_t_oldMethodName)
