If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]dService_Call
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2013 12:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vEDate; vSDate)
	C_LONGINT:C283($_l_event; i)
	C_TEXT:C284($_t_oldMethodName; vCharge; vCompName; vContrCode; vContType; vItemCode; vProdCode; vSerialNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].dService_Call")


//dService_Call
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "dService_Call")
		vCharge:="Y"
		RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
		vCompName:=[COMPANIES:2]Company_Name:2
		vEDate:=!00-00-00!
		vSDate:=!00-00-00!
		vContrCode:=""
		vProdCode:=""
		vSerialNo:=""
		vItemCode:=""
		vContType:=""
		Array_LCx(Records in selection:C76([ORDER_ITEMS:25]))
		ARRAY TEXT:C222(SVS_at_PreviewEvent; Records in selection:C76([ORDER_ITEMS:25]))
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35; >; [ORDER_ITEMS:25]Contract_Code:29; >)
		FIRST RECORD:C50([ORDER_ITEMS:25])
		i:=1
		While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			
			GEN_at_Name{i}:=[ORDER_ITEMS:25]Product_Name:13
			GEN_at_Identity{i}:=[ORDER_ITEMS:25]Serial_Number:24
			GEN_at_RecordCode{i}:=[ORDER_ITEMS:25]Job_Stage:35
			SVS_at_PreviewEvent{i}:=String:C10([ORDER_ITEMS:25]Item_Number:27)
			NEXT RECORD:C51([ORDER_ITEMS:25])
			i:=i+1
		End while 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		
		In_ButtdCall(->[SERVICE_CALLS:20])
		
End case 
ERR_MethodTrackerReturn("FM [SERVICE_CALLS].dService_Call"; $_t_oldMethodName)
