If (False:C215)
	//Table Form Method Name: [ORDERS]dAsk_GBReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vFDateF)
	C_LONGINT:C283($_l_event; ch3; ch6; r1)
	C_TEXT:C284($_t_oldMethodName; vComments; vCompCode; vProdCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].dAsk_GBReport"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: (0=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDERS:24]); "dAsk_GBReport")
		r1:=1
		vCompCode:=""
		vProdCode:=""
		vComments:=""
		vFDateF:=!00-00-00!
		ch6:=1
		ch3:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[ORDERS:24])
End case 
ERR_MethodTrackerReturn("FM [ORDERS].dAsk_GBReport"; $_t_oldMethodName)
