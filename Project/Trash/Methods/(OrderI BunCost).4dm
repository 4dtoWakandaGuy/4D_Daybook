//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI BunCost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AB; $_l_LevelUpOrderItem; $1; vAB)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName; $_t_Stage; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI BunCost")
//OrderI BunCost

If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	If ([ORDER_ITEMS:25]Level_Up_Item_Number:48#0)
		If (Modified record:C314([ORDER_ITEMS:25]))
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
		$_l_LevelUpOrderItem:=[ORDER_ITEMS:25]Level_Up_Item_Number:48
		If ($1=1)
			CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$CostUp")
		End if 
		If (DB_t_CurrentFormUsage="Job@")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
		Else 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
		End if 
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$_l_LevelUpOrderItem)
		$_r_Sum:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_LevelUpOrderItem)
		[ORDER_ITEMS:25]Cost_Amount:15:=$_r_Sum
		[ORDER_ITEMS:25]Cost_Price:5:=Gen_Round(([ORDER_ITEMS:25]Cost_Amount:15/[ORDER_ITEMS:25]Quantity:3); 2; 1)
		Calc_ItemCost
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		If ([ORDER_ITEMS:25]Component_Level:47=0)
			$_l_AB:=vAB
			vAB:=0
			If (DB_t_CurrentFormUsage="Job@")
				$_t_Stage:=[ORDER_ITEMS:25]Job_Stage:35
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35=$_t_Stage; *)
				OrderI_LevelSrc(vAB)
				If ($_t_Stage="")
					Jobs_InLPTot3
					Jobs_InLPTot2
				Else 
					JobStages_InT3
				End if 
			Else 
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				OrderI_LevelSrc(vAB)
				Orders_InLPTot
			End if 
			vAB:=$_l_AB
		Else 
			If ([ORDER_ITEMS:25]Level_Up_Item_Number:48#0)
				OrderI BunCost(0)
			End if 
		End if 
		If ($1=1)
			USE NAMED SELECTION:C332("$CostUp")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI BunCost"; $_t_oldMethodName)