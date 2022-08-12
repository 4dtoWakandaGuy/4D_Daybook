If (False:C215)
	//object Name: [TRANSACTIONS]Trans_IO.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_IO.Variable5"; Form event code:C388)
Case of 
	: ([TRANSACTIONS:29]IO:18="I")
		vType:="Inputs"
	: ([TRANSACTIONS:29]IO:18="IS")
		vType:="Inputs - VAT Suspense"
	: ([TRANSACTIONS:29]IO:18="IC")
		vType:="Inputs - Cash VAT"
	: ([TRANSACTIONS:29]IO:18="O")
		vType:="Outputs"
	: ([TRANSACTIONS:29]IO:18="OS")
		vType:="Outputs - VAT Suspense"
	: ([TRANSACTIONS:29]IO:18="OC")
		vType:="Outputs - Cash VAT"
	: ([TRANSACTIONS:29]IO:18="N")
		vType:="Neither"
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_IO.Variable5"; $_t_oldMethodName)
