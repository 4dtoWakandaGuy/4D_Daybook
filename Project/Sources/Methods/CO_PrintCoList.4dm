//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_PrintCoList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    15/05/2010 07:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; r1; r2; r3)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_PrintCoList")
If (Count parameters:C259=0)
	CREATE SET:C116([COMPANIES:2]; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
End if 
If (Not:C34(SR_ReportOK("CompList")))
	vTitle1:="LIST COMPANIES"
	Ask_List
	If (OK=1)
		Case of 
			: (r1=1)
				FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Print")
			: (r2=1)
				FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_List")
			: (r3=1)
				FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_List2")
		End case 
		PRINT SELECTION:C60([COMPANIES:2])
		
	End if 
End if 
If (Count parameters:C259=0)
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
ERR_MethodTrackerReturn("CO_PrintCoList"; $_t_oldMethodName)