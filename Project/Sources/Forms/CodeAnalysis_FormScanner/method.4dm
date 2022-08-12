If (False:C215)
	//Project Form Method Name: CodeAnalysis_FormScanner
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2012 14:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Subform1)
	C_BOOLEAN:C305($vb_noResult)
	C_LONGINT:C283(CA_l_tableNo; CA_vl_tableNo)
	C_TEXT:C284($_t_oldMethodName; CA_ACTION; CA_t_ACTION; CA_t_FormName; CA_vt_FormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM CodeAnalysis_FormScanner"; Form event code:C388)


If (Form event code:C388=On Load:K2:1)
	SET TIMER:C645(1)
End if 

Case of 
	: (CA_t_ACTION="close")
		CANCEL:C270
		
		
	: (CA_t_ACTION="setForm")
		If (CA_l_tableNo>0)
			OBJECT SET SUBFORM:C1138(Subform1; Table:C252(CA_l_tableNo)->; CA_t_FormName)
		Else 
			OBJECT SET SUBFORM:C1138(Subform1; CA_t_FormName)
		End if 
		CA_t_ACTION:="scanForm"  // Signal to do next action
		
		
	: (CA_t_ACTION="scanForm")
		EXECUTE METHOD IN SUBFORM:C1085("Subform1"; "CA_SaveFormProperties"; $vb_noResult; CA_l_tableNo; CA_t_FormName)
		CA_t_ACTION:=""
		
End case 
ERR_MethodTrackerReturn("FM CodeAnalysis_FormScanner"; $_t_oldMethodName)
