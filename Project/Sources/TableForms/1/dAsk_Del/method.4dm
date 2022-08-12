If (False:C215)
	//Table Form Method Name: [CONTACTS]dAsk_Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch2; r0; r1; r2)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dAsk_Del"; Form event code:C388)
//dAk Del - Cont
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[CONTACTS:1]); "dAsk_Del")
		If (vText="TRANSFER")
			vText:=""
			r2:=1
			OBJECT SET ENABLED:C1123(r1; False:C215)
			OBJECT SET ENABLED:C1123(r0; False:C215)
		Else 
			r0:=1
			OBJECT SET ENABLED:C1123(ch2; False:C215)
		End if 
		INT_SetDialog
		
	: ($_l_event=On Data Change:K2:15)
		
		If (vText#"")
			r2:=1
			r0:=0
			r1:=0
			OBJECT SET ENABLED:C1123(ch2; True:C214)
		End if 
	: ($_l_event=On Deactivate:K2:10)
		
		//  PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		
		In_ButtdCall(->[CONTACTS:1])
		
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].dAsk_Del"; $_t_oldMethodName)
