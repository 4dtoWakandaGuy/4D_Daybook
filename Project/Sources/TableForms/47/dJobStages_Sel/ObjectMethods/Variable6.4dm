If (False:C215)
	//object Name: [JOB_STAGES]dJobStages_Sel.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].dJobStages_Sel.Variable6"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vCompCode; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].dJobStages_Sel.Variable6"; $_t_oldMethodName)
