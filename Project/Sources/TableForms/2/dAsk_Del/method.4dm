If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; r0; r1; r2; r3)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Del"; Form event code:C388)
$_l_event:=Form event code:C388
//dAsk_Del - Comp

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Del")
		If (vText="TRANSFER")
			vText:=""
			r2:=1
			OBJECT SET ENABLED:C1123(r1; False:C215)
			OBJECT SET ENABLED:C1123(r0; False:C215)
		Else 
			r0:=1
		End if 
		If (DB_t_CurrentFormUsage2#"Dedup")
			OBJECT SET ENABLED:C1123(r3; False:C215)
		End if 
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Data Change:K2:15)
		If (vText#"")
			r2:=1
			r0:=0
			r1:=0
			r3:=0
		End if 
		
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_Del"; $_t_oldMethodName)
