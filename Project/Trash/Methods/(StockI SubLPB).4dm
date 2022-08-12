//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI_SubLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Edits)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; STK_t_OriginInformation; vLocation; vProduct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_SubLPB")

If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
	[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 

If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11="")
	[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
	[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=""
	[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
End if 


If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12=0) & (Record number:C243([STOCK_MOVEMENT_ITEMS:27])=New record:K29:1)
	[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
End if 
If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5=!00-00-00!)
	If ([STOCK_MOVEMENTS:40]Movement_Date:5=!00-00-00!)
		[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=<>DB_d_CurrentDate
	Else 
		[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=[STOCK_MOVEMENTS:40]Movement_Date:5
	End if 
	
End if 
If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
	STK_t_OriginInformation:=STK_GetOriginInformation
	
Else 
	STK_t_OriginInformation:="No preceding movement item identified"
End if 
$_bo_Edits:=STK_SetHeaderInfo
vProduct:=""
vLocation:=""
If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; False:C215)
End if 
If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Quantity:12; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; False:C215)
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; False:C215)
End if 
ERR_MethodTrackerReturn("StockI_SubLPB"; $_t_oldMethodName)
