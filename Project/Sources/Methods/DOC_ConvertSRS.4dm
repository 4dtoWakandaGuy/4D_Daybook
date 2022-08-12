//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_ConvertSRS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2010 20:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(SR_blb_AreaBLOB)
	C_LONGINT:C283($_l_index)
	C_PICTURE:C286(SRPicture)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_ConvertSRS")
READ WRITE:C146([DOCUMENTS:7])
ALL RECORDS:C47([DOCUMENTS:7])
For ($_l_index; 1; Records in selection:C76([DOCUMENTS:7]))
	
	If ([DOCUMENTS:7]Document_Code:1="SR@")
		SRPicture:=[DOCUMENTS:7]Write_:5
		SET BLOB SIZE:C606(SR_blb_AreaBLOB; 0)
		//PICTURE TO BLOB(SRPicture;SR_blb_AreaBLOB)
		[DOCUMENTS:7]SR_DOCUMENT_:4:=SR_blb_AreaBLOB
	End if 
	NEXT RECORD:C51([DOCUMENTS:7])
	
End for 
ERR_MethodTrackerReturn("DOC_ConvertSRS"; $_t_oldMethodName)