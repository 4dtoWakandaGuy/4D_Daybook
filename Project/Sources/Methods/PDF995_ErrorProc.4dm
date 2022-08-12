//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_ErrorProc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2009 05:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; PDF995_DocumentOperation; PDF995_Param1; PDF995_Param2; PDF995_Param3; PDF995_Param4; tErrorMsg)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_ErrorProc")

//PDF995_ErrorProc

//Added kmw, 29/10/08 v631b120c
//
//
//Based on Daybook's "EW_OnErr" Error_Proc which looked pretty full...
//.. featured in terms of reporting file access problems.
//
//Under certain circumstances in PDF995 (e.g...before doing file operations)...
//...the system will check if there if there is already an Error_Proc. If not it will...
//...temporarily set the Error_Proc to this error handler.

//...This error handler has special code for handling file access errors...
//...Similar code could be included in any standard error handling method...
//...if the application already does its own error handling.



//TRACE

tErrorMsg:="Error No. "+String:C10(error)+". "
//************************************************  `Added kmw v631b120c *******************************************************
//(factored this out into its own method so we can call from Daybook's Error_Proc also)
//If (FileErrorTranslate (error;->tErrorMsg)=False)
If (PDF995_FileErrorTranslate(error; ->tErrorMsg)=False:C215)  //Change kmw, 30/10/08 v631b120d- PDF_FileErrorTranslate added in this version and is Identical to FileErrorTranslate...realised that without its own copy of this I had accidentally coupled PDF995 component to Daybook
	tErrorMsg:="Error No. "+String:C10(error)+" occurred."
End if 
//************************************************************************************************************************************

Case of 
	: (PDF995_DocumentOperation="COPY DOCUMENT")
		tErrorMsg:=tErrorMsg+Char:C90(13)
		If (PDF995_Param3="*")
			tErrorMsg:=tErrorMsg+"Tried to copy from '"+PDF995_Param1+"' to '"+PDF995_Param2+"' - (overwrite option was turned on)."
		Else 
			tErrorMsg:=tErrorMsg+"Tried to copy from '"+PDF995_Param1+"' to '"+PDF995_Param2+"' - (overwrite option was turned off)."
		End if 
		
	: (PDF995_DocumentOperation="MOVE DOCUMENT")
		tErrorMsg:=tErrorMsg+Char:C90(13)
		tErrorMsg:=tErrorMsg+"Tried to move from '"+PDF995_Param1+"' to '"+PDF995_Param2+"'."
		
	: (PDF995_DocumentOperation="DELETE DOCUMENT")
		tErrorMsg:=tErrorMsg+Char:C90(13)
		tErrorMsg:=tErrorMsg+"Tried to delete '"+PDF995_Param1+"'."
		
	Else 
		
End case 

PDF995_errorSet(tErrorMsg)  //not sure what the vPDF995_errorText variable is used for but may as well set this

Gen_Alert(tErrorMsg)
ERR_MethodTrackerReturn("PDF995_ErrorProc"; $_t_oldMethodName)