//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_SVCF
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
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SVCF")
//Products_SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=12)
		Project_SelFast(vFilePtr; ->[PRODUCTS:9]Product_Code:1; $_ptr_Table; ->[DIARY:12]Product_Code:13)
	: ($_l_TableNumber=25)
		Project_SelFast(vFilePtr; ->[PRODUCTS:9]Product_Code:1; $_ptr_Table; ->[ORDER_ITEMS:25]Product_Code:2)
	: ($_l_TableNumber=27)
		Project_SelFast(vFilePtr; ->[PRODUCTS:9]Product_Code:1; $_ptr_Table; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	: ($_l_TableNumber=62)
		Project_SelFast(vFilePtr; ->[PRODUCTS:9]Product_Code:1; $_ptr_Table; ->[CURRENT_STOCK:62]Product_Code:1)
	: ($_l_TableNumber=58)
		Project_SelFast(vFilePtr; ->[PRODUCTS:9]Product_Code:1; $_ptr_Table; ->[STOCK_LEVELS:58]Product_Code:1)
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Products_SVCF"; $_t_oldMethodName)
