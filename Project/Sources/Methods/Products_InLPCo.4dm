//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLPCo
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPCo")
Products_InLPPC
If (([PRODUCTS:9]Product_Code:1=[PRODUCTS:9]Model_Code:5) & ([PRODUCTS:9]Model_Code:5#""))
	OBJECT SET FONT STYLE:C166(vTitle3; 4)  //NG April 2004 Removed ◊Screen
Else 
	OBJECT SET FONT STYLE:C166(vTitle3; 0)  //NG April 2004 Removed ◊Screen
End if 
If (([PRODUCTS:9]Product_Code:1#Old:C35([PRODUCTS:9]Product_Code:1)) & (Old:C35([PRODUCTS:9]Product_Code:1)#"") & ([PRODUCTS:9]Exported:24))
	If (DB_t_CurrentFormUsage#"None")
		Gen_Alert("You cannot recode Products that have been Downloaded"; "Try again")
	End if 
	
	[PRODUCTS:9]Product_Code:1:=Old:C35([PRODUCTS:9]Product_Code:1)
	[PRODUCTS:9]Group_Code:3:=Old:C35([PRODUCTS:9]Group_Code:3)
	[PRODUCTS:9]Brand_Code:4:=Old:C35([PRODUCTS:9]Brand_Code:4)
	[PRODUCTS:9]Model_Code:5:=Old:C35([PRODUCTS:9]Model_Code:5)
End if 
ERR_MethodTrackerReturn("Products_InLPCo"; $_t_oldMethodName)