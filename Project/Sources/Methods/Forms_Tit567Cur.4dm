//%attributes = {}
If (False:C215)
	//Project Method Name:      Forms_Tit567Cur
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
	C_TEXT:C284($_t_oldMethodName; $1; vTitle25; vTitle26; vTitle27; vTitle5; vTitle6; vTitle7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms_Tit567Cur")
//Forms_Tit567Cur
vTitle5:=Term_VATWT("Total excl VAT "+$1)
vTitle6:=Term_VATWT("VAT Total "+$1)
vTitle7:="GRAND TOTAL "+$1
//for Euro Calcs
vTitle25:=Term_VATWT("Total excl VAT "+$1+"/"+"€")
vTitle26:=Term_VATWT("VAT Total "+$1+"/"+"€")
vTitle27:="GRAND TOTAL "+$1+"/"+"€"
ERR_MethodTrackerReturn("Forms_Tit567Cur"; $_t_oldMethodName)