//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products SuMod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2011 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products SuMod")
//Products SuMod
Menu_Record("Products SuMod"; "Subscriptions Setup")
//NG April 2004 Removed ◊Screen
If (In_ButtChkMan(->[PRODUCTS:9]; "1 5"))
	If (Modified record:C314([PRODUCTS:9]))
		DB_SaveRecord(->[PRODUCTS:9])
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
	End if 
	
	FORM SET INPUT:C55([PRODUCTS:9]; "Products Su13")
	Open_Pro_Window("Subscriptions"; 0; 2; ->[PRODUCTS:9]; "Products Su13")
	MODIFY RECORD:C57([PRODUCTS:9]; *)
	FORM SET INPUT:C55([PRODUCTS:9]; "Products_in2009")
	Close_ProWin(Table name:C256(->[PRODUCTS:9])+"_"+"Products Su13")
End if 
ERR_MethodTrackerReturn("Products SuMod"; $_t_oldMethodName)