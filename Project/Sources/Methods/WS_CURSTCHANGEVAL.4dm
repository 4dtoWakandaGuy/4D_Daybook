//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_CURSTCHANGEVAL
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
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_CURSTCHANGEVAL")
//Macro Code CurrstChangeVal
COMPILER_MACROS
If (<>PER_t_CurrentUserInitials="SG")
	//CREATE SET([CURRENT STOCK];"CS1")
	//ONE RECORD SELECT([CURRENT STOCK])
	//CREATE SET([CURRENT STOCK];"CS2")
	FIRST RECORD:C50([CURRENT_STOCK:62])
	[CURRENT_STOCK:62]Quantity:4:=Num:C11(Request:C163("Enter quantity for "+[CURRENT_STOCK:62]Product_Code:1; String:C10([CURRENT_STOCK:62]Quantity:4)))
	[CURRENT_STOCK:62]Cost_Price:6:=Num:C11(Request:C163("Enter cost price for "+[CURRENT_STOCK:62]Product_Code:1; String:C10([CURRENT_STOCK:62]Cost_Price:6)))
	[CURRENT_STOCK:62]Total_Cost:9:=[CURRENT_STOCK:62]Cost_Price:6*[CURRENT_STOCK:62]Quantity:4
	DB_SaveRecord(->[CURRENT_STOCK:62])
	AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
	//DIFFERENCE("CS1";"CS2";"CS3")
	//USE SET("CS3")
	ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1; <)
	
	
	
	
	
End if   //◊user=SG
ERR_MethodTrackerReturn("WS_CURSTCHANGEVAL"; $_t_oldMethodName)