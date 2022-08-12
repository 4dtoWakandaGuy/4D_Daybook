If (False:C215)
	//Table Form Method Name: [INVOICES]INVFormSub2_VT
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
	C_LONGINT:C283(<>DataSize; $_l_event; PRT_l_PrintedLines)
	C_TEXT:C284($_t_oldMethodName; Vt_Line)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].INVFormSub2_VT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Printing Detail:K2:18)
		SetFontsByPointerParameter(<>DataSize-1; ""; 0; ->vT_Line)
		
		//Set_Fonts ("vT_Line";◊DataSize-1)
		PRT_l_PrintedLines:=PRT_l_PrintedLines+18
End case 
ERR_MethodTrackerReturn("FM [INVOICES].INVFormSub2_VT"; $_t_oldMethodName)
