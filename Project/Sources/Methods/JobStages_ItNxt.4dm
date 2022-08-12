//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_ItNxt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($IN; vAB)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_ItNxt")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
	Menu_Record("JobStages_ItNxt"; "Show Next Level Items")
	If (FORM Get current page:C276#1)
		If (Modified record:C314([ORDER_ITEMS:25]))
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			
		End if 
		If (Records in selection:C76([ORDER_ITEMS:25])>1)
			$IN:=[ORDER_ITEMS:25]Item_Number:27
		Else 
			$IN:=0
		End if 
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$OI")
		OrderI_LevelCr
		If (FORM Get current page:C276=2)
			JobStages_InLOI("B"; vAB+1)
		Else 
			JobStages_InLOI("A"; vAB+1)
		End if 
		If ($IN#0)
			Gen_Confirm("Do you want to show the Next Level Items for the Current Item, or for All Items?"; "Current"; "All")
			If (OK=1)
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$IN)
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
			End if 
		End if 
		If (Records in selection:C76([ORDER_ITEMS:25])=0)
			Gen_Alert("No Items were found at Level "+String:C10(vAB); "Cancel")
			USE NAMED SELECTION:C332("$OI")
			vAB:=vAB-1
		End if 
		CLEAR NAMED SELECTION:C333("$OI")
	Else 
		Gen_Alert("Please use this Function from one of the Cost Items pages"; "Cancel")
	End if 
End if 
ERR_MethodTrackerReturn("JobStages_ItNxt"; $_t_oldMethodName)