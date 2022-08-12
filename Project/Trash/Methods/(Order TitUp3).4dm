//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Order_TitUp3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>ForceCred; <>StatesLoaded)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_UsageRow; vDiaryCheck)
	C_TEXT:C284($_t_oldMethodName; vButtDisOrd)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_TitUp3")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
	If (([ORDERS:24]State:15=("024"+<>SYS_at_RecStateCodes{24}{2})) & ([ORDERS:24]Quotation_Date:26=!00-00-00!))
		[ORDERS:24]Quotation_Date:26:=<>DB_d_CurrentDate
	End if 
	If (([ORDERS:24]State:15>("024"+<>SYS_at_RecStateCodes{24}{2})) & ([ORDERS:24]Order_Date:4=!00-00-00!))
		[ORDERS:24]Order_Date:4:=<>DB_d_CurrentDate
		[ORDERS:24]Order_Period:42:=ACC_GetCurrentperiod
	End if 
End if 
Order_Title
[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)


$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 1)
If (($_l_UsageRow>0) & (vDiaryCheck=0) & ([ORDERS:24]Company_Code:1#""))
	Gen_CreditCheck
	If ((vSNo>0) & (<>ForceCred))
		//this should not up the order statevSNo
		[ORDERS:24]State:15:=Old:C35([ORDERS:24]State:15)
		Order_Title
		//  [ORDERS]Company Code:=""
		//  [ORDERS]Contact Code:=""
		// Comp_vClear
	End if 
Else 
	
	vDiaryCheck:=1
End if 

If (((<>SYS_al_RecStateRestriction{24}{vStPos}\2)%2)=1)
	Orders_InLPBDis
End if 
Input_Buttons(->[ORDERS:24]; ->vButtDisOrd)
ERR_MethodTrackerReturn("Order_TitUp3"; $_t_oldMethodName)
