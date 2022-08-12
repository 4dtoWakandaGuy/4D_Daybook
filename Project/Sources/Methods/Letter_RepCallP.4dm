//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_RepCallP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vDesc1; vItems)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_RepCallP")
vItems:=""
vDesc1:=""
QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)


While (Not:C34(End selection:C36([SERVICE_CALLS_PRODUCTS:152])))
	If ([SERVICE_CALLS_PRODUCTS:152]Product_Name:5#"")
		vItems:=vItems+[SERVICE_CALLS_PRODUCTS:152]Product_Name:5+Char:C90(13)
	End if 
	If (([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3#"") & (vDesc1#("@"+[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3+"@")))
		If (vDesc1#"")
			vDesc1:=vDesc1+" & "
		End if 
		vDesc1:=vDesc1+[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3
	End if 
	NEXT RECORD:C51([SERVICE_CALLS_PRODUCTS:152])
End while 
ERR_MethodTrackerReturn("Letter_RepCallP"; $_t_oldMethodName)