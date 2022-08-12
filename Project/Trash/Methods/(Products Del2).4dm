//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products Del2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2010 12:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products Del2")
If (Count parameters:C259>=1)
	READ WRITE:C146([COMPONENTS:86])
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
	APPLY TO SELECTION:C70([COMPONENTS:86]; [COMPONENTS:86]X_ProductNoLongeravailable:5:=$1)
	READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
	QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1)
	APPLY TO SELECTION:C70([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]xRecordDeleted:3:=$1)
	
	CustomFields_Delete(->[PRODUCTS:9]; $1)
	
End if 
ERR_MethodTrackerReturn("Products Del2"; $_t_oldMethodName)