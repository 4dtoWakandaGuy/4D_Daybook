If (False:C215)
	//Table Form Method Name: [INVOICES]dAllocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_abo_Select;0)
	//ARRAY BOOLEAN(INV_lb_Allocations;0)
	//ARRAY BOOLEAN(INV_lb_Allocations2;0)
	//ARRAY BOOLEAN(INV_lb_Allocations3;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; GEN_l_NameSelected; INV_l_AllocationPage; INV_l_BUT1; INV_l_But2; INV_l_BUT3; INV_l_BUT4; INV_l_BUT5; INV_l_BUT6; INV_l_BUT7; INV_l_BUT8)
	C_LONGINT:C283(INV_l_BUT9)
	C_REAL:C285(V31; VPAY2; VSUBTOTAL)
	C_TEXT:C284($_t_oldMethodName; INV_t_COL1; INV_t_COL2; INV_t_COL3; INV_t_COL4; INV_t_COL5; INV_t_COL6; INV_t_COL7; INV_t_COL8; INV_t_COL9; INV_t_HED1)
	C_TEXT:C284(INV_t_HED2; INV_t_HED3; INV_t_HED4; INV_t_HED5; INV_t_HED6; INV_t_HED7; INV_t_HED8; INV_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].dAllocation"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES:39]); "dAllocation")
		WS_AutoscreenSize(3; 252; 467)
		ARRAY BOOLEAN:C223(INV_abo_Select; 0)
		If (INV_l_AllocationPage=0)
			INV_l_AllocationPage:=1
		End if 
		
		GEN_l_NameSelected:=0
		//```
		Case of 
			: (INV_l_AllocationPage=1)
				LB_SetupListbox(->INV_lb_Allocations; "INV_t"; "INV_L"; 1; ->GEN_at_Name; ->GEN_at_RecordCode; ->GEN_ar_Value)
				LB_SetColumnHeaders(->INV_lb_Allocations; "INV_L"; 1; "Description"; "Due Amount"; "Allocated")
				
				LB_SetColumnWidths(->INV_lb_Allocations; "INV_t"; 1; 147; 77; 95)
				
				LB_SetEnterable(->INV_lb_Allocations; False:C215; 0)
				LB_SetScroll(->INV_lb_Allocations; -3; -2)
				LB_StyleSettings(->INV_lb_Allocations; "Black"; 9; "INV_t"; ->[ACCOUNTS:32])
				//```
			: (INV_l_AllocationPage=2)
				LB_SetupListbox(->INV_lb_Allocations2; "INV_t"; "INV_L"; 1; ->GEN_at_Name; ->GEN_at_RecordCode)
				LB_SetColumnHeaders(->INV_lb_Allocations2; "INV_L"; 1; "Order Code"; " Amount")
				
				LB_SetColumnWidths(->INV_lb_Allocations2; "INV_t"; 1; 147; 77)
				
				LB_SetEnterable(->INV_lb_Allocations2; False:C215; 0)
				LB_SetScroll(->INV_lb_Allocations2; -3; -2)
				
				LB_StyleSettings(->INV_lb_Allocations2; "Black"; 9; "INV_t"; ->[ACCOUNTS:32])
			: (INV_l_AllocationPage=3)
				
				If (INV_l_AllocationPage=3)
					ARRAY BOOLEAN:C223(INV_abo_Select; Size of array:C274(GEN_at_Name))
					
					
					
				End if 
				
				LB_SetupListbox(->INV_lb_Allocations3; "INV_t"; "INV_L"; 1; ->INV_abo_Select; ->GEN_at_Name; ->GEN_at_RecordCode)
				LB_SetColumnHeaders(->INV_lb_Allocations3; "INV_L"; 1; "Allocate"; "Deposit Number"; "Amount")
				LB_SetColumnWidths(->INV_lb_Allocations3; "INV_t"; 1; 147; 77; 95)
				LB_SetEnterable(->INV_lb_Allocations3; False:C215; 0)
				LB_SetEnterable(->INV_lb_Allocations3; True:C214; 1)
				LB_SetScroll(->INV_lb_Allocations3; -3; -2)
				LB_StyleSettings(->INV_lb_Allocations3; "Black"; 9; "INV_t"; ->[ACCOUNTS:32])
				
		End case 
		vSubtotal:=v31-vPay2
		INT_SetDialog
		
		
		FORM GOTO PAGE:C247(INV_l_AllocationPage)
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[INVOICES:39])
	: ($_l_event=On Clicked:K2:4)
	Else 
		
End case 
ERR_MethodTrackerReturn("FM:dAllocation"; $_t_oldMethodName)
