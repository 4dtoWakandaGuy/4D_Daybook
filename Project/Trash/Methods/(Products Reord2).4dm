//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_Reord2
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
	C_TEXT:C284($_t_oldMethodName; $Type1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_Reord2")
FIRST RECORD:C50([STOCK_TYPES:59])
$Type1:=[STOCK_TYPES:59]Type_Code:1
While (Not:C34(End selection:C36([STOCK_TYPES:59])))
	If ([STOCK_TYPES:59]Type_Code:1=$Type1)
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2=[STOCK_TYPES:59]Type_Code:1; *)
	Else 
		QUERY:C277([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Stock_Type:2=[STOCK_TYPES:59]Type_Code:1; *)
	End if 
	NEXT RECORD:C51([STOCK_TYPES:59])
End while 
QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Product_Code:1=[PRODUCTS:9]Product_Code:1)
ERR_MethodTrackerReturn("Products_Reord2"; $_t_oldMethodName)