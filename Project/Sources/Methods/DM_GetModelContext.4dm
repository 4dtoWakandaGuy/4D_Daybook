//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_GetModelContext
	//------------------ Method Notes ------------------
	//pass this method a Data model ID
	//it will return the context
	//THE WHAT????
	//the context
	//eg 25=orders(orders and order items)
	//2=Customers(Contacts and companies)
	//these are flattened 'tables'
	//that may come from the source as a single entity
	//and from a datamodelling point of view are displayed as a 'flat file'`
	// or rather a flat view of several files
	//the concept can be extended to cover lots of possible views
	//and we could add on at  some point in the future customisable views
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_GetModelContext")

$0:=0
If (Count parameters:C259>=1)
	If ($1>0)
		//all the records in the map will have the same context
		QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=$1)
		If (Records in selection:C76([EW_BK_FieldMap:121])>0)
			$0:=[EW_BK_FieldMap:121]x_DestinationContext:8
		End if 
	End if 
End if 
REDUCE SELECTION:C351([EW_BK_FieldMap:121]; 0)


//
ERR_MethodTrackerReturn("DM_GetModelContext"; $_t_oldMethodName)