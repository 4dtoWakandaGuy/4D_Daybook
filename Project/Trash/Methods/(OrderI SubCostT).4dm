//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubCostT
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
	C_BOOLEAN:C305(<>MargCP; <>StandMA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubCostT")
[ORDERS:24]Total_Cost:11:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
[ORDERS:24]Total_Margin:12:=Gen_Round(([ORDERS:24]Total_Amount:6-[ORDERS:24]Total_Cost:11); 2; 2)
[ORDERS:24]Total_StandC:39:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Standard_Cost_Amount:42)); 2; 2)
If (<>StandMA)
	[ORDERS:24]Total_StandM:36:=Gen_Round(([ORDERS:24]Total_Amount:6-[ORDERS:24]Total_StandC:39); 2; 2)
Else 
	[ORDERS:24]Total_StandM:36:=Gen_Round(([ORDERS:24]Total_StandA:38-[ORDERS:24]Total_StandC:39); 2; 2)
End if 
If (<>MargCP)
	If ([ORDERS:24]Total_Cost:11=0)
		[ORDERS:24]Total_Margin_PC:13:=100
	Else 
		[ORDERS:24]Total_Margin_PC:13:=Gen_Round(((([ORDERS:24]Total_Amount:6-[ORDERS:24]Total_Cost:11)/[ORDERS:24]Total_Cost:11)*100); 2; 4)
	End if 
	If ([ORDERS:24]Total_StandC:39=0)
		[ORDERS:24]Total_StandMPC:37:=100
	Else 
		If (<>StandMA)
			[ORDERS:24]Total_StandMPC:37:=Gen_Round(((([ORDERS:24]Total_Amount:6-[ORDERS:24]Total_StandC:39)/[ORDERS:24]Total_StandC:39)*100); 2; 4)
		Else 
			[ORDERS:24]Total_StandMPC:37:=Gen_Round(((([ORDERS:24]Total_StandA:38-[ORDERS:24]Total_StandC:39)/[ORDERS:24]Total_StandC:39)*100); 2; 4)
		End if 
	End if 
Else 
	If ([ORDERS:24]Total_Amount:6=0)
		[ORDERS:24]Total_Margin_PC:13:=0
	Else 
		[ORDERS:24]Total_Margin_PC:13:=Gen_Round((100-([ORDERS:24]Total_Cost:11/[ORDERS:24]Total_Amount:6*100)); 2; 4)
	End if 
	If (<>StandMA)
		If ([ORDERS:24]Total_Amount:6=0)
			[ORDERS:24]Total_StandMPC:37:=0
		Else 
			[ORDERS:24]Total_StandMPC:37:=Gen_Round((100-([ORDERS:24]Total_StandC:39/[ORDERS:24]Total_Amount:6*100)); 2; 4)
		End if 
	Else 
		If ([ORDERS:24]Total_StandA:38=0)
			[ORDERS:24]Total_StandMPC:37:=0
		Else 
			[ORDERS:24]Total_StandMPC:37:=Gen_Round((100-([ORDERS:24]Total_StandC:39/[ORDERS:24]Total_StandA:38*100)); 2; 2)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubCostT"; $_t_oldMethodName)