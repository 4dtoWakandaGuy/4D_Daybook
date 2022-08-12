//%attributes = {}
If (False:C215)
	//Project Method Name:      Forms_Tit567
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
	C_TEXT:C284($_t_oldMethodName; vTitle5; vTitle6; vTitle7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms_Tit567")
vTitle5:=Term_VATWT("Total excl VAT ")
vTitle6:=Term_VATWT("VAT Total ")
vTitle7:="GRAND TOTAL "
ERR_MethodTrackerReturn("Forms_Tit567"; $_t_oldMethodName)