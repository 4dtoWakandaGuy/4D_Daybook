//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_SuMod
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

$_t_oldMethodName:=ERR_MethodTracker("Products_SuMod")
//Products_SuMod
Menu_Record("Products_SuMod"; "Subscriptions Setup")
//NG April 2004 Removed ◊Screen
If (In_ButtChkMan(->[PRODUCTS:9]; "1 5"))
	If (Modified record:C314([PRODUCTS:9]))
		DB_SaveRecord(->[PRODUCTS:9])
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
	End if 
	
	FORM SET INPUT:C55([PRODUCTS:9]; "Products_SU")
	Open_Pro_Window("Subscriptions"; 0; 2; ->[PRODUCTS:9]; "Products_SU")
	MODIFY RECORD:C57([PRODUCTS:9]; *)
	FORM SET INPUT:C55([PRODUCTS:9]; "Products_in2009")
	Close_ProWin(Table name:C256(->[PRODUCTS:9])+"_"+"Products_SU")
End if 
ERR_MethodTrackerReturn("Products_SuMod"; $_t_oldMethodName)