//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_userGetReportTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 09:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_DocTypeArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userGetReportTypes")

$_ptr_DocTypeArray:=$1

Case of 
	: (Is nil pointer:C315($_ptr_DocTypeArray))
		
	: (Type:C295($_ptr_DocTypeArray->)#String array:K8:15) & (Type:C295($_ptr_DocTypeArray->)#Text array:K8:16)
		
	Else   //load different types of documents/reports available
		
		ARRAY TEXT:C222($_ptr_DocTypeArray->; 6)
		
		$_ptr_DocTypeArray->{1}:="Quotation Form"
		$_ptr_DocTypeArray->{2}:="Order Authorisation"
		$_ptr_DocTypeArray->{3}:="Order Acknowledgement"
		$_ptr_DocTypeArray->{4}:="Full Order Details"
		$_ptr_DocTypeArray->{5}:="Enquiry Form"
		$_ptr_DocTypeArray->{6}:="Purchase Order"
		
		SORT ARRAY:C229($_ptr_DocTypeArray->)
		$_ptr_DocTypeArray->:=1
End case 
ERR_MethodTrackerReturn("Doc_userGetReportTypes"; $_t_oldMethodName)