//%attributes = {}
If (False:C215)
	//Project Method Name:      INF_GetQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2009 11:21`Method: INF_GetQualities
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282(MiFieldNumber; MiTableNumber)
	C_REAL:C285(MiFieldValue)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INF_GetQualities")
//This macro will get the INFORMATION RECORDS for any Contact or company record
// Or product or order
//To use it you must set the variable
// MiTableNumber
//To the table number of the records you want the information for


If (False:C215)
	//Set it using the following line of code
	//replacing contacts with the name of the table you are interested in
	MiTableNumber:=Table:C252(->[CONTACTS:1])
End if 
If (MiTableNumber>0)
	Case of 
		: (MiTableNumber=Table:C252(->[CONTACTS:1]))
			MiFieldNumber:=Field:C253(->[CONTACTS:1]x_ID:33)
			MiFieldValue:=[CONTACTS:1]x_ID:33  // Get the value from the current record
		: (MiTableNumber=Table:C252(->[COMPANIES:2]))
			MiFieldNumber:=Field:C253(->[COMPANIES:2]x_ID:63)
			MiFieldValue:=[COMPANIES:2]x_ID:63
		: (MiTableNumber=Table:C252(->[PRODUCTS:9]))
			MiFieldNumber:=Field:C253(->[PRODUCTS:9]X_ID:43)
			MiFieldValue:=[PRODUCTS:9]X_ID:43
		: (MiTableNumber=Table:C252(->[ORDERS:24]))
			MiFieldNumber:=Field:C253(->[ORDERS:24]x_ID:58)
			MiFieldValue:=[ORDERS:24]x_ID:58
	End case 
	
	If (MiFieldNumber>0)
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=MiTableNumber; *)
		QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableFieldNum:12=MiFieldNumber; *)
		QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=MiFieldValue)
		QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]Deleted:10=0)
		// Filters out 'deleted' records
		ORDER BY:C49([INFORMATION:55]; [INFORMATION:55]Group:2)
		//The significant fields you should use from this are
		//[INFORMATION]Group
		//[INFORMATION]SubGroup
		
		//you may also want
		//[INFORMATION]Year
		//[INFORMATION]Quality_Level
		//[INFORMATION]Description
	End if 
	
End if 
ERR_MethodTrackerReturn("INF_GetQualities"; $_t_oldMethodName)