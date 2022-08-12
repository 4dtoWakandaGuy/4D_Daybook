If (False:C215)
	//object Method Name: Object Name:      [ORDERS].Orders_In.Variable20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 16:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_RevisionNumbers;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_event; ORD_l_RevisionNumbers)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_oldMethodName; $_t_PairingString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Variable20"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (ORD_al_RevisionNumbers{ORD_al_RevisionNumbers}#ORD_l_RevisionNumbers)
			If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
				$_t_PairingString:="OrdItems"
				//NG TODO
				
				LBI_SetDRGPair(1; ->ORD_r_SubSelection; $_t_PairingString)
				//AL_SetDrgDst (eALOrdII;1;$_t_PairingString)
				ZProc("Order_In"; DB_ProcessMemoryinit(4); "Enter Sales Orders"; String:C10(Current process:C322); ""; ""; ""; [ORDERS:24]Order_Code:3; String:C10(ORD_al_RevisionNumbers{ORD_al_RevisionNumbers}))
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ: [ORDERS].Orders_In.ORD_al_RevisionNumbers"; $_t_oldMethodName)
