If (False:C215)
	//object Name: [USER]User_In.SR_EmailPrintOptionOth20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.SR_EmailPrintOptionOth20"; Form event code:C388)

If (Form event code:C388=On Clicked:K2:4)
	DOC_t_OutputFolderPath:=DB_SelectFolder("Select the output folder for PDFs")
End if 

ERR_MethodTrackerReturn("OBJ [USER].User_In.SR_EmailPrintOptionOth20"; $_t_oldMethodName)
