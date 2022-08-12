//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_TCInLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_LB_TimeItems;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(SD_at_TrState;0)
	C_BOOLEAN:C305(vFromIn)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDisJob)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TCInLPB")
[ORDERS:24]Order_Date:4:=<>DB_d_CurrentDate
[ORDERS:24]Person:5:=<>PER_t_CurrentUserInitials
[ORDERS:24]Required_Date:9:=<>DB_d_CurrentDate
If (((<>WIP_t_TRPTrans#"") | (<>WIP_t_TRWTrans#"") | (<>WIP_t_CIPTRANS#"") | (<>WIP_t_CIWTrans#"")) & (DB_GetModuleSettingByNUM(1)#5))
	vDate:=[ORDERS:24]Required_Date:9
	$_l_PeriodID:=Check_Period
	Check_PerClose
	[ORDERS:24]Order_Period:42:=[PERIODS:33]Period_Code:1
Else 
	OBJECT SET ENTERABLE:C238([ORDERS:24]Required_Date:9; False:C215)
	OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Period:42; False:C215)
End if 
If (DB_GetModuleSettingByNUM(1)=5)
	OBJECT SET ENTERABLE:C238(SD_at_TrState; False:C215)
	SD_at_TrState:=2
End if 
DB_t_CurrentFormUsage:="Job"
vTot:=0
vTot2:=0
vButtDisJob:="IJD  O   SS R AD "
Input_Buttons(->[ORDERS:24]; ->vButtDisJob)
vFromIn:=False:C215
//NG April 2004
//OK so there probably is no diary records or
If ([ORDERS:24]Order_Code:3#"")
	QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=[ORDERS:24]Order_Code:3)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
Else 
	REDUCE SELECTION:C351([DIARY:12]; 0)
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
End if 

ORD_JobLoadTimeandCosts
LBi_ArrDefFill(->ORD_aPtr_OrderItemsSetup; ->ORD_LB_TimeItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; "411111126"; "Items_in"; 20; "Order Items"; "Order Item")  //changed from "eALOrdII" to "ORD_LB_TimeItems" (eALOrdII was undefined and presumably the pre listbox version) - 09/01/07 -kmw

LBi_LoadSetup(->ORD_aPtr_OrderItemsSetup; "B")

TimeCostEntry_UpdateDescFields  //SET DESCRIPTION VARS-ADDED 29/1/7-KMW

Macro_AccType("Load "+String:C10(Table:C252(->[ORDERS:24])))
ERR_MethodTrackerReturn("Jobs_TCInLPB"; $_t_oldMethodName)