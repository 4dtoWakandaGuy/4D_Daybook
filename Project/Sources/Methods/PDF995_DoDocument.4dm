//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_DoDocument
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 16:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodCalledonErrorOLD; $_t_oldMethodName; $1; $2; $3; $4; PDF995_DocumentOperation; PDF995_Param1; PDF995_Param2; PDF995_Param3; PDF995_Param4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_DoDocument")

//PDF995_DoDocument

//Added kmw, 29/10/08 v631b120c - So it's easier to display/get information in the event of a File Access Error.
//
//

//
PDF995_DocumentOperation:=$1
If (Count parameters:C259>1)
	PDF995_Param1:=$2
Else 
	PDF995_Param1:=""
End if 
If (Count parameters:C259>2)
	PDF995_Param2:=$3
Else 
	PDF995_Param2:=""
End if 
If (Count parameters:C259>3)
	PDF995_Param3:=$4
Else 
	PDF995_Param3:=""
End if 

//
//
$_t_MethodCalledonErrorOLD:=Method called on error:C704
If ($_t_MethodCalledonErrorOLD="")
	ON ERR CALL:C155("")
End if 

Case of 
	: (PDF995_DocumentOperation="COPY DOCUMENT")
		If (PDF995_Param3="*")
			COPY DOCUMENT:C541(PDF995_Param1; PDF995_Param2; *)
		Else 
			COPY DOCUMENT:C541(PDF995_Param1; PDF995_Param2; *)
		End if 
		
	: (PDF995_DocumentOperation="MOVE DOCUMENT")
		MOVE DOCUMENT:C540(PDF995_Param1; PDF995_Param2)
		
	: (PDF995_DocumentOperation="DELETE DOCUMENT")
		DELETE DOCUMENT:C159(PDF995_Param1)
		
	Else 
		
End case 

If ($_t_MethodCalledonErrorOLD="")
	ON ERR CALL:C155($_t_MethodCalledonErrorOLD)  //ie set back to blank
End if 

PDF995_DocumentOperation:=""
PDF995_Param1:=""
PDF995_Param2:=""
PDF995_Param3:=""
ERR_MethodTrackerReturn("PDF995_DoDocument"; $_t_oldMethodName)
