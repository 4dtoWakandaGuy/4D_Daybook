//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_RandomSizing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_RelatedcallCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyNames;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedcostingJobCodes;0)
	//ARRAY TEXT(SD2_at_RelatedInvoiceCodes;0)
	//ARRAY TEXT(SD2_at_RelatedOrderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedPICodes;0)
	//ARRAY TEXT(SD2_at_RelatedProductCodes;0)
	//ARRAY TEXT(SD2_at_RelatedPurchorderCodes;0)
	//ARRAY TEXT(SD2_at_RelatedStageCodes;0)
	//ARRAY TEXT(SD2_at_RelatedstockCodes;0)
	C_LONGINT:C283($_l_ArraySIze; SD2_l_HideAgencyJobs; SD2_l_HideCalls; SD2_l_HideCompanies; SD2_l_HideContacts; SD2_l_HidecostingJobs; SD2_l_Hideevents; SD2_l_HideInvoices; SD2_l_HideOrders; SD2_l_HidePIs; SD2_l_HideProducts)
	C_LONGINT:C283(SD2_l_HidePurchorders; SD2_l_HideStages; SD2_l_Hidestocks)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_RandomSizing")

//NG March 2008. This method is so i can test the complexity of a screen without doing thousands of manual tests
$_l_ArraySIze:=0
ARRAY LONGINT:C221(SD2_al_RelationTypesS; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedCompanyNames; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedContactsCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedOrderCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedInvoiceCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedPurchorderCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedPICodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedcostingJobCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedStageCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedcallCodes; $_l_ArraySIze)
ARRAY TEXT:C222(SD2_at_RelatedstockCodes; $_l_ArraySIze)

ARRAY TEXT:C222(SD2_at_RelatedProductCodes; $_l_ArraySIze)
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideCompanies:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideContacts:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideOrders:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideInvoices:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HidePurchorders:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HidePIs:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideAgencyJobs:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HidecostingJobs:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideCalls:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideStages:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_Hidestocks:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_Hideevents:=$_l_ArraySIze
$_l_ArraySIze:=(Random:C100%(2))+0
SD2_l_HideProducts:=$_l_ArraySIze

$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedCompanyNames; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedContactsCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedOrderCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedInvoiceCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedPurchorderCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedPICodes; $_l_ArraySIze)
End if 

$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedcostingJobCodes; $_l_ArraySIze)
End if 

$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedStageCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedcallCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedstockCodes; $_l_ArraySIze)
End if 

$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
	ARRAY TEXT:C222(SD2_at_RelatedProductCodes; $_l_ArraySIze)
End if 
$_l_ArraySIze:=(Random:C100%(2))+0
If ($_l_ArraySIze=1)
	$_l_ArraySIze:=(Random:C100%(501))+500
End if 
ERR_MethodTrackerReturn("SD2_RandomSizing"; $_t_oldMethodName)
