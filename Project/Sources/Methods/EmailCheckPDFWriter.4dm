//%attributes = {}
If (False:C215)
	//Project Method Name:      EmailCheckPDFWriter
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
	C_LONGINT:C283($_l_PDF; $0)
	C_REAL:C285($1)
	C_TEXT:C284($_t_ApplicationVersion; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EmailCheckPDFWriter")
//this method will check for the existance of a pdf writer
//  or if this is via 4d 6.7.
//if it is 6.7.1 this will return a 1
//if it has pdf writer(6.5 or 6.71) it will return a 2


$0:=0

//if it is not present there is no point in asking if the user wants to print via
$_l_PDF:=PLUGCALL_PDFs("CheckAvailable")
Case of 
	: ($_l_PDF=995)
	: ($_l_PDF=0)
		$0:=2
	Else 
		$_t_ApplicationVersion:=Application version:C493
		Case of 
			: (Num:C11($_t_ApplicationVersion[[2]])>6)  //V7 ????(Just so i dont need to modify again
				If (Documents_4DWriteAccessType(False:C215)="W@")
					$0:=1
				Else 
					$0:=0
				End if 
			: (Num:C11($_t_ApplicationVersion[[3]])>=7)  //V6.7 or above
				If (Documents_4DWriteAccessType(False:C215)="W@")
					$0:=1
				Else 
					$0:=0
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("EmailCheckPDFWriter"; $_t_oldMethodName)