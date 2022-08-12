//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_userPreferencesIndexGet
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
	C_TEXT:C284($_t_Form; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userPreferencesIndexGet")

$_t_Form:=$1

Case of 
		
	: ($_t_Form="qtn@")
		$0:="Quotation Form"
		
	: ($_t_Form="order")
		$0:="Order Acknowledgement"
		
	: ($_t_Form="qtn@")
		$0:="Quotation Form"
		
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Doc_userPreferencesIndexGet"; $_t_oldMethodName)