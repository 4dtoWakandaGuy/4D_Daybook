//%attributes = {}
If (False:C215)
	//Project Method Name:      UseInvoiceDetailsIfPossible
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
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UseInvoiceDetailsIfPossible")

//added 12/06/07, kmw
//function for calling Comp_DetailsI
//can be used by  4D Write templates as a way of resetting vDetails infromation to use company's Invoice Address if it exists
//(basically means we can specify at the template level that a letter should use invoice address...otherwise must rely on hard code calling routine to KNOW that the letter it is about to print should use alternate address - and unfortunately the calling rotuines don't always allow for this)

//
Comp_DetailsI
//
$0:=""
ERR_MethodTrackerReturn("UseInvoiceDetailsIfPossible"; $_t_oldMethodName)