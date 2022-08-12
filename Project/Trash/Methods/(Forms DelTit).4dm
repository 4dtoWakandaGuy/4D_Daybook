//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Forms DelTit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17)
	C_TEXT:C284(vTitle18; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms DelTit")
vTitle9:="Person"
vTitle10:="Account No"
vTitle8:="Delivery Method"
vTitle2:="Our Ref"
vTitle11:="Your Ref"
vTitle16:="Delivery Date"
vTitle17:="Order Date"
vTitle12:="Description"
vTitle13:="Qty"
vTitle14:="Serial No"
vTitle15:="Signature:   ___________________________________________________________"
vTitle18:="Date:   _______________________________________________________________"
vTitle19:="Print Name:   __________________________________________________________"
vTitle20:="Goods received in good condition"
vTitle:="DELIVERY NOTE"
vTitle1:="Delivery To"
vTitle3:="Delivery No"
vTitle4:="Invoice Date"
ERR_MethodTrackerReturn("Forms DelTit"; $_t_oldMethodName)