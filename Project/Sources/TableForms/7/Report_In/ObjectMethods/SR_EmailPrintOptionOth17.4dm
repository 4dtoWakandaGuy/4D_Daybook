If (False:C215)
	//object Name: [DOCUMENTS]Report_in.SR_EmailPrintOptionOth17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DOC_t_OutputFolderPath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Report_in.SR_EmailPrintOptionOth17"; Form event code:C388)

If (Form event code:C388=On Clicked:K2:4)
	DOC_t_OutputFolderPath:=DB_SelectFolder("Select the output folder for PDFs")
End if 

ERR_MethodTrackerReturn("OBJ:Report_in,SYS_btn_OutFolder"; $_t_oldMethodName)
