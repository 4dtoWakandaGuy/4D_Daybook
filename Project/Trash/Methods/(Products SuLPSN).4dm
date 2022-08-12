//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_SuLPSN
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
	C_TEXT:C284($_t_oldMethodName; vDates)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SuLPSN")
If ([PRODUCTS:9]Unit_Number:29<8)
	vDates:=DayNameNum([PRODUCTS:9]Start_Number:30)
Else 
	If ([PRODUCTS:9]Start_Number:30=31)
		vDates:="Last day of Mth"
	Else 
		vDates:=String:C10([PRODUCTS:9]Start_Number:30)+DayEndNum([PRODUCTS:9]Start_Number:30)+" of Month"
	End if 
End if 
ERR_MethodTrackerReturn("Products_SuLPSN"; $_t_oldMethodName)