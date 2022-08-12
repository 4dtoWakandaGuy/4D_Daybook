//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_MakeTemplateFromDocument
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_MakeTemplateFromDocument")
//this method will take a letter and make it into a template
If (Count parameters:C259>=1)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1)
	If (Records in selection:C76([DOCUMENTS:7])>0)
		READ WRITE:C146([DOCUMENTS:7])
		DUPLICATE RECORD:C225([DOCUMENTS:7])
		Set_DocumentCode(2; "T")
		[DOCUMENTS:7]Document_Class:14:=Abs:C99([DOCUMENTS:7]Document_Class:14)
		[DOCUMENTS:7]Standard:9:=True:C214
		[DOCUMENTS:7]Document_Status:15:=0
		DB_SaveRecord(->[DOCUMENTS:7])
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DS_MakeTemplateFromDocument"; $_t_oldMethodName)